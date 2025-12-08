# Retrospectives

Periodic reviews that close the loop: validate hypotheses, extract learnings, update the system.

---

## Purpose

The feedback loop only compounds if it actually loops. Retrospectives:
1. Check hypotheses against reality
2. Extract learnings from outcomes
3. Update values, checklists, and agents
4. Ensure the system improves

Without regular retrospectives, the system is just documentation—not learning.

---

## Retrospective Cadence

| Type | Frequency | Focus |
|------|-----------|-------|
| Weekly | Every week | Active hypotheses, recent decisions |
| Monthly | First of month | Hypothesis resolution, learning extraction |
| Quarterly | Every 3 months | Value refinement, system meta-review |

---

## Retrospective Template

Create a new file: `YYYY-MM-DD-[weekly|monthly|quarterly].md`

```markdown
# Retrospective: [Date Range]

**Type:** Weekly | Monthly | Quarterly
**Date:** YYYY-MM-DD

## Hypotheses Reviewed

### Validated
- **[Hypothesis title]** - [Link]
  - Outcome: [What happened]
  - Learning: [What we now know]

### Invalidated
- **[Hypothesis title]** - [Link]
  - Outcome: [What happened]
  - Learning: [What we got wrong and why]
  - Action: [What we're changing]

### Inconclusive
- **[Hypothesis title]** - [Link]
  - Status: [Why we can't decide]
  - Next step: [What more data needed]

### Still Active
- **[Hypothesis title]** - [Link]
  - Observations: [What we're seeing]
  - Concerns: [Any yellow flags]

## Decisions Reviewed

### Worked Well
- **[Decision title]** - [Link]
  - Why it worked: [Analysis]

### Didn't Work
- **[Decision title]** - [Link]
  - Why it failed: [Analysis]
  - Learning created: [Link to docs/learnings/]

### Need More Time
- **[Decision title]** - [Link]
  - Scheduled for: [Next review date]

## System Updates Made

### Values
- [X] Updated: [value] - [what changed and why]

### Checklists
- [X] Created: [checklist name] - [why]
- [X] Updated: [checklist name] - [what changed]

### Agents
- [X] Updated: [agent name] - [what changed]
- [X] Created: [agent name] - [from which author profile]

### Learnings
- [X] Added: [learning title] - [link]

## Meta-Observations

What patterns are emerging across decisions and hypotheses?

## Next Period Focus

What should we pay attention to in the next period?

## Time Spent

How long did this retrospective take? Is the system helping or creating overhead?
```

---

## Running Retrospectives

Use the `/retrospective` command which:
1. Pulls active hypotheses due for review
2. Surfaces recent decisions for assessment
3. Checks for unresolved learnings
4. Prompts for system updates
5. Creates the retrospective document

---

## Retrospective Index

*Populated via `/retrospective` workflow*

<!--
### 2024
- [2024-12-01](2024-12-01-monthly.md) - Monthly: 3 hypotheses resolved
- [2024-11-25](2024-11-25-weekly.md) - Weekly
-->
