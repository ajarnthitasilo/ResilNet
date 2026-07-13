// Supabase Edge Function: send-push-signal
// Zero-knowledge trigger — FCM/APNs payload contains metadata ONLY.
//
// Required secrets (Supabase Dashboard → Edge Functions → Secrets):
// - FIREBASE_PROJECT_ID
// - FIREBASE_CLIENT_EMAIL
// - FIREBASE_PRIVATE_KEY (PEM, newlines as \n)
//
// Deploy: supabase functions deploy send-push-signal

import { createClient } from "https://esm.sh/@supabase/supabase-js@2";

const GENERIC_TITLE = "ResilNet";
const GENERIC_BODY = "คุณมีข้อความใหม่";

interface TriggerBody {
  type?: string;
  receiver_id: string;
  sender_id: string;
  message_id: string;
}

async function getGoogleAccessToken(
  clientEmail: string,
  privateKeyPem: string,
): Promise<string> {
  const header = btoa(JSON.stringify({ alg: "RS256", typ: "JWT" }));
  const now = Math.floor(Date.now() / 1000);
  const claim = btoa(
    JSON.stringify({
      iss: clientEmail,
      scope: "https://www.googleapis.com/auth/firebase.messaging",
      aud: "https://oauth2.googleapis.com/token",
      iat: now,
      exp: now + 3600,
    }),
  );
  const unsigned = `${header}.${claim}`;

  const pem = privateKeyPem.replace(/\\n/g, "\n");
  const keyData = pem
    .replace("-----BEGIN PRIVATE KEY-----", "")
    .replace("-----END PRIVATE KEY-----", "")
    .replace(/\s/g, "");
  const binaryKey = Uint8Array.from(atob(keyData), (c) => c.charCodeAt(0));
  const cryptoKey = await crypto.subtle.importKey(
    "pkcs8",
    binaryKey,
    { name: "RSASSA-PKCS1-v1_5", hash: "SHA-256" },
    false,
    ["sign"],
  );
  const signature = await crypto.subtle.sign(
    "RSASSA-PKCS1-v1_5",
    cryptoKey,
    new TextEncoder().encode(unsigned),
  );
  const signedJwt = `${unsigned}.${btoa(String.fromCharCode(...new Uint8Array(signature)))}`;

  const tokenRes = await fetch("https://oauth2.googleapis.com/token", {
    method: "POST",
    headers: { "Content-Type": "application/x-www-form-urlencoded" },
    body: new URLSearchParams({
      grant_type: "urn:ietf:params:oauth:grant-type:jwt-bearer",
      assertion: signedJwt,
    }),
  });
  const tokenJson = await tokenRes.json();
  if (!tokenJson.access_token) {
    throw new Error(`OAuth token error: ${JSON.stringify(tokenJson)}`);
  }
  return tokenJson.access_token as string;
}

Deno.serve(async (req) => {
  if (req.method !== "POST") {
    return new Response("Method not allowed", { status: 405 });
  }

  try {
    const body = (await req.json()) as TriggerBody;
    const { receiver_id, sender_id, message_id } = body;
    if (!receiver_id || !message_id) {
      return new Response(JSON.stringify({ error: "missing fields" }), {
        status: 400,
      });
    }

    const supabase = createClient(
      Deno.env.get("SUPABASE_URL")!,
      Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!,
    );

    const { data: profile, error } = await supabase
      .from("users_profiles")
      .select("fcm_token")
      .eq("user_id", receiver_id)
      .maybeSingle();

    if (error) throw error;
    const fcmToken = profile?.fcm_token as string | undefined;
    if (!fcmToken) {
      return new Response(JSON.stringify({ skipped: "no_token" }), {
        status: 200,
      });
    }

    const projectId = Deno.env.get("FIREBASE_PROJECT_ID");
    const clientEmail = Deno.env.get("FIREBASE_CLIENT_EMAIL");
    const privateKey = Deno.env.get("FIREBASE_PRIVATE_KEY");
    if (!projectId || !clientEmail || !privateKey) {
      return new Response(JSON.stringify({ skipped: "firebase_not_configured" }), {
        status: 200,
      });
    }

    const accessToken = await getGoogleAccessToken(clientEmail, privateKey);

    // Privacy-first: notification title/body are generic; data carries ids only.
    const fcmPayload = {
      message: {
        token: fcmToken,
        notification: {
          title: GENERIC_TITLE,
          body: GENERIC_BODY,
        },
        data: {
          type: body.type ?? "MSG_SIGNAL",
          sender_id: sender_id ?? "",
          message_id: message_id,
        },
        android: { priority: "HIGH" },
        apns: {
          payload: {
            aps: {
              "content-available": 1,
              alert: { title: GENERIC_TITLE, body: GENERIC_BODY },
            },
          },
        },
      },
    };

    const fcmRes = await fetch(
      `https://fcm.googleapis.com/v1/projects/${projectId}/messages:send`,
      {
        method: "POST",
        headers: {
          Authorization: `Bearer ${accessToken}`,
          "Content-Type": "application/json",
        },
        body: JSON.stringify(fcmPayload),
      },
    );

    const fcmJson = await fcmRes.json();
    return new Response(JSON.stringify({ ok: fcmRes.ok, fcm: fcmJson }), {
      status: fcmRes.ok ? 200 : 502,
    });
  } catch (e) {
    return new Response(JSON.stringify({ error: String(e) }), { status: 500 });
  }
});
