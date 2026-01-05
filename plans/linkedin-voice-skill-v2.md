# LinkedIn Voice Development Skill (v2)

## Overview

A skill that compounds your LinkedIn posting voice through analysis, style guide development, and conversational drafting. Revised based on reviewer feedback.

**Core thesis:** Your LinkedIn voice should compound over time—but start by proving value with real usage, not infrastructure.

---

## Changes from v1

| Issue | Resolution |
|-------|------------|
| Content in wrong location | User content → `docs/linkedin/`, skill → `skills/` |
| Command naming inconsistent | Follow functional patterns: `/analyze-voice`, `/draft-post` |
| Workflows not interactive | Add explicit wait points and recovery |
| API + manual conflated | Separate `/analyze-voice` command for API-based seeding |
| ERD overkill | Removed |
| Image specs bloat | Moved to separate `/review-post-image` skill |
| Acceptance criteria vague | Made testable and specific |

---

## Directory Structure

```
skills/
└── linkedin-voice/
    └── SKILL.md              # Style guide, checklist, voice markers

docs/
└── linkedin/
    ├── posts/
    │   ├── own/              # Your fetched posts (JSON)
    │   └── thought-leaders/  # Admired authors' posts (JSON)
    ├── drafts/               # Work-in-progress
    └── published/            # Finalized posts (for learning loop)

utils/
└── fetch-linkedin-posts.sh   # RapidAPI fetch utility
```

**Why this structure:**
- Skills are portable knowledge (could share your voice guide)
- Docs are project-specific artifacts (your posts, your drafts)
- Separation makes each layer independently useful

---

## Commands

### 1. `/analyze-voice` — Seed Your Brand Voice

**Purpose:** Pull LinkedIn posts (yours + admired authors) and extract voice patterns through collaborative discussion.

**File:** `commands/workflows/analyze-voice.md`

```markdown
---
name: analyze-voice
description: |
  Seed your LinkedIn voice by analyzing recent posts.
  Fetches via RapidAPI, then interactive discussion to extract patterns.
---

# Analyze Voice

## Setup

1. Verify today's date
2. Load `skills/linkedin-voice/SKILL.md` (create if doesn't exist)
3. Check `.env` for RAPIDAPI_KEY

---

## Phase 1: Your Posts

**Ask:** "What's your LinkedIn username?"

[Wait for response]

**Action:** Fetch 50 recent posts via RapidAPI

**If API fails:**
- Tell user the error (rate limit, private profile, etc.)
- Offer alternative: "Paste 5-10 of your best posts instead"

[Wait for paste if needed]

**Save to:** `docs/linkedin/posts/own/YYYY-MM-DD-fetch.json`

**Write progress to SKILL.md** — even if incomplete

---

## Phase 2: Initial Pattern Analysis

Present findings:
- **Hook patterns:** How you typically open (question, bold claim, story, etc.)
- **Structure:** Short punchy vs. longer narrative
- **Length:** Average character count, where you land in the 3000 char limit
- **Formatting:** Line breaks, emojis, bold usage
- **Topics:** What you write about most

**Ask:** "What resonates here? What surprises you? What do you want to change?"

[Wait for response — this is a conversation, 2-3 exchanges minimum]

**Write confirmed observations to SKILL.md**

---

## Phase 3: Admired Authors (Optional)

**Ask:** "Want to analyze someone whose style you admire? (name or skip)"

[Wait for response]

**If yes:**
1. Ask for their LinkedIn username
2. Fetch their 50 posts
3. Save to `docs/linkedin/posts/thought-leaders/[username].json`
4. Present pattern analysis

**Collaborative extraction:**
- "What specifically resonates in their style?"
- "What do they do that you'd never do?"
- "What's one pattern you'd adopt?"

[Wait after each question]

**Write insights to SKILL.md**

**Ask:** "Analyze another author, or move on?"

[Repeat or continue]

---

## Phase 4: Build Style Guide

Based on discussion, draft:
- 5-7 voice markers (what makes you sound like you)
- 3-5 anti-patterns (what you want to avoid)
- Tone positioning (where you sit on professional ↔ casual spectrum)

**Present draft to user**

**Ask:** "Does this capture your voice? What's missing or wrong?"

[Wait for response — revise together]

**Write finalized style guide to SKILL.md**

---

## Phase 5: Constitutional Checklist

**Ask:** "What principles should every post pass before you publish?"

Suggest defaults:
- [ ] Value-first: Would someone thank me for this?
- [ ] Authentic: Would I say this in real conversation?
- [ ] Clear point: Is there one takeaway?

**Ask:** "Add any, remove any, or modify these?"

[Wait for response]

**Write checklist to SKILL.md**

---

## Recovery

If session interrupted:
1. Check `docs/linkedin/posts/` for fetched data
2. Check SKILL.md for progress
3. Resume from last incomplete section
```

---

### 2. `/draft-post` — Conversational Drafting

**Purpose:** Draft a LinkedIn post using your voice guide, with constitutional validation.

**File:** `commands/workflows/draft-post.md`

```markdown
---
name: draft-post
description: |
  Draft a LinkedIn post using your style guide.
  Interactive process with validation against your principles.
---

# Draft Post

## Setup

1. Load `skills/linkedin-voice/SKILL.md`

**If skill doesn't exist:**
"You haven't set up your voice yet. Run /analyze-voice first, or we can do a quick manual setup now."

**Ask:** "Quick setup now, or run /analyze-voice first?"

[Wait — route accordingly]

---

## Phase 1: Intent

**Ask:** "What do you want to post about?"

[Wait for response]

**Ask:** "What's your goal with this post?"
- Educate/teach something
- Share a milestone or win
- Spark discussion
- Share a personal story/lesson
- Something else?

[Wait for response]

**Gut check — Ask:** "On a scale of 1-10, how excited are you about this topic?"

[Wait for response]

**If <5:** "Low energy posts often feel forced. Want to brainstorm a different angle, or continue anyway?"

[Wait for decision]

**Write intent to draft file:** `docs/linkedin/drafts/YYYY-MM-DD-[topic-slug].md`

---

## Phase 2: Generate Draft

Using:
- Voice markers from SKILL.md
- Your stated goal
- Topic/intent

Generate draft adhering to:
- Hook in first 210 characters (before "...see more")
- Your documented tone and formatting patterns
- Your anti-patterns to avoid

**Present draft**

**Ask:** "First reaction? What lands, what feels off?"

[Wait for response — this is collaborative, 2-3 exchanges]

**Revise based on feedback**

**Write current draft to file**

---

## Phase 3: Constitutional Validation

Load checklist from SKILL.md. For each item:

**Read each principle aloud:**
"Checking: Value-first — Would someone thank you for this?"

**Give assessment:** ✅ Pass, ⚠️ Borderline, ❌ Fail

**If borderline or fail:** Explain specifically what's triggering concern.

**Ask:** "Agree with this assessment? Revise, accept as-is, or adjust the checklist?"

[Wait for response]

**If revise:** Return to Phase 2
**If accept:** Document the exception
**If adjust checklist:** Update SKILL.md

**Write validation results to draft file**

---

## Phase 4: Image Prompt

**Ask:** "Does this post need an image or visual?"

[Wait for response]

**If yes:**
"Run /review-post-image after we finalize the text to make sure your image meets LinkedIn specs and complements the post."

[Note in draft file: "Needs image review"]

---

## Phase 5: Finalize

**Present final draft** with:
- Character count (X / 3000)
- Hook preview (first 210 chars)
- Validation status

**Ask:** "Ready to publish, or more changes?"

[Wait for response]

**If ready:**
1. Copy final text (make it easy to grab)
2. Move draft to `docs/linkedin/published/`
3. Ask: "Want to note any hypotheses to validate later?"

**If more changes:** Return to Phase 2

---

## Recovery

If session interrupted:
1. Check `docs/linkedin/drafts/` for in-progress work
2. Read draft file to find last completed phase
3. Resume from there
```

---

### 3. `/review-post-image` — Image Validation

**Purpose:** Ensure post image meets LinkedIn specs and complements the content.

**File:** `commands/workflows/review-post-image.md`

```markdown
---
name: review-post-image
description: |
  Review a post image for LinkedIn specs and content fit.
  Invoke after drafting post text.
---

# Review Post Image

## Setup

**Ask:** "Share or describe the image you're considering for this post"

[Wait — user can paste image, share path, or describe]

---

## Phase 1: Technical Check

**LinkedIn image requirements:**

| Type | Dimensions | Max Size |
|------|------------|----------|
| Square | 1080 x 1080 px | 8 MB |
| Portrait | 1920 x 1080 px | 8 MB |
| Landscape | 1200 x 626 px | 8 MB |

**Check:**
- [ ] Dimensions meet requirements
- [ ] File size under 8 MB
- [ ] Format is PNG or JPG

**If viewing actual image:** Report dimensions and pass/fail

**If URL in post — Link Preview Check:**

"If your post contains a URL, the preview image uses OG tags."

**Requirements:**
- og:image minimum: 1200 x 627 px
- Check via: https://www.linkedin.com/post-inspector/

**Ask:** "Does your URL have proper OG tags? (Run Post Inspector to check)"

[Wait for response]

---

## Phase 2: Content Fit

**If image provided:**

Review against post content:
- Does image reinforce the post's message?
- Is there text on the image? Is it readable at small sizes?
- For photos with faces: Are they cropped appropriately?

**Ask:** "What do you want this image to convey?"

[Wait for response]

**Give feedback:** Does image match stated intent?

---

## Phase 3: Recommendations

Based on review, suggest:
- Crop adjustments if needed
- Alternative image approaches
- Whether image adds value or is unnecessary

**Ask:** "Good to go, or want to adjust?"

[Wait — iterate if needed]
```

---

## SKILL.md Structure

**File:** `skills/linkedin-voice/SKILL.md`

```markdown
# LinkedIn Voice

Your personal style guide for LinkedIn posting. Built through
/analyze-voice and refined through actual usage.

## Usage

Load this skill when:
- Drafting a LinkedIn post (/draft-post)
- Reviewing your voice patterns
- Onboarding a collaborator to your style

---

## Voice Markers

What makes your posts sound like you:

1. [To be populated through /analyze-voice]
2.
3.
4.
5.

---

## Anti-Patterns

What you want to avoid:

- [To be populated]
-
-

---

## Tone

Where you sit on the spectrum:

**Professional ←――――――→ Casual**
[Mark your position]

**Serious ←――――――→ Playful**
[Mark your position]

---

## Constitutional Checklist

Before publishing, every post must pass:

- [ ] **Value-first:** Would someone thank me for this?
- [ ] **Authentic:** Would I say this in real conversation?
- [ ] **Clear point:** Is there one takeaway?

[Add your principles]

---

## Formatting Patterns

- **Line breaks:** [Your pattern]
- **Emojis:** [Your policy]
- **Length:** [Your sweet spot]
- **Hook style:** [How you open posts]

---

## Admired Authors

Patterns adopted from creators you study:

| Author | Key patterns | What you'd never copy |
|--------|-------------|----------------------|
| | | |

---

## Evolution Log

| Date | Change | Why |
|------|--------|-----|
| | Created skill | Initial /analyze-voice session |

---

## Quick Reference

- **Character limit:** 3,000
- **Hook zone:** First 210 chars (before "...see more")
- **Desktop preview:** ~140 chars
- **Mobile preview:** ~110 chars
```

---

## RapidAPI Fetch Utility

**File:** `utils/fetch-linkedin-posts.sh`

```bash
#!/usr/bin/env bash
set -euo pipefail

# LinkedIn Post Fetcher via RapidAPI
# Usage: ./fetch-linkedin-posts.sh <username> [count] [output-file]

# Load environment
if [[ -f .env ]]; then
  export $(grep -v '^#' .env | xargs)
fi

# Validate
if [[ -z "${RAPIDAPI_KEY:-}" ]]; then
  echo "Error: RAPIDAPI_KEY not found in .env" >&2
  exit 1
fi

USERNAME="${1:?Usage: $0 <username> [count] [output-file]}"
COUNT="${2:-50}"
OUTPUT="${3:-docs/linkedin/posts/$(date +%Y-%m-%d)-${USERNAME}.json}"

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
    POST_COUNT=$(echo "$BODY" | jq 'length')
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
```

---

## Acceptance Criteria

### Testable Requirements

**API Fetching:**
- [ ] `./utils/fetch-linkedin-posts.sh henryfinkelstein 50` returns valid JSON
- [ ] Script handles 429 rate limit with clear error message
- [ ] Script handles invalid username gracefully
- [ ] Output saved to correct path with date prefix

**Skill File:**
- [ ] `skills/linkedin-voice/SKILL.md` follows template structure
- [ ] Can be loaded and parsed by commands
- [ ] Evolution log tracks changes

**Analyze Voice Command:**
- [ ] Fetches posts OR accepts pasted content as fallback
- [ ] Saves fetched data to `docs/linkedin/posts/`
- [ ] Interactive discussion with explicit wait points
- [ ] Writes to SKILL.md after each phase
- [ ] Recovery works if interrupted mid-session

**Draft Post Command:**
- [ ] Loads SKILL.md or prompts for setup
- [ ] Saves draft to `docs/linkedin/drafts/`
- [ ] Runs constitutional checklist with pass/fail/borderline
- [ ] Handles revision loop
- [ ] Prompts for image review when relevant

**Review Post Image Command:**
- [ ] Validates dimensions against LinkedIn specs
- [ ] Checks OG tag requirements for URLs
- [ ] Provides actionable feedback

---

## File Manifest

### New Files

| File | Purpose |
|------|---------|
| `skills/linkedin-voice/SKILL.md` | Voice guide, checklist, patterns |
| `commands/workflows/analyze-voice.md` | Seed voice via API + discussion |
| `commands/workflows/draft-post.md` | Conversational drafting |
| `commands/workflows/review-post-image.md` | Image validation |
| `utils/fetch-linkedin-posts.sh` | RapidAPI fetch utility |
| `docs/linkedin/posts/own/.gitkeep` | Your fetched posts |
| `docs/linkedin/posts/thought-leaders/.gitkeep` | Admired authors |
| `docs/linkedin/drafts/.gitkeep` | Work in progress |
| `docs/linkedin/published/.gitkeep` | Finalized posts |

### Files to Update

| File | Change |
|------|--------|
| `CLAUDE.md` | Add linkedin-voice to resources table |
| `.env.example` | Add `RAPIDAPI_KEY=your_key_here` |
| `.gitignore` | Add `docs/linkedin/posts/` if posts contain PII |

---

## Implementation Order

1. **Create directory structure** — 5 min
2. **Create SKILL.md template** — 10 min
3. **Create fetch utility** — 15 min
4. **Create `/analyze-voice` command** — 30 min
5. **Run `/analyze-voice` to seed your voice** — 30-60 min (interactive)
6. **Create `/draft-post` command** — 20 min
7. **Create `/review-post-image` command** — 15 min
8. **Test end-to-end** — Draft 2-3 posts
9. **Update CLAUDE.md** — 5 min

**Total estimated time:** 2-3 hours

---

## What's Deferred

**Build later based on usage:**
- Post type library (emerge from drafting patterns)
- Post-publication analytics (manual notes for now)
- Author profiles in `skills/author-profiles/` (only if deeply studying someone)
- Batch analysis of multiple authors

**Explicitly removed:**
- ERD diagram
- 98 lines of image/video specs (kept only essentials)
- Complex phase numbering (now conversational)
- Auto-population from business-values (manual is fine)

---

## References

### Internal
- PowerConnect scraper pattern: `/Users/henryfinkelstein/Desktop/code/bc/powerconnect/services/linkedin/scraper.ts`
- Business values structure: `skills/business-values/SKILL.md`
- Compound decision interactivity: `commands/workflows/compound-decision.md`

### External
- [Figma LinkedIn Size Guide](https://www.figma.com/resource-library/linkedin-size-guide/)
- [LinkedIn Post Inspector](https://www.linkedin.com/post-inspector/) (requires login)
- [RapidAPI Real-Time Data Enrichment](https://rapidapi.com/freshdata-freshdata-default/api/real-time-data-enrichment)
