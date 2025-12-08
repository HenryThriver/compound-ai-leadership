# Active Hypotheses

Every decision is a bet. This directory tracks those bets explicitly so they can be validated or invalidated.

---

## Why Track Hypotheses?

Most business decisions are based on beliefs about what will happen. Those beliefs are rarely stated explicitly, which means:
- We don't know what we're actually testing
- We can't tell if we were right or wrong
- We don't learn from outcomes

Explicit hypotheses fix this.

---

## Hypothesis Structure

Create a new file for each hypothesis: `YYYY-MM-DD-brief-slug.md`

```markdown
# Hypothesis: [Clear Statement]

**Created:** YYYY-MM-DD
**Status:** Active | Validated | Invalidated | Inconclusive
**Related Decision:** [link to decision doc]
**Review Date:** YYYY-MM-DD

## The Bet

**We believe:** [specific prediction]

**Because:** [reasoning/evidence]

**If true, we expect:** [observable outcomes]

**If false, we expect:** [observable outcomes]

## Success Criteria

| Metric | Baseline | Target | Deadline |
|--------|----------|--------|----------|
| [Metric 1] | [Current] | [Goal] | [Date] |
| [Metric 2] | [Current] | [Goal] | [Date] |

## Assumptions

- [Assumption 1] - [How to verify]
- [Assumption 2] - [How to verify]

## Risks

- [What could invalidate this besides being wrong?]

## Observations

### [Date]
[What we're seeing]

### [Date]
[Updated observations]

## Resolution

**Status Changed:** [Date]
**Outcome:** [What happened]
**Learning:** [What we now know]
**Action:** [What we're doing with this knowledge]
```

---

## Hypothesis Lifecycle

1. **Created** - During `/compound-decision` when decision contains a bet
2. **Active** - Being monitored, observations recorded
3. **Reviewed** - At review date, assess against criteria
4. **Resolved** - Validated, invalidated, or inconclusive with learnings

## Monthly Review

During `/retrospective`:
1. Review all active hypotheses
2. Check against success criteria
3. Record observations
4. Resolve those with sufficient evidence
5. Create learnings from invalidated hypotheses

---

## Active Hypotheses Index

*None yet - hypotheses are extracted from decisions via `/compound-decision`*

<!--
Organize by status:

### Active
- [Date] [Title](link) - Key metric: X

### Recently Validated
- [Date] [Title](link) - Learning: Y

### Recently Invalidated
- [Date] [Title](link) - Learning: Z
-->
