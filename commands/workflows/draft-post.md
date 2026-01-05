---
name: draft-post
description: |
  Draft a LinkedIn post using your style guide.
  Interactive process with validation against your principles.
---

# Draft Post

## Setup

1. Load `skills/linkedin-voice/SKILL.md`

**If skill doesn't exist or is empty:**
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
