#!/usr/bin/env bash
set -euo pipefail

# LinkedIn Posts Fetcher via RapidAPI (linkedin-api8)
# Usage: ./fetch-posts.sh <username> [start]
# Example: ./fetch-posts.sh bnhop
# Example: ./fetch-posts.sh bnhop 50  # Page 2

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"

# Load environment
if [[ -f "$PROJECT_ROOT/.env" ]]; then
  export $(grep -v '^#' "$PROJECT_ROOT/.env" | xargs)
fi

# Validate API key
if [[ -z "${RAPIDAPI_KEY:-}" ]]; then
  echo "Error: RAPIDAPI_KEY not found in .env" >&2
  echo "Add RAPIDAPI_KEY=your_key_here to $PROJECT_ROOT/.env" >&2
  exit 1
fi

USERNAME="${1:?Usage: $0 <username> [start]}"
START="${2:-0}"

# Create output directory
OUTPUT_DIR="$PROJECT_ROOT/docs/linkedin/profiles/$USERNAME"
mkdir -p "$OUTPUT_DIR"
OUTPUT="$OUTPUT_DIR/posts-$(date +%Y-%m-%d).json"

echo "Fetching posts for: @$USERNAME (start=$START)"

# Build URL with optional pagination
URL="https://real-time-data-enrichment.p.rapidapi.com/get-profile-posts?username=$USERNAME"
if [[ "$START" != "0" ]]; then
  URL="$URL&start=$START"
fi

# Fetch posts
RESPONSE=$(curl -s -w "\n%{http_code}" \
  --request GET \
  --url "$URL" \
  --header "x-rapidapi-host: real-time-data-enrichment.p.rapidapi.com" \
  --header "x-rapidapi-key: $RAPIDAPI_KEY")

HTTP_CODE=$(echo "$RESPONSE" | tail -1)
BODY=$(echo "$RESPONSE" | sed '$d')

case "$HTTP_CODE" in
  200)
    echo "$BODY" | jq '.' > "$OUTPUT"

    # Count posts
    POST_COUNT=$(echo "$BODY" | jq '.data | length // 0')
    PAGINATION_TOKEN=$(echo "$BODY" | jq -r '.paginationToken // "none"')

    echo ""
    echo "Fetched $POST_COUNT posts"
    echo "Saved to: $OUTPUT"

    if [[ "$PAGINATION_TOKEN" != "none" && "$PAGINATION_TOKEN" != "null" ]]; then
      echo ""
      echo "More posts available. Next page:"
      echo "  ./fetch-posts.sh $USERNAME $((START + 50))"
    fi

    # Show recent post titles
    echo ""
    echo "Recent posts:"
    echo "$BODY" | jq -r '.data[:5][] | "- " + (.text // "No text")[0:80] + "..."' 2>/dev/null || echo "  (check JSON for structure)"
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
