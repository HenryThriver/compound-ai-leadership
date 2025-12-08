---
name: tactical-session
description: |
  Run a structured tactical working session for operational decisions.
  Spawns relevant internal agents, surfaces applicable context, and
  ensures alignment with business values.

  Usage: /tactical-session [topic or context]

  Examples:
  - /tactical-session responding to customer escalation
  - /tactical-session reviewing this week's support tickets
  - /tactical-session pricing decision for enterprise tier
  - /tactical-session onboarding flow optimization
---

# Tactical Session Workflow

A tactical session is for working through operational decisions with the rigor of an internal meeting, but the speed and completeness of an AI-augmented process.

## Session Initialization

When `/tactical-session [context]` is invoked:

1. **Parse Context**
   - What's the topic or decision at hand?
   - What functional areas are involved?
   - What time horizon matters (today, this week, this quarter)?

2. **Select Internal Agents**
   - Identify 2-4 relevant internal agents based on topic
   - Default to customer-success-oracle for anything customer-facing
   - Add function-specific agents (marketing, sales, ops, finance) as relevant

3. **Load Context**
   - Check for related decisions in `docs/decisions/`
   - Check for active hypotheses in `docs/hypotheses/`
   - Check for relevant tactical checklists
   - Surface applicable business values

## Session Structure

### Opening (2 min equivalent)
- State the topic clearly
- Confirm the decision or outcome needed
- Set success criteria for the session

### Context Gathering (parallel)
Run these in parallel:

**Recent Decisions Check**
- Are there related past decisions?
- What did we learn from them?
- Any active hypotheses being tested?

**Checklist Pull**
- Does a tactical checklist exist for this type of decision?
- If yes, load and follow it
- If no, note for potential creation after

**Value Priming**
- Which business values are most relevant?
- Any recent learnings or refinements?

### Agent Consultation (parallel)
Each selected internal agent provides:
- Their perspective on the situation
- Key considerations from their function
- Risks or opportunities they see
- Recommended actions

### Synthesis
- Identify points of agreement across agents
- Surface conflicts or tensions
- Propose resolution path
- Draft decision or action items

### Value Alignment Check
Quick scan against business values:
- Does this add customer value?
- Are we respecting human time?
- Have we made this mistake before?
- Is this measurable?

### Close
- Confirm decisions made
- List action items with owners
- Determine if `/compound-decision` should be invoked
- Schedule any follow-up needed

## Output Format

```markdown
# Tactical Session: [Topic]

**Date:** [YYYY-MM-DD]
**Duration:** [Actual time spent]
**Agents Consulted:** [List]

## Topic
[What we were working through]

## Context Loaded
- Related decisions: [List or "None found"]
- Active hypotheses: [List or "None"]
- Checklist used: [Name or "None - consider creating"]

## Agent Perspectives

### [Agent 1]
[Their input]

### [Agent 2]
[Their input]

## Synthesis
[Combined analysis and resolution]

## Decisions Made
1. [Decision 1]
2. [Decision 2]

## Action Items
- [ ] [Action] - [Owner] - [Due]
- [ ] [Action] - [Owner] - [Due]

## Value Alignment
[Quick confirmation or flags]

## Follow-up
- Compound decision needed: [Yes/No - which decisions]
- Next session: [If applicable]
- Checklist to create: [If applicable]
```

## Session Types

### Customer Escalation
**Default agents:** customer-success-oracle, operations-optimizer
**Default checklist:** customer-inquiry-response (if exists)
**Focus:** Resolution + prevention + communication

### Metrics Review
**Default agents:** metrics-interrogator, relevant function agent
**Focus:** Signal vs noise, action thresholds, hypothesis validation

### Pricing/Positioning
**Default agents:** customer-success-oracle, finance-guardian, marketing-strategist
**Focus:** Value delivery, competitive context, trust implications

### Process Optimization
**Default agents:** operations-optimizer, relevant function agent
**Focus:** Bottlenecks, human time respect, systemic fixes

### Ad-Hoc
**Default agents:** Based on topic parsing
**Focus:** As specified by user

## Post-Session

After every tactical session:
1. If decisions warrant, prompt for `/compound-decision`
2. If a checklist was missing, note for creation
3. If a value conflict surfaced, flag for refinement
4. Add session summary to daily/weekly log if maintained
