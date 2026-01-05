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

```bash
./utils/fetch-linkedin-posts.sh <username> 50 docs/linkedin/posts/own/YYYY-MM-DD-fetch.json
```

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
2. Fetch their 50 posts:
   ```bash
   ./utils/fetch-linkedin-posts.sh <username> 50 docs/linkedin/posts/thought-leaders/<username>.json
   ```
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
