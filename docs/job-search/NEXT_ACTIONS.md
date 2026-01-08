# Job Search: Next Actions

**Start every session here.** Updated: 2026-01-08

---

## Quick Triage

| Priority | What | Due | Time Needed |
|----------|------|-----|-------------|
| **DONE** | ~~Send GTM 3.0 + NFX POGs to Moin/Nikhil~~ | Wed Jan 8 | ✓ |
| **DONE** | ~~Set up LinkedIn scraping workflow~~ | Thu Jan 9 | ✓ |
| **MOSTLY DONE** | Prep for Brooke Hopkins lunch | Fri Jan 10 | 15 min left |
| **THIS WEEK** | Research 6 VoiceAI companies | Fri Jan 10 | 2-3 hrs |
| **THIS WEEK** | Follow up with Moin/Nikhil on intros | Fri Jan 10 | 15 min |
| **THIS WEEK** | Capture 2 networking dinners | After events | 15 min each |
| **FEBRUARY** | Coach K outreach (Ignite reading groups) | Feb 2026 | TBD |
| **BACKLOG** | System improvements | Ongoing | Various |

---

## 1. Time-Sensitive Actions

### POGs Sent (Wed Jan 8) ✓

- [x] **GTM 3.0 (Adam Gross)** to Moin/Nikhil - SENT
- [x] **NFX Voice AI article** to Moin/Nikhil - SENT

### Brooke Hopkins Lunch Prep (Fri Jan 10) - ALMOST READY

**Who:** Founder of Coval (voice AI evals), SF voice AI scene connector
**Goal:** Deep dive on voice AI landscape, companies to watch

**Prep completed:**
- [x] Scrape her LinkedIn profile ✓
- [x] Pull her recent LinkedIn posts (50 posts) ✓
- [x] Research Coval - simulation & eval for AI agents ✓
- [x] Synthesize through Connection Surface Schema ✓
- [x] Generate conversation starters from her posts ✓

**Still need:**
- [ ] Prepare specific questions about voice AI landscape
- [ ] Review companies from Phonic list - get her perspective on: assorthealth, arini, fleetworks, netic, sierra, decagon

**Profile:** `docs/relationships/contacts/cro-revops/brooke-hopkins.md` (fully updated)
**Raw data:** `docs/linkedin/profiles/bnhop/`

### Upcoming Events to Capture

- [ ] **Networking dinner #1** this week - capture afterward
- [ ] **Networking dinner #2** this week - capture afterward

---

## 2. Research Sprint (Due: Fri Jan 10)

Research VoiceAI companies from Phonic intro list. Use `company-scorecard.md` template.

**High Priority (Healthcare - would love to pivot):**
- [ ] **assorthealth.com** - healthcare Voice AI
- [ ] **arini.ai** - healthcare/dental Voice AI

**Medium Priority:**
- [ ] **fleetworks.ai** - logistics (natural progression from CloudTrucks)
- [ ] **netic.ai** - home services (Avoca competitor)
- [ ] **sierra** - customer support (big, famous, they have POC with Phonic)
- [ ] **decagon** - customer support (Moin's college friend connection)

**Lower Priority (skip if short on time):**
- [ ] **ribbon.ai** - HR recruiting
- [ ] **nooks.ai** - coaching

### After Research
- [ ] **Message Moin/Nikhil** with specific intro requests (Fri Jan 10)

---

## 3. Open Loops (Relationships)

From `docs/relationships/loops/open.md`:

| Type | With | What | Status | Due |
|------|------|------|--------|-----|
| POG | Moin/Nikhil | GTM 3.0 article | Ready | Jan 8 |
| POG | Moin/Nikhil | NFX Voice AI | Ready | Jan 8 |
| Intro | Moin/Nikhil | VoiceAI founders | Pending research | Jan 13 |

---

## 4. System & Workflow Build-Out (Backlog)

### LinkedIn Integration ✓
- [x] Set up LinkedIn scraping skill with RapidAPI (UltraAPIs) ✓
- [x] Profile scraping script: `./utils/linkedin/fetch-profile.sh` ✓
- [x] Posts scraping script: `./utils/linkedin/fetch-posts.sh` ✓
- [x] Post + comments script: `./utils/linkedin/fetch-post-comments.sh` ✓
- [x] Connection Surface Schema for extraction: `skills/relationship-building/CONNECTION_SURFACE_SCHEMA.md` ✓
- [x] Skill documentation: `skills/linkedin-scraper/SKILL.md` ✓
- [ ] Set up post monitoring workflow (weekly pulls for POG matching)

### Readwise Integration
- [x] API connected and tested ✓
- [x] `get-highlights.sh` script working ✓
- [ ] Build workflow: contact interests → cross-reference Readwise
- [ ] Auto-surface relevant articles for POG candidates
- [ ] Template for "content + personalized commentary" POGs

### Research Workflow
- [ ] Formalize pre-connection research workflow (baseball card generation)
- [ ] Create company profile template

### Job Search Infrastructure
- [x] Career thesis documented ✓
- [x] Company scorecard template ✓
- [ ] Create industry-landscape.md (Voice AI market map)

---

## 5. Contacts & Profiles

**Current CRO/RevOps Network:** `docs/relationships/contacts/cro-revops/INDEX.md`

| Name | Company | RQ | Last Contact | Status |
|------|---------|-----|--------------|--------|
| Brooke Hopkins | Coval | 2 | Recent | **Lunch Fri** - prep needed |
| Moin Nadeem | Phonic | 2 | 2026-01-06 | POGs pending |
| Nikhil Murthy | Phonic | 2 | 2026-01-06 | POGs pending |
| Jonathan "Coach K" Kvarfordt | - | 1 | 2026-01 | Feb - Ignite reading groups |
| Lesley Carstens | GTM | 1 | 2026-01 | Feb - book club |
| Vini Galera | - | 0 | 2026-01 | Feb - wants to chat |
| Joseph Phillips | Momentum | 0 | 2026-01 | **Promised book review** |

---

## 6. February Horizon (Ignite Book Cluster)

### Coach K - Ignite Reading Groups

- Co-author of Ignite (book I helped co-write)
- Planning reading groups/sessions in February

### Ignite Post Responders

| Name | RQ | Company | Open Loop |
|------|-----|---------|-----------|
| Vini Galera | 0 | - | Wants to chat about book |
| Lesley Carstens | 1 | GTM (Beyond Connections) | Wants to join book club |
| Joseph Phillips | 0 | Momentum (AE) | **Promised book review + questions** |
| Katie Chatterton | 0 | - | **Connect after 1/28** to chat |
| Jak Utley | 0 | - | Wants in on study group |
| Kim McGoldrick | 0 | - | Book club (hasn't read yet) |

### Before February

- [ ] Finish reading Ignite
- [ ] Write book review with questions (promised to Joseph)
- [x] Scrape LinkedIn profiles: Coach K, Vini, Lesley, Joseph ✓ (batch scraped all 11 contacts)
- [ ] Prepare for reading group participation

### Profiles
- `jonathan-kvarfordt.md` | `vini-galera.md` | `lesley-carstens.md` | `joseph-phillips.md` | `katie-chatterton.md` | `jak-utley.md` | `kim-mcgoldrick.md`

---

## Session Notes

**Thursday Jan 9:**
- [x] LinkedIn scraping workflow complete ✓
- [x] Brooke Hopkins profile + posts scraped ✓
- [x] Baseball card synthesized through Connection Surface Schema ✓
- [x] Batch scraped all 11 contacts (profile + posts + baseball card synthesis) ✓
- [ ] Final prep: voice AI questions + Phonic company list

**Friday Jan 10:**
- Brooke lunch (come prepared!)
- **Morning session:**
  1. Build company evaluation framework/worldview
  2. Research VoiceAI companies - identify CRO/VP Sales/RevOps at each target company
  3. Scrape + build baseball cards for key execs at target companies
  4. Pull LinkedIn contacts → find SF event invites (Ronak's criteria)
  5. Reply to Moin/Nikhil with specific intro requests
- **Ronak Gandhi** - Structify founder, SF event host - profile scraped ✓

**Principle:** "Here's a link" is noise. "Here's why this matters to *you*" is a POG.

**Key resources:**
- Career thesis: `docs/job-search/career-thesis.md`
- Company scorecard: `docs/job-search/company-scorecard.md`
- Relationship skill: `skills/relationship-building/SKILL.md`
- Readwise highlights: `./utils/readwise/get-highlights.sh "search term"`

---

## Completed (2026-01-08)

- [x] Send GTM 3.0 + NFX POGs to Moin/Nikhil
- [x] Set up LinkedIn scraping workflow (3 scripts + skill doc)
- [x] Create Connection Surface Schema for relationship signal extraction
- [x] Scrape Brooke Hopkins profile + 50 posts
- [x] Synthesize Brooke's baseball card through Connection Surface Schema
- [x] **Batch scrape all 11 contacts** - profiles + posts + baseball card synthesis:
  - Moin Nadeem, Nikhil Murthy (Phonic)
  - Coach K, Vini Galera, Lesley Carstens, Joseph Phillips
  - Katie Chatterton, Jak Utley, Kim McGoldrick
  - Jeremy Klammer, Michael Salmon

## Completed (2026-01-06)

- [x] Set up `docs/relationships/` structure
- [x] Set up `docs/job-search/` structure
- [x] Create `skills/relationship-building/SKILL.md`
- [x] Draft `career-thesis.md`
- [x] Create `company-scorecard.md` template
- [x] Create baseball cards for Moin & Nikhil (Phonic)
- [x] Create baseball card for Brooke Hopkins (Coval)
- [x] Create baseball card for Coach K (Ignite)
- [x] Log open loops (2 POGs, 1 intro)
- [x] Document VoiceAI companies with interest levels
- [x] Set up Readwise API integration
- [x] Create `get-highlights.sh` script
- [x] Pull NFX article highlights (26 ready)
- [x] Update CLAUDE.md with new resources
