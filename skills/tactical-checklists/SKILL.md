# Tactical Checklists

This skill provides repeatable procedures for recurring situations. Checklists should be invoked when:
- Facing a situation that has a documented procedure
- Wanting to ensure nothing is missed in a complex process
- Training the system on a new repeatable workflow
- Reviewing whether existing procedures are still optimal

## Philosophy

Checklists are not bureaucracy—they're captured expertise. A good checklist:
- Prevents the same mistake twice
- Frees mental energy for novel problems
- Ensures consistency across occurrences
- Evolves based on learnings

---

## Using Checklists

1. **Check if one exists** before any recurring task
2. **Follow it completely** - if a step seems unnecessary, update the checklist after, not during
3. **Note friction** - if something doesn't work, flag for revision
4. **Create new ones** when you catch yourself doing the same complex task twice

---

## Checklist Template

When creating a new checklist, use this structure:

```markdown
# Checklist: [Name]

**Purpose:** [What this ensures]
**Trigger:** [When to use this checklist]
**Last Updated:** YYYY-MM-DD
**Owner:** [Who maintains this]

## Pre-Conditions
- [ ] [What must be true before starting]

## Steps

### Phase 1: [Name]
- [ ] Step with [specific details]
- [ ] Step that [action verb] the [thing]
- [ ] Verify: [observable confirmation]

### Phase 2: [Name]
- [ ] Step
- [ ] Step

## Post-Actions
- [ ] [What to do after completing]
- [ ] [How to document/communicate]

## Common Mistakes
- [Mistake 1] → [How to avoid]
- [Mistake 2] → [How to avoid]

## Related
- Value alignment: [which values this supports]
- Learnings that shaped this: [links]
```

---

## Active Checklists

*Checklists are stored in `checklists/` subdirectory*

### Customer-Facing
- `checklists/customer-inquiry-response.md` - [pending creation]
- `checklists/escalation-handling.md` - [pending creation]

### Business Operations
- `checklists/pricing-change-review.md` - [pending creation]
- `checklists/hiring-decision.md` - [pending creation]

### Content & Communication
- `checklists/content-publication.md` - [pending creation]
- `checklists/newsletter-send.md` - [pending creation]

### System Maintenance
- `checklists/weekly-metrics-review.md` - [pending creation]
- `checklists/monthly-retrospective.md` - [pending creation]

---

## Creating Checklists from Experience

After completing any multi-step task:
1. Ask: "Will I do this again?"
2. If yes: "Did I have to think about the steps?"
3. If yes: Create a checklist

The `/compound-decision` workflow can trigger checklist creation when documenting operational decisions.
