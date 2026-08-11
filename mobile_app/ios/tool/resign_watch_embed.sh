#!/bin/sh
# Re-sign embedded Watch app with the same identity as the iOS parent app.
# Fixes companion install failing at ~75% when embed copy uses a different cert chain.
set -e
WATCH_APP="${TARGET_BUILD_DIR}/${WRAPPER_NAME}/Watch/ResilNetWatch.app"
if [ ! -d "$WATCH_APP" ]; then
  echo "note: no embedded Watch app at $WATCH_APP"
  exit 0
fi
if [ -z "${EXPANDED_CODE_SIGN_IDENTITY}" ] || [ "${EXPANDED_CODE_SIGN_IDENTITY}" = "-" ]; then
  echo "warning: EXPANDED_CODE_SIGN_IDENTITY unset — skip Watch re-sign"
  exit 0
fi
/usr/bin/codesign --force --sign "${EXPANDED_CODE_SIGN_IDENTITY}" \
  --preserve-metadata=identifier,entitlements,flags \
  --timestamp=none \
  "$WATCH_APP"
echo "Re-signed embedded Watch app: ${EXPANDED_CODE_SIGN_IDENTITY}"
