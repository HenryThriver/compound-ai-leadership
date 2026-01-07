#!/bin/bash
# Fetch highlights from Readwise for a specific article
# Usage: ./get-highlights.sh "article title or url"

set -e

# Load environment
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../../.env"

if [ -z "$READWISE_ACCESS_TOKEN" ]; then
    echo "Error: READWISE_ACCESS_TOKEN not set in .env"
    exit 1
fi

SEARCH_TERM="$1"

if [ -z "$SEARCH_TERM" ]; then
    echo "Usage: ./get-highlights.sh \"article title or URL\""
    echo "Example: ./get-highlights.sh \"voice-ai-is-working\""
    exit 1
fi

echo "Searching for articles matching: $SEARCH_TERM"
echo "---"

# Fetch all articles and filter
ARTICLES=$(curl -s -H "Authorization: Token $READWISE_ACCESS_TOKEN" \
    "https://readwise.io/api/v2/books/?category=articles&page_size=500")

# Find matching article (by title or source_url)
BOOK_ID=$(echo "$ARTICLES" | jq -r --arg search "$SEARCH_TERM" '
    .results[] |
    select(.title | ascii_downcase | contains($search | ascii_downcase)) //
    select(.source_url // "" | ascii_downcase | contains($search | ascii_downcase)) |
    .id' | head -1)

if [ -z "$BOOK_ID" ] || [ "$BOOK_ID" == "null" ]; then
    echo "No article found matching: $SEARCH_TERM"
    echo ""
    echo "Recent articles in your library:"
    echo "$ARTICLES" | jq -r '.results[:10][] | "- \(.title)"'
    exit 1
fi

# Get article details
ARTICLE=$(echo "$ARTICLES" | jq --arg id "$BOOK_ID" '.results[] | select(.id == ($id | tonumber))')
TITLE=$(echo "$ARTICLE" | jq -r '.title')
AUTHOR=$(echo "$ARTICLE" | jq -r '.author // "Unknown"')
URL=$(echo "$ARTICLE" | jq -r '.source_url // "N/A"')

echo "Found: $TITLE"
echo "Author: $AUTHOR"
echo "URL: $URL"
echo "Book ID: $BOOK_ID"
echo ""
echo "=== HIGHLIGHTS ==="
echo ""

# Fetch highlights for this article
HIGHLIGHTS=$(curl -s -H "Authorization: Token $READWISE_ACCESS_TOKEN" \
    "https://readwise.io/api/v2/highlights/?book_id=$BOOK_ID&page_size=100")

# Display highlights with notes
echo "$HIGHLIGHTS" | jq -r '.results[] |
    "---\n\(.text)\n" +
    (if .note and .note != "" then "Note: \(.note)\n" else "" end)'

echo ""
echo "=== Summary ==="
HIGHLIGHT_COUNT=$(echo "$HIGHLIGHTS" | jq '.results | length')
echo "Total highlights: $HIGHLIGHT_COUNT"
