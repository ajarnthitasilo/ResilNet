import SwiftUI

private let emerald = Color(red: 0.063, green: 0.725, blue: 0.506)

struct ContentView: View {
  @EnvironmentObject private var session: WatchSessionModel

  var body: some View {
    TabView {
      StatusTab()
      ChatsTab()
    }
    .tabViewStyle(.page)
  }
}

struct StatusTab: View {
  @EnvironmentObject private var session: WatchSessionModel

  var body: some View {
    NavigationStack {
      List {
        Section {
          LabeledContent("Name") {
            Text(session.displayName.isEmpty ? "ResilNet" : session.displayName)
              .foregroundStyle(emerald)
          }
          LabeledContent("ID", value: session.phoneReady ? session.identityShort : "—")
          LabeledContent("Transport", value: session.phoneReady ? session.transport.uppercased() : "—")
          LabeledContent("Online", value: session.phoneReady ? "\(session.onlineCount)" : "—")
          LabeledContent("Unread", value: session.phoneReady ? "\(session.unreadDirects)" : "—")
          LabeledContent("iPhone", value: session.phoneReachable ? "Reachable" : "Away")
          if session.phoneReady, let synced = session.lastSyncedAt {
            LabeledContent("Synced", value: relativeTime(synced))
          } else {
            LabeledContent("Synced", value: "waiting…")
          }
        }

        if !session.hasSnapshot {
          Section {
            Text("Open ResilNet on iPhone once, then Refresh.")
              .font(.caption2)
              .foregroundStyle(.secondary)
          }
        }

        if let err = session.lastError {
          Section {
            Text(err)
              .font(.caption2)
              .foregroundStyle(.orange)
          }
        }

        Section {
          Button {
            session.requestSnapshot()
          } label: {
            if session.refreshing {
              HStack {
                ProgressView()
                Text("Refreshing…")
              }
            } else {
              Label("Refresh", systemImage: "arrow.clockwise")
            }
          }
          .disabled(session.refreshing)
        }
      }
      .navigationTitle("ResilNet")
      .toolbar {
        ToolbarItem(placement: .topBarTrailing) {
          Button {
            session.requestSnapshot()
          } label: {
            if session.refreshing {
              ProgressView()
            } else {
              Image(systemName: "arrow.clockwise")
            }
          }
          .disabled(session.refreshing)
          .accessibilityLabel("Refresh")
        }
      }
    }
  }

  private func relativeTime(_ date: Date) -> String {
    let secs = Int(Date().timeIntervalSince(date))
    if secs < 60 { return "just now" }
    if secs < 3600 { return "\(secs / 60)m ago" }
    if secs < 86400 { return "\(secs / 3600)h ago" }
    return "\(secs / 86400)d ago"
  }
}

struct ChatsTab: View {
  @EnvironmentObject private var session: WatchSessionModel

  var body: some View {
    NavigationStack {
      List {
        if !session.hasSnapshot {
          Text("Waiting for iPhone…")
            .foregroundStyle(.secondary)
          Text("1) Open ResilNet on iPhone\n2) Keep it in foreground\n3) Tap Refresh here")
            .font(.caption2)
            .foregroundStyle(.secondary)
          if let err = session.lastError {
            Text(err)
              .font(.caption2)
              .foregroundStyle(.orange)
          }
          Button {
            session.requestSnapshot()
          } label: {
            if session.refreshing {
              Label("Refreshing…", systemImage: "arrow.clockwise")
            } else {
              Label("Refresh", systemImage: "arrow.clockwise")
            }
          }
          .disabled(session.refreshing)
        } else if !session.phoneReady {
          Text("iPhone app not ready")
            .foregroundStyle(.secondary)
          Text(session.hint.isEmpty
            ? "Open ResilNet on iPhone and keep it open, then Refresh."
            : session.hint)
            .font(.caption2)
            .foregroundStyle(.secondary)
          Button {
            session.requestSnapshot()
          } label: {
            Label("Refresh", systemImage: "arrow.clockwise")
          }
          .disabled(session.refreshing)
        } else if session.chats.isEmpty {
          Text("No Direct chats yet")
            .foregroundStyle(.secondary)
          Text("Start a chat on iPhone first.")
            .font(.caption2)
            .foregroundStyle(.secondary)
          Button {
            session.requestSnapshot()
          } label: {
            Label("Refresh", systemImage: "arrow.clockwise")
          }
          .disabled(session.refreshing)
        } else {
          ForEach(session.chats) { chat in
            NavigationLink {
              ThreadView(chat: chat)
            } label: {
              VStack(alignment: .leading, spacing: 2) {
                HStack {
                  Text(chat.name)
                    .fontWeight(.semibold)
                  Spacer()
                  if chat.unread > 0 {
                    Text("\(chat.unread)")
                      .font(.caption2)
                      .padding(.horizontal, 6)
                      .padding(.vertical, 2)
                      .background(emerald.opacity(0.25))
                      .clipShape(Capsule())
                  }
                }
                Text(chat.lastPreview.isEmpty ? "—" : chat.lastPreview)
                  .font(.caption2)
                  .foregroundStyle(.secondary)
                  .lineLimit(2)
              }
            }
          }
        }
      }
      .navigationTitle("Chats")
      .toolbar {
        ToolbarItem(placement: .topBarTrailing) {
          Button {
            session.requestSnapshot()
          } label: {
            Image(systemName: "arrow.clockwise")
          }
          .disabled(session.refreshing)
          .accessibilityLabel("Refresh")
        }
      }
    }
  }
}

struct ThreadView: View {
  @EnvironmentObject private var session: WatchSessionModel
  let chat: WatchChat

  @State private var draft = ""
  @State private var statusNote: String?

  private let quickReplies = ["OK", "On my way", "Busy", "Call me", "👍"]

  private var liveChat: WatchChat {
    session.chats.first(where: { $0.peerId == chat.peerId }) ?? chat
  }

  var body: some View {
    List {
      Section {
        ForEach(Array(liveChat.messages.suffix(12))) { msg in
          HStack {
            if msg.fromMe { Spacer(minLength: 8) }
            Text(msg.text.isEmpty ? "…" : msg.text)
              .font(.caption2)
              .padding(6)
              .background(msg.fromMe ? emerald.opacity(0.35) : Color.white.opacity(0.08))
              .cornerRadius(8)
            if !msg.fromMe { Spacer(minLength: 8) }
          }
          .listRowBackground(Color.clear)
        }
      }

      Section("Quick reply") {
        ForEach(quickReplies, id: \.self) { phrase in
          Button(phrase) {
            send(phrase)
          }
          .disabled(session.sending)
        }
      }

      Section {
        TextField("Short message", text: $draft)
          .textInputAutocapitalization(.never)
          .submitLabel(.send)
          .onSubmit { send(draft) }
        Button {
          send(draft)
        } label: {
          if session.sending {
            Label("Sending…", systemImage: "paperplane")
          } else {
            Label("Send", systemImage: "paperplane.fill")
          }
        }
        .disabled(
          session.sending
            || draft.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        )

        Button {
          session.openChatOnPhone(peerId: chat.peerId)
          statusNote = session.phoneReachable
            ? "Opening on iPhone…"
            : "Queued for iPhone"
        } label: {
          Label("Open on iPhone", systemImage: "iphone")
        }
      }

      if session.sending {
        Section {
          ProgressView("Sending…")
        }
      }

      if let statusNote {
        Section {
          Text(statusNote)
            .font(.caption2)
            .foregroundStyle(.secondary)
        }
      }
      if let err = session.lastError, statusNote != err {
        Section {
          Text(err)
            .font(.caption2)
            .foregroundStyle(.orange)
        }
      }
    }
    .navigationTitle(liveChat.name)
  }

  private func send(_ text: String) {
    let trimmed = text.trimmingCharacters(in: .whitespacesAndNewlines)
    guard !trimmed.isEmpty else { return }
    statusNote = "Sending…"
    session.sendShortText(peerId: chat.peerId, text: trimmed) { ok in
      if ok {
        draft = ""
        statusNote = session.lastError?.contains("Queued") == true
          ? "Queued"
          : "Sent"
      } else {
        statusNote = session.lastError ?? "Failed"
      }
    }
  }
}
