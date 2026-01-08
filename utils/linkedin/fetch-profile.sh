#!/usr/bin/env bash
set -euo pipefail

# LinkedIn Profile Fetcher via RapidAPI (linkedin-api8)
# Usage: ./fetch-profile.sh <linkedin-url-or-username>
# Example: ./fetch-profile.sh https://www.linkedin.com/in/bnhop/
# Example: ./fetch-profile.sh bnhop

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

INPUT="${1:?Usage: $0 <linkedin-url-or-username>}"

# Extract username from URL if full URL provided
if [[ "$INPUT" == *"linkedin.com"* ]]; then
  # Extract username from URL like https://www.linkedin.com/in/username/
  USERNAME=$(echo "$INPUT" | sed -E 's|.*linkedin\.com/in/([^/?]+).*|\1|')
  LINKEDIN_URL="$INPUT"
else
  USERNAME="$INPUT"
  LINKEDIN_URL="https://www.linkedin.com/in/$USERNAME/"
fi

# Create output directory
OUTPUT_DIR="$PROJECT_ROOT/docs/linkedin/profiles/$USERNAME"
mkdir -p "$OUTPUT_DIR"
OUTPUT="$OUTPUT_DIR/profile.json"

echo "Fetching profile for: $USERNAME"
echo "URL: $LINKEDIN_URL"

# Fetch profile data
RESPONSE=$(curl -s -w "\n%{http_code}" \
  --request GET \
  --url "https://real-time-data-enrichment.p.rapidapi.com/get-profile-data-by-url?url=$(echo "$LINKEDIN_URL" | jq -sRr @uri)" \
  --header "x-rapidapi-host: real-time-data-enrichment.p.rapidapi.com" \
  --header "x-rapidapi-key: $RAPIDAPI_KEY")

HTTP_CODE=$(echo "$RESPONSE" | tail -1)
BODY=$(echo "$RESPONSE" | sed '$d')

case "$HTTP_CODE" in
  200)
    echo "$BODY" | jq '.' > "$OUTPUT"

    # Extract key info for display
    NAME=$(echo "$BODY" | jq -r '.firstName + " " + .lastName // "Unknown"')
    HEADLINE=$(echo "$BODY" | jq -r '.headline // "N/A"')

    echo ""
    echo "Profile: $NAME"
    echo "Headline: $HEADLINE"
    echo ""
    echo "Saved to: $OUTPUT"

    # Record scrape timestamp
    echo "$(date -Iseconds)" > "$OUTPUT_DIR/scraped-at.txt"
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
