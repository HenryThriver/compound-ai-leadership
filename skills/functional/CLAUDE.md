# Functional Areas

Domain expertise accumulated from multiple sources and thinkers.

See `docs/content/BIG_IDEA.md` for the philosophy behind this system.

---

## Purpose

Build accumulated expertise in domains by capturing:
- Key insights from articles, books, podcasts
- Frameworks and mental models
- Best practices and anti-patterns
- All cited to source material

Over time, this enables:
- Querying "What do I know about [topic]?"
- Getting synthesized answers with citations
- Identifying gaps in your knowledge
- Seeing which thinkers have contributed to each domain

---

## Structure

Each functional area gets its own folder:

```
skills/functional/
  CLAUDE.md           ← This file (stable-wide context)
  _TEMPLATE/          ← Copy this to create new areas
    INSIGHTS.md
  marketing/          ← Example area
    INSIGHTS.md       ← Accumulated knowledge, cited
    SKILL.md          ← (Optional) Procedural knowledge
  sales/
  product/
  voice-ai/
  revops/
  ...
```

Sub-areas are supported:
```
skills/functional/marketing/
  INSIGHTS.md
  brand/
    INSIGHTS.md
  performance/
    INSIGHTS.md
```

---

## File Purposes

| File | Purpose |
|------|---------|
| `INSIGHTS.md` | Accumulated knowledge, cited to source content |
| `SKILL.md` | (Optional) Procedural knowledge, frameworks, how-to |

---

## Creating a New Functional Area

1. Copy `_TEMPLATE/` folder
2. Rename to area name (lowercase, hyphenated): `voice-ai/`
3. Add first insights to INSIGHTS.md

Areas are created organically — when you consume content that doesn't fit existing areas, create a new one.

---

## Maintaining Functional Areas

### When Adding New Content

Update `INSIGHTS.md` with:
- The insight itself
- Topic tags within this domain
- Citation to source content file (`docs/content/...`)
- Thinker attribution (who said it)
- Your commentary (optional)

### Consistency Rules

- Every insight MUST have a citation to `docs/content/`
- Every insight SHOULD have thinker attribution
- Use consistent topic tags within this domain
- Group insights by subtopic for navigability
- Date format: YYYY-MM-DD

### When to Create Sub-Areas

Create a subfolder when you have 10+ insights on a specific subtopic.

Example: `marketing/` gets subfolders for `brand/`, `performance/`, `growth/` as those areas grow.

---

## Querying Functional Areas

When working with functional knowledge:

**For synthesis:** "What do I know about [topic]?"
- Search relevant area's INSIGHTS.md
- Return synthesized answer with citations

**For gaps:** "What don't I know about [topic]?"
- Review INSIGHTS.md coverage
- Identify missing subtopics or thin areas

**For sources:** "Who has influenced my thinking on [topic]?"
- Check thinker attributions in INSIGHTS.md
- Surface the most-cited thinkers in this domain

---

## Relationship to Thinkers

Content often routes to BOTH a functional area AND a thinker:

- NFX article on Voice AI → `skills/functional/voice-ai/` AND `skills/thinkers/james-currier/`
- Adam Gross on GTM → `skills/functional/marketing/` AND `skills/thinkers/adam-gross/`

The functional area captures the domain knowledge.
The thinker captures the individual's worldview.

---

## Template Versions

If the template structure changes, audit all existing functional areas for consistency.

| Version | Date | Changes |
|---------|------|---------|
| 1.0 | 2026-01-07 | Initial structure |
