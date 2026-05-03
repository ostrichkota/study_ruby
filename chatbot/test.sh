#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

if [[ -f .env ]]; then
  set -a
  # shellcheck source=/dev/null
  source .env
  set +a
else
  echo "chatbot/.env が見つかりません" >&2
  exit 1
fi

: "${USERID:?USERID を .env に設定してください}"
: "${ACCESS_TOKEN:?ACCESS_TOKEN を .env に設定してください}"

curl -v -X POST https://api.line.me/v2/bot/message/push \
  -H 'Content-Type: application/json' \
  -H "Authorization: Bearer ${ACCESS_TOKEN}" \
  -d "{
    \"to\": \"${USERID}\",
    \"messages\": [
        {
            \"type\": \"text\",
            \"text\": \"Hello, World!\"
        }
    ]
}"
