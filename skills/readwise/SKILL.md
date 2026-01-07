# Readwise Integration

Pull highlights and annotations from Readwise to power personalized POGs.

## When to Invoke

- When crafting content POGs (need highlights for personalized commentary)
- When researching topics (what have I read about X?)
- When preparing for meetings (relevant reading to reference)

## Authentication

**Token:** Store in `.env` as `READWISE_ACCESS_TOKEN`
**Get token:** https://readwise.io/access_token

**Verify token:**
```bash
curl -s -o /dev/null -w "%{http_code}" \
  -H "Authorization: Token $READWISE_ACCESS_TOKEN" \
  https://readwise.io/api/v2/auth/
# Expect: 204
```

## Key API Endpoints

| Endpoint | Purpose |
|----------|---------|
| `GET /api/v2/books/` | List all books/articles |
| `GET /api/v2/books/?category=articles` | List articles only |
| `GET /api/v2/highlights/?book_id=X` | Get highlights for specific item |
| `GET /api/v2/export/` | Full export with pagination |

## Rate Limits

- Standard: 240 req/min
- Highlight/Book LIST: 20 req/min
- Check `Retry-After` header on 429

## Common Workflows

### 1. Find Article by URL or Title

```bash
# Search articles (filter client-side by title/URL)
curl -H "Authorization: Token $READWISE_ACCESS_TOKEN" \
  "https://readwise.io/api/v2/books/?category=articles&page_size=500"
```

Then filter results for matching `source_url` or `title`.

### 2. Get Highlights for Article

```bash
# Once you have book_id from step 1
curl -H "Authorization: Token $READWISE_ACCESS_TOKEN" \
  "https://readwise.io/api/v2/highlights/?book_id=BOOK_ID"
```

### 3. Full Export (for local search)

```bash
curl -H "Authorization: Token $READWISE_ACCESS_TOKEN" \
  "https://readwise.io/api/v2/export/"
```

## POG Workflow

1. **Identify article** you want to share (URL or title)
2. **Find in Readwise** using books endpoint
3. **Pull highlights** for that article
4. **Craft message** with:
   - Link to article
   - 2-3 key highlights that are relevant to recipient
   - Your commentary on why it matters to them
   - Optional: action items or questions

## Utility Scripts

See `utils/readwise/` for helper scripts:
- `get-highlights.sh` - Fetch highlights for an article
- `search-articles.sh` - Find articles by keyword

## Future Enhancements

- [ ] Auto-match articles when logging contact interests
- [ ] Weekly digest of highlights relevant to open relationships
- [ ] Tag-based filtering for POG candidates

---

*API Docs: https://readwise.io/api_deets*
