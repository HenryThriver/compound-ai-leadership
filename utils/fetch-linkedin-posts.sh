#!/usr/bin/env bash
set -euo pipefail

# LinkedIn Post Fetcher via RapidAPI
# Usage: ./fetch-linkedin-posts.sh <username> [count] [output-file]

# Load environment from project root
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

if [[ -f "$PROJECT_ROOT/.env" ]]; then
  export $(grep -v '^#' "$PROJECT_ROOT/.env" | xargs)
fi

# Validate
if [[ -z "${RAPIDAPI_KEY:-}" ]]; then
  echo "Error: RAPIDAPI_KEY not found in .env" >&2
  echo "Add RAPIDAPI_KEY=your_key_here to $PROJECT_ROOT/.env" >&2
  exit 1
fi

USERNAME="${1:?Usage: $0 <username> [count] [output-file]}"
COUNT="${2:-50}"
OUTPUT="${3:-$PROJECT_ROOT/docs/linkedin/posts/$(date +%Y-%m-%d)-${USERNAME}.json}"

echo "Fetching up to $COUNT posts for @$USERNAME..."

# Ensure output directory exists
mkdir -p "$(dirname "$OUTPUT")"

# Fetch with error handling
RESPONSE=$(curl -s -w "\n%{http_code}" \
  -H "x-rapidapi-key: $RAPIDAPI_KEY" \
  -H "x-rapidapi-host: real-time-data-enrichment.p.rapidapi.com" \
  "https://real-time-data-enrichment.p.rapidapi.com/get-profile-posts?username=$USERNAME&start=0")

HTTP_CODE=$(echo "$RESPONSE" | tail -1)
BODY=$(echo "$RESPONSE" | sed '$d')

case "$HTTP_CODE" in
  200)
    echo "$BODY" | jq '.' > "$OUTPUT"
    POST_COUNT=$(echo "$BODY" | jq '.data | length')
    echo "✓ Saved $POST_COUNT posts to $OUTPUT"
    ;;
  429)
    echo "Error: Rate limit exceeded. Wait and try again." >&2
    exit 1
    ;;
  401|403)
    echo "Error: Authentication failed. Check RAPIDAPI_KEY." >&2
    exit 1
    ;;
  *)
    echo "Error: HTTP $HTTP_CODE" >&2
    echo "$BODY" >&2
    exit 1
    ;;
esac
