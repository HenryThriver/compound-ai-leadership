# Ingested Content

Summaries and extractions from content processed via `/ingest`. Each piece of content becomes a document capturing:
- Key ideas and frameworks
- Author context (links to `skills/author-profiles/`)
- Value alignment
- Distributed learnings

---

## Ingestion Output

The `/ingest` workflow creates documents here following this structure:

```markdown
# Ingestion: [Title]

**Source:** [URL or description]
**Author:** [Name]
**Type:** [article/book/podcast/interview/video]
**Ingested:** YYYY-MM-DD

## Summary
[Brief overview of the content]

## Key Ideas
- [Idea 1]
- [Idea 2]

## Frameworks Extracted
### [Framework Name]
[Description and how to apply]

## Value Alignment
- **Reinforces:** [Which business values]
- **Challenges:** [Which business values]
- **New consideration:** [If any]

## Actionable Takeaways
1. [Specific action]
2. [Specific action]

## Distribution
What was updated based on this content:
- [ ] Added to values: [description]
- [ ] Created checklist: [name]
- [ ] Updated author profile: [link]
- [ ] Created/enriched mentor: [name]

## Cross-References
- Related decisions: [links]
- Similar ingested content: [links]
- Contradicts: [links if any]
```

---

## Organizing Ingested Content

Files are named: `YYYY-MM-DD-author-or-source-slug.md`

Over time, consider organizing by:
- Author (if building mentor profiles)
- Topic (if researching specific areas)
- Source type (books vs articles vs podcasts)

---

## Finding Previously Ingested Content

Before ingesting:
1. Check if author has been ingested before
2. Check if topic has been covered
3. Look for contradictions or confirmations

This prevents duplicate effort and surfaces useful cross-references.

---

## Content Index

*Populated via `/ingest` workflow*

<!--
### By Author
- **Paul Graham**
  - [Date] [Title](file.md)

### By Topic
- **Pricing**
  - [Date] [Title](file.md)
-->
