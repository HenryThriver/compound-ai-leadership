---
name: ingest
description: |
  Process content (articles, books, podcasts, videos) to extract and distribute
  learnings across the knowledge base. Use when consuming valuable content that
  should compound into the system.

  Usage: /ingest [URL or content description]

  Examples:
  - /ingest https://paulgraham.com/ds.html
  - /ingest "Zero to One by Peter Thiel - Chapter 4"
  - /ingest "Acquired podcast episode on Costco"
---

# Content Ingestion Workflow

When the user invokes `/ingest`, process the content systematically to extract maximum value for the knowledge base.

## Phase 1: Content Acquisition

If a URL is provided:
1. Fetch the content using WebFetch
2. Identify content type (article, transcript, thread, etc.)
3. Note the source, author, and date

If content description is provided:
1. Ask clarifying questions if needed
2. Work with user to capture key points
3. Document the source for attribution

## Phase 2: Parallel Extraction

Run these analyses in parallel:

### Key Ideas Extractor
Extract:
- Main thesis or argument
- Supporting frameworks or mental models
- Concrete examples given
- Counterarguments addressed
- Actionable takeaways

Format as structured notes with clear hierarchy.

### Author Profiler
Build/update author profile:
- Writing style (formal/casual, dense/accessible)
- Apparent worldview and biases
- Areas of expertise
- Notable positions or contrarian takes
- Connections to other thinkers

Check if profile exists in `skills/author-profiles/profiles/` and update or create.

### Value Aligner
Map content to existing business values:
- Which values does this reinforce?
- Which values does this challenge?
- Any new values worth considering?
- Specific examples that illustrate values

### Checklist Miner
Look for actionable procedures:
- Step-by-step processes described
- Decision criteria mentioned
- Warning signs or red flags
- Success metrics suggested

Format as potential additions to `skills/tactical-checklists/`.

### Persona Builder
If the author or subject could be a mentor:
- Core beliefs and frameworks
- Decision-making style
- Signature questions they'd ask
- When to consult this perspective

Consider creating or updating external agent.

## Phase 3: Distribution

After extraction, distribute learnings:

### Immediate Updates
- Add summary to `docs/ingested/[source-slug].md`
- Update relevant skills if clear additions identified
- Flag author profile creation/update if warranted

### Proposed Updates
Present to user for approval:
- Suggested additions to business values
- New tactical checklists
- Agent persona creation
- Cross-references to existing decisions or hypotheses

## Phase 4: Integration

Ask the user:
1. What was most valuable from this content?
2. Any immediate decisions or actions this informs?
3. Should we create a mentor agent from this author?
4. What else should we ingest to deepen this perspective?

## Output Format

```markdown
# Ingestion Summary: [Title]

**Source:** [URL or description]
**Author:** [Name]
**Ingested:** [Date]

## Key Ideas
- [Idea 1]
- [Idea 2]

## Frameworks Extracted
### [Framework Name]
[Description]

## Value Alignment
- Reinforces: [Values]
- Challenges: [Values]
- New consideration: [If any]

## Actionable Takeaways
1. [Takeaway 1]
2. [Takeaway 2]

## Proposed Updates
- [ ] Add to values: [Specific addition]
- [ ] Create checklist: [Topic]
- [ ] Create/update agent: [Mentor name]

## Cross-References
- Related to decision: [If any]
- Related to hypothesis: [If any]
- Similar to ingested: [If any]
```

## Integration with Mentor Agents

When ingesting content from a notable figure:
1. Check if agent exists in `agents/external/`
2. If yes, append to their source material
3. If no, propose creating one if sufficient depth
4. Multiple sources from same author build richer profiles
