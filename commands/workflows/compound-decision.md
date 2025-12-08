---
name: compound-decision
description: |
  Interactive decision-making workflow that captures full reasoning while it's fresh.
  Guides through framework selection, clarifying questions, analysis confirmation,
  value alignment, and risk assessment—all as a dialogue with the user.

  Usage: /compound-decision [context]

  This workflow is INTERACTIVE. It asks questions, waits for answers,
  confirms analysis at each step, and writes to the decision doc throughout.
---

# Compound Decision Workflow v2

This workflow is a dialogue, not a dump. Every phase involves the user.
Write to the decision doc after EVERY phase to prevent context loss.

---

## Phase 0: Initialization

**Before anything else:**
1. Verify today's date (check system, don't guess)
2. Parse the user's decision context
3. Determine category: pricing / product / hiring / strategy / operations / communication

**Create decision doc immediately:**
`docs/decisions/[category]/YYYY-MM-DD-[slug].md`

**Write to doc:**
```markdown
# Decision: [Title - from user's context]

**Date:** [verified date]
**Category:** [category]
**Status:** In Progress

---

## Context
[User's initial description]

---

## Process Log

### Phase 0: Initialization
- Document created: [timestamp]
- Initial context captured
```

**Output to user:**
```
Starting decision process for: [brief summary]

I've created the decision doc at: [path]

Before we dive into frameworks, I want to understand your starting point.
```

---

## Phase 1: Baseline Intuition & Visioning

**Ask these questions one at a time, wait for each answer:**

```
**Question 1: Magic Wand**
If this goes perfectly—better than your wildest dreams—what does that look like?
What does it unlock for you?
```

[Wait for answer, write to doc]

```
**Question 2: Worst Case**
What's the fear? If this fails completely, what does that look like and feel like?
```

[Wait for answer, write to doc]

```
**Question 3: Gut Check**
Right now, before any analysis—what does your gut say?
Excited? Hesitant? Conflicted? Something else?
```

[Wait for answer, write to doc]

```
**Question 4: Inspiration**
What about this excites you? Why are you drawn to this decision?
```

[Wait for answer, write to doc]

```
**Question 5: Energy Read**
When you imagine actually doing this work, do you feel energized or drained?
```

[Wait for answer, write to doc]

**Write to doc:**
```markdown
### Phase 1: Baseline Intuition

**Magic wand scenario:**
[User's answer]

**Worst case fear:**
[User's answer]

**Gut feel:** [excited/hesitant/conflicted/etc]

**What excites them:**
[User's answer]

**Energy:** [energized/drained/mixed]
```

---

## Phase 2: Framework Selection

**Load `skills/decision-frameworks/SKILL.md`**

**Analyze the decision type and propose frameworks:**

```
Based on your decision, I notice the pattern: "[pattern identified]"

**Recommended frameworks:**
- [Framework A]: [why it fits this decision]
- [Framework B]: [why it fits this decision]

**Worth considering:**
- [Framework C]: [might apply because...]
- [Framework D]: [might apply because...]

**Probably don't fit:**
- [Framework X]: [why not relevant here]
- [Framework Y]: [why not relevant here]

Which frameworks do you want to apply? You can add, remove, or accept my suggestions.
```

[Wait for user selection]

**Write to doc:**
```markdown
### Phase 2: Framework Selection

**Pattern identified:** [pattern]

**Frameworks selected:**
1. [Framework] - [reason]
2. [Framework] - [reason]
3. [Framework] - [reason]

**User modifications:** [if any]
```

---

## Phase 3: Clarifying Questions

**For each selected framework, identify key diagnostic questions.**
**Ask them ONE AT A TIME across all frameworks.**
**Earlier answers may resolve later questions—skip or confirm if so.**

```
I'll ask clarifying questions one at a time. Earlier answers may resolve later ones.

**Question 1 of [N]:** (from [Framework] lens)
[Question]
```

[Wait for answer, write to doc]

```
**Question 2 of [N]:** (from [Framework] lens)
[Question]
```

[Continue, but watch for overlap]

If an earlier answer resolves a later question:
```
Based on your earlier answer about [X], I think I understand the [Framework] dimension.
Let me confirm: [inference]. Does that capture it, or is there more?
```

**Write to doc after each answer:**
```markdown
### Phase 3: Clarifying Questions

**Q1 (Framework):** [question]
**A1:** [user's answer]

**Q2 (Framework):** [question]
**A2:** [user's answer]

[etc.]
```

---

## Phase 4: Framework Analysis (Per Framework, Confirmed)

**For EACH selected framework:**

1. Review the user's answers relevant to this framework
2. Apply the framework's logic
3. Present preliminary analysis
4. Ask for confirmation/augmentation
5. Write final analysis to doc
6. Move to next framework

```
**[Framework Name] — Preliminary Analysis**

Based on your answers:
[Analysis applying the framework logic]

**My read:**
- [Conclusion 1]
- [Conclusion 2]

**This framework leans:** [Toward / Against / Neutral] on this decision

---

Does this analysis resonate? Anything to add, correct, or push back on?
```

[Wait for user confirmation or augmentation]

**Write to doc:**
```markdown
### Framework: [Name]

**Relevant inputs:**
- [Key answer 1]
- [Key answer 2]

**Analysis:**
[Framework-specific analysis]

**User feedback:**
[Any corrections or additions]

**Verdict:** [For / Against / Neutral / Conditional]
**Reasoning:** [Final reasoning after user input]
```

**Repeat for each framework before moving to Phase 5.**

---

## Phase 5: Value Alignment (Calibrated)

**Load `skills/business-values/SKILL.md`**

**Walk through EACH value, one at a time:**

```
**Value Alignment Check**

I'll walk through each value. Tell me if my reading matches yours.

**Value 1: Add value to customers in every interaction**
- My read: [✅/⚠️/❌]
- Reasoning: [Why I think this]

Does this match your intuition? If not, how do you see it?
```

[Wait for user calibration]

```
**Value 2: Do not make the same mistake twice**
- My read: [✅/⚠️/❌]
- Reasoning: [Why I think this]

Does this match?
```

[Continue for each value]

**Write to doc AND write calibration example back to skill file:**

```markdown
### Phase 5: Value Alignment

| Value | AI Read | User Read | Final | Rationale |
|-------|---------|-----------|-------|-----------|
| Customer value | ✅ | ✅ | ✅ | [user's words] |
| No repeat mistakes | ⚠️ | ✅ | ✅ | [user's words] |
[etc.]
```

**If user's reading differs from AI's, that rationale becomes a calibration example:**
Update `skills/business-values/SKILL.md` with:
```markdown
**Calibration Example:**
- Decision: [This decision]
- Situation: [Context]
- Reading: [User's reading]
- Rationale: "[User's words]"
```

---

## Phase 6: Synthesis & Risk Assessment

**Aggregate all framework analyses:**

```
**Synthesis**

**Framework consensus:**
- [X of Y] frameworks lean: [direction]
- Key agreements: [list]
- Key tensions: [list if any]

**Top risks identified:**
(Surfacing everything—tell me which ones don't feel real)

1. **[Risk 1]**
   - Likelihood: [L/M/H]
   - Impact: [L/M/H]
   - Mitigation: [Specific action]

2. **[Risk 2]**
   - Likelihood: [L/M/H]
   - Impact: [L/M/H]
   - Mitigation: [Specific action]

[Continue with all identified risks]

**Value alignment:**
- Strong: [values with ✅]
- Watch: [values with ⚠️]

---

Based on this, my preliminary recommendation is: [GO / NO-GO / CONDITIONAL]

Which risks feel real? Which can we dismiss?
```

[Wait for user to validate/dismiss risks]

**Write to doc with validated risks only**

---

## Phase 6.5: Intuition Alignment Check

```
**Intuition Check**

At the start, you said:
- Gut feel: [their answer]
- What excites you: [their answer]
- Energy: [their answer]

The rational analysis suggests: [GO / NO-GO / CONDITIONAL]

Does this match your intuition?
```

**If aligned:** Note alignment and proceed.

**If divergent:**
```
**Divergence detected:**
- Your intuition: [X]
- The analysis: [Y]

Possible explanations:
1. Your gut is picking up something the frameworks missed
2. The analysis is surfacing risks your excitement is glossing over
3. Context that didn't come through in the questions
4. The frameworks don't fit this decision type well

What do you think is driving the gap?
```

[Explore, then write resolution to doc]

---

## Phase 7: Decision & Executive Summary

```
**Final Decision**

What's your call?
- **GO:** We're doing this
- **NO-GO:** We're not doing this (or not now)
- **CONDITIONAL:** We're doing this IF [conditions]
```

[Wait for decision]

```
Got it. Let me draft the executive summary for the top of your doc:

---

## Executive Summary

**Decision:** [GO/NO-GO/CONDITIONAL] — [One line statement]
**Date:** [Date]
**Status:** Active

**Why:** [2-3 sentences capturing the core reasoning]

**Key risks and mitigations:**
1. [Risk] → [Mitigation]
2. [Risk] → [Mitigation]

**Success looks like:**
[From their magic wand answer]

**We'll know it's working when:**
[Specific metrics/indicators]

**Review schedule:**
- [Date]: [What we're checking]

---

Does this capture it? Any edits before I finalize?
```

[Make any edits, then write final version to TOP of doc]

---

## Phase 8: Hypothesis & Queue

**If decision is GO or CONDITIONAL:**

```
This decision contains a hypothesis we should track:

**Hypothesis:** We believe that [action] will result in [outcome] because [reasoning].

**Success metrics:**
- [Metric 1]: [Target] by [Date]
- [Metric 2]: [Target] by [Date]

**First review date:** [Suggested date]

Does this capture the bet? Any adjustments to the metrics or timeline?
```

[Confirm and create hypothesis doc at `docs/hypotheses/YYYY-MM-DD-[slug].md`]

**Add to REVIEW_QUEUE.md:**
```markdown
| [Hypothesis title](link) | [Review date] | [Decision link] | Pending |
```

---

## Phase 9: Commit & Close

```
**Decision Complete**

Document: `docs/decisions/[category]/[date]-[slug].md`
Hypothesis: `docs/hypotheses/[date]-[slug].md` [if created]
Review scheduled: [date]

**Next actions surfaced:**
- [Action 1]
- [Action 2]

Shall I commit this to git? Anything else before we close?
```

[If yes, commit with meaningful message]

---

## Recovery: If Session Interrupted

Because we write after every phase, recovery is straightforward:

1. Read the existing decision doc
2. Identify last completed phase from Process Log
3. Resume from next phase
4. Confirm with user: "I see we left off at [Phase X]. Ready to continue?"

---

## Workflow Parameters

These can be adjusted per-session:

| Parameter | Default | Options |
|-----------|---------|---------|
| Risk rigor | Conservative | Conservative / Balanced / Aggressive |
| Framework depth | Standard | Quick / Standard / Deep |
| Value check | Full | Full / Key-only / Skip |
| Intuition check | Yes | Yes / No |
