#!/usr/bin/env bash
set -euo pipefail

# LinkedIn Post + Comments Fetcher via RapidAPI (linkedin-api8)
# Usage: ./fetch-post-comments.sh <post-url-or-urn> [output-file]
# Example: ./fetch-post-comments.sh https://www.linkedin.com/posts/henryfinkelstein_ai-activity-7181285160586211328-Idxl/
# Example: ./fetch-post-comments.sh 7181285160586211328

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

INPUT="${1:?Usage: $0 <post-url-or-urn> [output-file]}"
OUTPUT="${2:-}"

# Extract URN from URL if full URL provided
# URL format: https://www.linkedin.com/posts/username_topic-activity-7181285160586211328-xxxx/
if [[ "$INPUT" == *"linkedin.com"* ]]; then
  # Extract the activity number (URN)
  URN=$(echo "$INPUT" | grep -oE '[0-9]{19}' | head -1)
  if [[ -z "$URN" ]]; then
    echo "Error: Could not extract URN from URL" >&2
    echo "Expected URL format: .../activity-XXXXXXXXXXXXXXXXXXX-..." >&2
    exit 1
  fi
else
  URN="$INPUT"
fi

# Default output path
if [[ -z "$OUTPUT" ]]; then
  OUTPUT="$PROJECT_ROOT/docs/linkedin/posts/post-$URN.json"
fi

# Ensure output directory exists
mkdir -p "$(dirname "$OUTPUT")"

echo "Fetching post and comments for URN: $URN"

# Fetch post with comments
RESPONSE=$(curl -s -w "\n%{http_code}" \
  --request GET \
  --url "https://real-time-data-enrichment.p.rapidapi.com/get-profile-post-and-comments?urn=$URN" \
  --header "x-rapidapi-host: real-time-data-enrichment.p.rapidapi.com" \
  --header "x-rapidapi-key: $RAPIDAPI_KEY")

HTTP_CODE=$(echo "$RESPONSE" | tail -1)
BODY=$(echo "$RESPONSE" | sed '$d')

case "$HTTP_CODE" in
  200)
    echo "$BODY" | jq '.' > "$OUTPUT"

    # Extract info
    AUTHOR=$(echo "$BODY" | jq -r '.author.firstName + " " + .author.lastName // "Unknown"')
    COMMENT_COUNT=$(echo "$BODY" | jq '.comments | length // 0')
    LIKES=$(echo "$BODY" | jq '.numLikes // 0')

    echo ""
    echo "Author: $AUTHOR"
    echo "Likes: $LIKES"
    echo "Comments: $COMMENT_COUNT"
    echo ""
    echo "Saved to: $OUTPUT"

    # Show post preview
    echo ""
    echo "Post preview:"
    echo "$BODY" | jq -r '.text // "No text"' | head -5
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
