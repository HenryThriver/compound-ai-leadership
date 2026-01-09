# Watching List

People and companies to monitor for industry intel and opportunity signals.

**Cadence:** Weekly post scrapes (minimum), more frequent during active conversations.

---

## By Company

### Assort Health (Healthcare Voice AI)
*High-priority target company. RevOps Manager role open.*

| Name | Role | LinkedIn | Posts | Signal Value |
|------|------|----------|-------|--------------|
| **Jon Wang** | Co-Founder, Co-CEO | jonxwang | 50 | Company direction, hiring, culture |
| **Jeffery Liu** | Co-Founder, Co-CEO | jefferyliu300 | 0 | (not active poster) |
| **Maura O'Sullivan** | SVP of Ops | maura-osullivan | 18 | Ops strategy, team growth |
| **Greg Rattray** | Head of Revenue Operations | gregrattray | 6 | **Direct RevOps intel, potential boss** |
| **Sarina Kaur Pattar** | Sr. Director AI Deployment & Success | sarina-kaur-pattar | 49 | Customer success, deployment patterns |
| **Andrew Lindbloom** | Director AI Deployment & Success | andrewlindbloom | 25 | Healthcare AI implementation |
| **Alex Huber** | GTM - Partnerships & AI Strategy | alex-huber-41632a118 | 50 | Partnerships, product strategy |

**Last scraped:** 2026-01-10

---

## By Vertical

### Healthcare Voice AI
- Assort Health team (above)
- *(Add more as discovered)*

### Dental/Healthcare Voice AI
- *(Arini team - to be added)*

### Logistics Voice AI
- *(Fleetworks team - to be added)*

### Home Services Voice AI
- *(Netic team - to be added)*

### Customer Support AI
- *(Sierra, Decagon teams - to be added)*

---

## Scraping Workflow

### Weekly Refresh
```bash
# Run every Monday
for user in jonxwang gregrattray maura-osullivan sarina-kaur-pattar andrewlindbloom alex-huber-41632a118; do
  ./utils/linkedin/fetch-posts.sh "$user"
done
```

### What to Look For
- **Hiring signals** - "We're hiring", "Join our team", role announcements
- **Company milestones** - Funding, customer wins, product launches
- **Industry commentary** - Their takes on Voice AI trends
- **Personal updates** - Role changes, promotions, departures
- **Culture signals** - Team events, values, work environment

### Signal → Action
| Signal Type | Action |
|-------------|--------|
| New role posted | Evaluate fit, reach out |
| Funding announced | Expect hiring surge, position yourself |
| Key person departs | Potential opening, or red flag |
| Product launch | Talking point for conversations |
| Industry hot take | Content for your own POV |

---

## Data Storage

Raw data: `docs/linkedin/profiles/{username}/`
- `profile.json` - Profile snapshot
- `posts-YYYY-MM-DD.json` - Posts by date

---

*This watching list feeds industry intel and surfaces opportunities proactively.*
