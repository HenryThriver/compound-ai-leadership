# Thinker Avatars

Deep profiles of thought leaders, built from their content over time.

See `docs/content/BIG_IDEA.md` for the philosophy behind this system.

---

## Purpose

Build models of individual worldviews by systematically capturing:
- Their key ideas and frameworks
- Their thinking patterns and approaches
- Their opinions on specific topics
- The source material these are derived from

Over time, this enables:
- Asking "What would [thinker] say about X?"
- Retrieving their actual takes on topics
- Simulating their perspective in debates/discussions
- Having multiple thinkers debate an idea

---

## Structure

Each thinker gets their own folder with three files:

```
skills/thinkers/
  CLAUDE.md           ← This file (stable-wide context)
  _TEMPLATE/          ← Copy this to create new thinkers
    PROFILE.md
    CANON.md
    INSIGHTS.md
  paul-graham/        ← Example thinker
    PROFILE.md        ← Who they are, key themes, worldview
    CANON.md          ← What content consumed, depth tracker
    INSIGHTS.md       ← Their ideas, cited to source
  adam-gross/
  dan-shipper/
  ...
```

---

## File Purposes

| File | Purpose |
|------|---------|
| `PROFILE.md` | Who they are, key themes, thinking patterns, worldview summary |
| `CANON.md` | What content you've consumed from them, depth tracker |
| `INSIGHTS.md` | Extracted ideas and opinions, cited to source |

---

## Creating a New Thinker

1. Copy `_TEMPLATE/` folder
2. Rename to thinker's name (lowercase, hyphenated): `paul-graham/`
3. Fill in PROFILE.md with initial bio
4. Add first content to CANON.md
5. Extract insights to INSIGHTS.md

---

## Maintaining Thinkers

### When Adding New Content

1. **Update CANON.md** — Log the new content with:
   - Title and link
   - Date consumed
   - Depth level (skim / read / study)
   - Brief note on what it covered

2. **Update INSIGHTS.md** — Extract key ideas with:
   - The insight itself (in their voice when possible)
   - Topic tags
   - Citation to source content file (`docs/content/...`)
   - Your commentary (optional)

3. **Update PROFILE.md** (periodically) — As patterns emerge:
   - Refine worldview summary
   - Add new key themes
   - Note thinking patterns you've observed

### Consistency Rules

- Every insight in `INSIGHTS.md` MUST have a citation
- Citations link to `docs/content/` files, not external URLs
- Use consistent topic tags across insights
- Depth levels in CANON.md: `skim` | `read` | `study`
- Date format: YYYY-MM-DD

---

## Depth Score

Each thinker's "depth score" is calculated from CANON.md:
- `skim` = 1 point
- `read` = 3 points
- `study` = 5 points

Higher depth = higher confidence in avatar simulation.

The deeper you go into someone's canon, the more accurately you can simulate their perspective.

---

## Invoking Thinkers

When working with a thinker avatar:

**For perspective:** "What would [thinker] say about [problem]?"
- Load their PROFILE.md for worldview context
- Load relevant insights from INSIGHTS.md
- Generate response grounded in their actual thinking

**For retrieval:** "What has [thinker] said about [topic]?"
- Search INSIGHTS.md for relevant tags/topics
- Return cited insights

**For debate:** "Have [thinker A] and [thinker B] discuss [topic]"
- Load both profiles
- Generate dialogue grounded in their respective worldviews

---

## Template Versions

If the template structure changes, audit all existing thinker folders for consistency.

| Version | Date | Changes |
|---------|------|---------|
| 1.0 | 2026-01-07 | Initial structure |
