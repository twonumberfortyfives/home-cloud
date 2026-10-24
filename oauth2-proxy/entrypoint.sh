#!/bin/sh
set -e

GOOGLE_CLIENT_ID=$(cat /run/secrets/GOOGLE_CLIENT_ID)
GOOGLE_CLIENT_SECRET=$(cat /run/secrets/GOOGLE_CLIENT_SECRET)

COOKIE_SECRET=$(printf '%s' "$GOOGLE_CLIENT_SECRET" | sha256sum | cut -c1-32)

REDIS_URL="redis://redis:6379"

exec oauth2-proxy \
  --config /oauth2-proxy/oauth2-proxy.cfg \
  --client-id "$GOOGLE_CLIENT_ID" \
  --client-secret "$GOOGLE_CLIENT_SECRET" \
  --cookie-secret "$COOKIE_SECRET" \
  --redis-connection-url "$REDIS_URL" \
  --session-store-type redis