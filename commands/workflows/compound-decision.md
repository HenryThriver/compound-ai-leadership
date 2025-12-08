---
name: compound-decision
description: |
  Document a decision with full reasoning chain while context is fresh.
  Captures the what, why, alternatives, tradeoffs, and success metrics
  to enable future learning.

  Usage: /compound-decision [context]

  Triggers automatically on phrases like:
  - "Let's go with..."
  - "Decision made"
  - "We're doing X"
  - "I've decided to..."

  Examples:
  - /compound-decision pricing the new tier at $29/month
  - /compound-decision hiring a contractor instead of FTE
  - /compound-decision killing the mobile app
---

# Decision Documentation Workflow

When the user makes a decision worth documenting, capture the full reasoning chain before context evaporates.

## Trigger Detection

Watch for decision signals:
- Explicit: "I've decided...", "Let's do...", "We're going with..."
- Implicit: Strong commitment language after deliberation
- User-invoked: `/compound-decision [context]`

When detected, ask: "That sounds like a decision worth documenting. Should I capture this?"

## Phase 1: Decision Crystallization

Gather the essentials:

### What
- What is the decision?
- What is the scope? (Who/what is affected?)
- What is the timeline?
- Is this reversible?

### Why
- What problem does this solve?
- What opportunity does this capture?
- What would happen if we did nothing?

### Alternatives Considered
- What other options were evaluated?
- Why were they rejected?
- What would change the calculus?

## Phase 2: Hypothesis Extraction

Every decision is a bet. Make the bet explicit:

### Primary Hypothesis
"We believe that [action] will result in [outcome] because [reasoning]."

### Assumptions
- What must be true for this to work?
- What are we taking for granted?
- Which assumptions are riskiest?

### Success Metrics
- How will we know if this worked?
- What's the timeframe for evaluation?
- What's the threshold for success/failure?

## Phase 3: Tradeoff Documentation

Make tradeoffs explicit:

### What We're Gaining
- [Benefit 1]
- [Benefit 2]

### What We're Giving Up
- [Cost 1]
- [Cost 2]

### What We're Risking
- [Risk 1] - [Mitigation if any]
- [Risk 2] - [Mitigation if any]

### What We're Accepting
- [Limitation we're okay with]
- [Debt we're taking on]

## Phase 4: Mentor Consultation (Optional)

For significant decisions, consult 2-3 relevant external mentors:

1. Select mentors whose frameworks apply
2. Run the decision past each perspective
3. Note agreements and disagreements
4. Document any adjustments made

## Phase 5: Value Alignment Check

Verify against business values:

| Value | Alignment | Notes |
|-------|-----------|-------|
| Customer value | ✅/⚠️/❌ | [Explanation] |
| No repeat mistakes | ✅/⚠️/❌ | [Explanation] |
| Support not needed | ✅/⚠️/❌ | [Explanation] |
| Respect time | ✅/⚠️/❌ | [Explanation] |
| Invert enshittification | ✅/⚠️/❌ | [Explanation] |
| Measure what matters | ✅/⚠️/❌ | [Explanation] |
| Revenue proves value | ✅/⚠️/❌ | [Explanation] |

Flag any ⚠️ or ❌ for explicit acknowledgment.

## Phase 6: Documentation

Create decision document in `docs/decisions/[category]/[date]-[slug].md`:

```markdown
# Decision: [Title]

**Date:** [YYYY-MM-DD]
**Category:** [pricing/product/hiring/strategy/operations]
**Status:** Active | Superseded | Validated | Invalidated
**Decision Maker:** [Name/Role]

## Summary
[One paragraph summary]

## Context
[Background and situation]

## Decision
[Clear statement of what was decided]

## Reasoning
[Why this decision was made]

## Alternatives Considered
1. **[Option A]** - [Why rejected]
2. **[Option B]** - [Why rejected]

## Hypothesis
We believe that [action] will result in [outcome] because [reasoning].

### Assumptions
- [Assumption 1]
- [Assumption 2]

### Success Metrics
- [Metric 1]: [Target] by [Date]
- [Metric 2]: [Target] by [Date]

## Tradeoffs

### Gains
- [Gain 1]

### Costs
- [Cost 1]

### Risks
- [Risk 1]: [Mitigation]

## Value Alignment
[Table from Phase 5]

## Mentor Consultation
[If applicable]

### [Mentor 1]
[Their perspective]

### [Mentor 2]
[Their perspective]

## Review Schedule
- [ ] [Date]: Check [Metric]
- [ ] [Date]: Full retrospective

## Linked Items
- Related decisions: [Links]
- Active hypotheses: [Links]
- Previous learnings: [Links]
```

## Phase 7: Integration

After documenting:

1. Add to decision index if maintained
2. Set calendar reminders for review dates
3. Link to related active hypotheses
4. Update any affected active decisions

## Auto-Trigger Behavior

When decision signals detected in conversation:
1. Confirm it's worth documenting
2. If yes, run abbreviated version capturing essentials
3. If significant, run full workflow with mentor consultation
4. Always create the document before moving on
