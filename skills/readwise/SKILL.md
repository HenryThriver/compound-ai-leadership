# Readwise Integration

Full integration with Readwise (highlights) and Readwise Reader (documents + highlights).

**Henry uses Reader** — all highlighting happens there, so Reader API (v3) is primary.

---

## When to Invoke

- **Content ingestion** — Pull full document + highlights for processing
- **Crafting POGs** — Get highlights for personalized commentary
- **Research** — "What have I read about X?"
- **Meeting prep** — Find relevant reading to reference

---

## Authentication

**Token:** Store in `.env` as `READWISE_ACCESS_TOKEN`
**Get token:** https://readwise.io/access_token
**Works for both:** v2 (Highlights) and v3 (Reader) APIs

**Verify token:**
```bash
curl -s -o /dev/null -w "%{http_code}" \
  -H "Authorization: Token $READWISE_ACCESS_TOKEN" \
  https://readwise.io/api/v2/auth/
# Expect: 204
```

---

## Two APIs

| API | Base URL | Purpose |
|-----|----------|---------|
| **Readwise v2** | `https://readwise.io/api/v2/` | Highlights, books, tags, export |
| **Reader v3** | `https://readwise.io/api/v3/` | Full documents, reading list, document management |

**For content ingestion, use Reader v3** — it has full document content.

---

## Rate Limits

| API | Standard | Notes |
|-----|----------|-------|
| Readwise v2 | 240 req/min | Highlight/Book LIST: 20 req/min |
| Reader v3 | 20 req/min | CREATE/UPDATE: 50 req/min |

Check `Retry-After` header on 429 responses.

---

## Reader API (v3) — PRIMARY

### List Documents

```bash
curl -H "Authorization: Token $READWISE_ACCESS_TOKEN" \
  "https://readwise.io/api/v3/list/"
```

**Key Parameters:**

| Param | Purpose |
|-------|---------|
| `id` | Filter by specific document ID |
| `updatedAfter` | ISO 8601 datetime filter |
| `location` | `new`, `later`, `shortlist`, `archive`, `feed` |
| `category` | `article`, `email`, `rss`, `highlight`, `note`, `pdf`, `epub`, `tweet`, `video` |
| `pageCursor` | Pagination token |
| **`withHtmlContent=true`** | **Returns full document HTML content** |

**Example — Get document with full content:**
```bash
curl -H "Authorization: Token $READWISE_ACCESS_TOKEN" \
  "https://readwise.io/api/v3/list/?id=DOC_ID&withHtmlContent=true"
```

**Response fields:**
- `id`, `url`, `source_url`
- `title`, `author`, `summary`
- `html` (when `withHtmlContent=true`) — **FULL DOCUMENT TEXT**
- `published_date`, `created_at`, `updated_at`
- `reading_progress`, `first_opened_at`, `last_opened_at`
- `location`, `category`, `tags`
- `parent_id` (for highlights/notes, points to source doc)
- `notes`, `site_name`, `word_count`

### Save Document

```bash
curl -X POST \
  -H "Authorization: Token $READWISE_ACCESS_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{"url": "https://example.com/article"}' \
  "https://readwise.io/api/v3/save/"
```

**Parameters:**
- `url` (required)
- `html` — Provide raw HTML instead of fetching
- `title`, `author`, `summary` — Override metadata
- `should_clean_html` — Auto-parse metadata from HTML
- `location` — Where to save (`new`, `later`, `archive`)
- `category`, `tags`, `notes`

### Update Document

```bash
curl -X PATCH \
  -H "Authorization: Token $READWISE_ACCESS_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{"location": "archive"}' \
  "https://readwise.io/api/v3/update/DOC_ID/"
```

**Updatable:** `title`, `author`, `summary`, `location`, `category`, `tags`

### Delete Document

```bash
curl -X DELETE \
  -H "Authorization: Token $READWISE_ACCESS_TOKEN" \
  "https://readwise.io/api/v3/delete/DOC_ID/"
```

### List Tags

```bash
curl -H "Authorization: Token $READWISE_ACCESS_TOKEN" \
  "https://readwise.io/api/v3/tags/"
```

---

## Readwise API (v2) — HIGHLIGHTS

### Export All Highlights

```bash
curl -H "Authorization: Token $READWISE_ACCESS_TOKEN" \
  "https://readwise.io/api/v2/export/"
```

**Parameters:**
- `updatedAfter` — ISO 8601 datetime
- `ids` — Comma-separated book IDs
- `pageCursor` — Pagination

Returns books with their highlights nested.

### List Books/Articles

```bash
curl -H "Authorization: Token $READWISE_ACCESS_TOKEN" \
  "https://readwise.io/api/v2/books/?category=articles"
```

**Filters:** `category`, `source`, `updated__lt/gt`, `last_highlight_at__lt/gt`

### Get Highlights for Book

```bash
curl -H "Authorization: Token $READWISE_ACCESS_TOKEN" \
  "https://readwise.io/api/v2/highlights/?book_id=BOOK_ID"
```

**Highlight fields:**
- `id`, `text`, `note`
- `location`, `location_type`
- `highlighted_at`, `updated`
- `color` (yellow/blue/pink/orange/green/purple)
- `url`, `book_id`

### Create Highlights

```bash
curl -X POST \
  -H "Authorization: Token $READWISE_ACCESS_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{"highlights": [{"text": "...", "title": "...", "source_url": "..."}]}' \
  "https://readwise.io/api/v2/highlights/"
```

### Update Highlight

```bash
curl -X PATCH \
  -H "Authorization: Token $READWISE_ACCESS_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{"note": "Updated note"}' \
  "https://readwise.io/api/v2/highlights/HIGHLIGHT_ID/"
```

**Updatable:** `text`, `note`, `location`, `url`, `color`

### Tag Management

**Add tag to highlight:**
```bash
curl -X POST \
  -H "Authorization: Token $READWISE_ACCESS_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{"name": "gtm"}' \
  "https://readwise.io/api/v2/highlights/HIGHLIGHT_ID/tags/"
```

Same pattern for books: `/api/v2/books/BOOK_ID/tags/`

---

## Content Ingestion Workflow

For processing an article into the knowledge system:

### Step 1: Find Document in Reader

```bash
# Search by URL or browse recent
curl -H "Authorization: Token $READWISE_ACCESS_TOKEN" \
  "https://readwise.io/api/v3/list/?category=article"
```

### Step 2: Get Full Content + Highlights

```bash
# Get document with HTML content
curl -H "Authorization: Token $READWISE_ACCESS_TOKEN" \
  "https://readwise.io/api/v3/list/?id=DOC_ID&withHtmlContent=true"
```

The response includes:
- `html` — Full document text
- Highlights are separate documents with `parent_id` pointing to this doc

### Step 3: Get Highlights for Document

```bash
# Find highlights where parent_id matches
curl -H "Authorization: Token $READWISE_ACCESS_TOKEN" \
  "https://readwise.io/api/v3/list/?category=highlight"
```

Filter results where `parent_id` matches your document ID.

**OR use v2 API:**
```bash
# Find book_id first, then get highlights
curl -H "Authorization: Token $READWISE_ACCESS_TOKEN" \
  "https://readwise.io/api/v2/highlights/?book_id=BOOK_ID"
```

---

## Utility Scripts

| Script | Purpose |
|--------|---------|
| `utils/readwise/get-highlights.sh` | Fetch highlights for an article (v2) |

**TODO:** Add scripts for:
- [ ] `get-document.sh` — Fetch full document with content (v3)
- [ ] `search-reader.sh` — Search Reader library
- [ ] `list-recent.sh` — Recent articles with highlight counts

---

## Known Issues

### Reader v3 API Auth (2026-01-07)

The v3 API endpoints (`/api/v3/list/`, etc.) return auth errors when called via bash scripts, even though the same token works for v2 API.

**Symptoms:**
```json
{"detail": "Invalid token header. No credentials provided."}
```

**Workaround:** For full document content, use Playwright browser tools to scrape the original article URL instead.

**TODO:** Debug the v3 auth flow. The token format should be identical (`Authorization: Token XXX`), but something is off with how it's being passed or parsed.

---

## POG Workflow

1. **Find article** in Reader library
2. **Pull highlights** (what caught your eye)
3. **Craft message:**
   - Link to article
   - 2-3 relevant highlights for recipient
   - Your commentary on why it matters to them

---

## Future Enhancements

- [ ] Auto-match articles to contact interests
- [ ] Weekly POG candidate digest
- [ ] Tag-based filtering for content types
- [ ] Webhook integration for real-time ingestion

---

## API Documentation

- **Readwise v2:** https://readwise.io/api_deets
- **Reader v3:** https://readwise.io/reader_api
