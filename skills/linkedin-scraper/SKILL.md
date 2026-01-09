# LinkedIn Scraper

Fetch LinkedIn profiles, posts, and comments via RapidAPI. Raw data is stored locally and synthesized into contact baseball cards.

## When to Invoke

- Before meeting someone new (prep research)
- When onboarding a new contact to the system
- Quarterly refresh of key contacts
- When you need to understand what someone's been posting about

## Setup

1. Get API key from RapidAPI: https://rapidapi.com/ultraapis-ultraapis/api/real-time-data-enrichment
2. Add to `.env`:
   ```
   RAPIDAPI_KEY=your_key_here
   ```

## Related Resources

- **Connection Surface Schema:** `skills/relationship-building/CONNECTION_SURFACE_SCHEMA.md`
  - Defines all fields to extract from any content source
  - Includes confidence, source tracking, and POG mapping

## Scripts

### Fetch Profile
```bash
./utils/linkedin/fetch-profile.sh <linkedin-url-or-username>

# Examples:
./utils/linkedin/fetch-profile.sh https://www.linkedin.com/in/bnhop/
./utils/linkedin/fetch-profile.sh bnhop
```

Returns: Full profile data (headline, experience, education, skills, about)
Saves to: `docs/linkedin/profiles/{username}/profile.json`

### Fetch Recent Posts
```bash
./utils/linkedin/fetch-posts.sh <username> [start]

# Examples:
./utils/linkedin/fetch-posts.sh bnhop        # First 50 posts
./utils/linkedin/fetch-posts.sh bnhop 50     # Next 50 posts
```

Returns: User's recent LinkedIn posts
Saves to: `docs/linkedin/profiles/{username}/posts-YYYY-MM-DD.json`

### Fetch Post with Comments
```bash
./utils/linkedin/fetch-post-comments.sh <post-url-or-urn>

# Examples:
./utils/linkedin/fetch-post-comments.sh https://www.linkedin.com/posts/henryfinkelstein_ai-activity-7181285160586211328-Idxl/
./utils/linkedin/fetch-post-comments.sh 7181285160586211328
```

Returns: Post content + all comments
Saves to: `docs/linkedin/posts/post-{urn}.json`

### Fetch Company Posts
```bash
./utils/linkedin/fetch-company-posts.sh <company-username> [start]

# Examples:
./utils/linkedin/fetch-company-posts.sh assorthealth      # First 50 posts
./utils/linkedin/fetch-company-posts.sh fleetworksai 50   # Next 50 posts
```

Returns: Company page's recent posts (official announcements, funding, hiring)
Saves to: `docs/linkedin/companies/{company}/posts-YYYY-MM-DD.json`

Use for: Monitoring watched companies for funding news, product launches, job postings

---

## Workflows

### 1. Full Contact Research (Pre-Meeting Prep)

When preparing for a meeting with someone:

```bash
# 1. Fetch their profile
./utils/linkedin/fetch-profile.sh <linkedin-url>

# 2. Fetch their recent posts
./utils/linkedin/fetch-posts.sh <username>
```

Then ask Claude to:
1. Read the raw JSON files
2. Synthesize into their baseball card
3. Identify conversation topics from their recent posts
4. Surface POG opportunities based on their interests

### 2. Specific Post Analysis

When you want to understand a post and its engagement (e.g., your own post, or someone else's for voice analysis):

```bash
./utils/linkedin/fetch-post-comments.sh <post-url>
```

Use cases:
- Analyze what resonated in comments (for your posts)
- Understand someone's audience and engagement style
- Find commenters who might be good connections

### 3. Connection Surface Extraction

After fetching raw data, pass it through the Connection Surface Schema to extract all signal.

**Input:** Raw JSON in `docs/linkedin/profiles/{username}/`
**Schema:** `skills/relationship-building/CONNECTION_SURFACE_SCHEMA.md`
**Output:** Updated contact file in `docs/relationships/contacts/*/`

**Extraction Process:**

1. **Load raw data** - profile.json and posts-*.json
2. **Extract fields** - Use the Connection Surface Schema categories:
   - Content POG Surface (topics, influences, preferences)
   - Entertainment & Lifestyle Surface (hobbies, media, food)
   - Gift POG Surface (wishlist, family info, brands)
   - Event POG Surface (location, travel, events)
   - Intro POG Surface (network needs, alumni)
   - Timing POG Surface (dates, milestones)
   - Signal POG Surface (values, style, quirks)
   - Negative Space (dislikes, things to avoid)
3. **Annotate each field** with:
   - `confidence`: high/medium/low
   - `frequency`: how often mentioned
   - `observed_or_inferred`: was it stated or deduced?
   - `source`: linkedin_profile or linkedin_post + date
4. **Update baseball card** - merge new data with existing profile
5. **Flag changes** - note what's new or different from last scrape

**Synthesis Prompt:**

```
Read the LinkedIn profile and posts data for {name}.

Using the Connection Surface Schema, extract all fields that have signal.
For each field:
- Note confidence level (high/medium/low)
- Note if observed or inferred
- Note source (profile vs which post)

Then update their baseball card with the extracted data.
Highlight:
- Key conversation topics for next meeting
- POG opportunities by type (content, gift, event, intro, timing)
- Any changes since last scrape
```

### 4. Quarterly Contact Refresh

For key contacts (RQ 3+), refresh their profile quarterly:

```bash
# Batch refresh
for user in bnhop moinnadeem nikhilmurthy; do
  ./utils/linkedin/fetch-profile.sh "$user"
  ./utils/linkedin/fetch-posts.sh "$user"
done
```

Review what's changed:
- New role? → conversation starter
- New posts? → POG opportunities
- Shift in focus? → update baseball card

---

## Data Storage Structure

```
docs/linkedin/
├── profiles/                      # Individual people
│   └── {username}/
│       ├── profile.json           # Latest profile data
│       ├── posts-YYYY-MM-DD.json  # Posts snapshot
│       └── scraped-at.txt         # Last scrape timestamp
├── companies/                     # Company pages (for watching)
│   └── {company}/
│       ├── posts-YYYY-MM-DD.json  # Company posts snapshot
│       └── scraped-at.txt         # Last scrape timestamp
└── posts/
    └── post-{urn}.json            # Individual posts with comments
```

Raw data is kept for reference. The synthesized version lives in the contact's baseball card.

---

## CultivateHQ Integration

This skill is a testing ground for CultivateHQ patterns:

**From CultivateHQ → Here:**
- Professional Context schema (role, company, skills, goals)
- Personal Context schema (interests, milestones)
- Artifact concept (LinkedIn profile/posts as artifacts)
- Timeline tracking (post history)

**Future enhancements:**
- Auto-match Readwise highlights to contact interests
- LinkedIn post → POG candidate pipeline
- Comment network mapping

---

## API Reference

**Endpoint:** `real-time-data-enrichment.p.rapidapi.com`

| Endpoint | Method | Key Params |
|----------|--------|------------|
| `/get-profile-data-by-url` | GET | `url` |
| `/get-profile-posts` | GET | `username`, `start` |
| `/get-profile-post-and-comments` | GET | `urn` |
| `/get-company-posts` | GET | `username`, `start` |

**Rate Limits:** Check RapidAPI dashboard for current limits. PRO plan (~$5/mo) recommended.

---

## Evolution Log

| Date | Change |
|------|--------|
| 2026-01-10 | Added company posts scraping for watching list (industry intel) |
| 2026-01-09 | Added Connection Surface Schema integration for comprehensive extraction |
| 2026-01-09 | Switched to real-time-data-enrichment API (UltraAPIs) |
| 2026-01-09 | Initial skill creation with 3 core scripts |
