# Design: Interactive Decision Workflow v2

**Date:** 2025-12-08
**Category:** process/architecture
**Status:** Design draft - seeking confirmation before implementation

---

## Design Principles

1. **Interactive over one-shot** — Decision-making is a dialogue, not a dump
2. **Clarify before conclude** — Ask questions, then analyze
3. **Confirm at each step** — User approves/augments before moving on
4. **Write frequently** — Document as we go, not just at the end
5. **Human-calibrated values** — User confirms value alignment interpretations
6. **Aspirational + fear-surfacing** — Best case AND worst case visioning
7. **Risk hedging with rigor** — Not strawman arguments, real mitigation

---

## Workflow Phases

### Phase 0: Initialization
**Trigger:** User describes a decision to make

**Actions:**
1. Verify today's date (for document naming)
2. Create decision doc with status "In Progress"
3. Write initial context to doc

**Write checkpoint:** Decision doc created with:
- Date, category, status
- Initial context as stated by user
- "Phase: Initialization complete"

**User interaction:** None required, but doc exists from moment 1

---

### Phase 1: Framework Selection (Interactive)

**Actions:**
1. Load `skills/decision-frameworks/SKILL.md`
2. Analyze user's decision description
3. Propose framework fit with reasoning

**Output to user:**
```
Based on your inquiry, I notice the pattern: "[pattern identified]"

**Recommended frameworks:**
- Framework A: [why it fits]
- Framework B: [why it fits]

**Worth considering:**
- Framework C: [might apply because...]
- Framework D: [might apply because...]

**Likely don't fit:**
- Framework X: [why not]
- Framework Y: [why not]

Which frameworks do you want to apply? (Can add/remove from my suggestions)
```

**User interaction:** User selects/confirms frameworks

**Write checkpoint:** Update decision doc with:
- Frameworks selected
- Reasoning for selection
- User's modifications to suggestions

---

### Phase 2: Clarifying Questions (Per Framework)

**For each selected framework, sequentially:**

1. Load the framework's diagnostic questions
2. Present questions to user
3. Capture answers

**Output to user:**
```
**Framework: [Name]**

Before I can analyze through this lens, I need to understand:

1. [Question from framework]
2. [Question from framework]
3. [Question specific to this decision]

Also, for calibration:
- Magic wand scenario: If this goes perfectly—better than your wildest dreams—what does success look like? What does it unlock?
- Worst case: What's the fear? What would failure look like and feel like?
```

**User interaction:** User answers questions

**Write checkpoint:** Update decision doc with:
- Framework name
- Questions asked
- User's answers verbatim
- Any additional context surfaced

**Repeat for each framework before any analysis begins.**

---

### Phase 3: Analysis (Per Framework, with Confirmation)

**For each selected framework, sequentially:**

1. Review user's answers to that framework's questions
2. Apply framework logic
3. Present preliminary analysis
4. Request confirmation/augmentation

**Output to user:**
```
**Framework: [Name] — Preliminary Analysis**

Based on your answers:

[Analysis applying the framework]

**My read:**
- [Conclusion 1]
- [Conclusion 2]

**Leaning:** [Toward/Against/Neutral] on this decision

---

Does this analysis resonate? Anything to add, correct, or push back on?
```

**User interaction:** User confirms, denies, or augments

**Write checkpoint:** Update decision doc with:
- Preliminary analysis
- User's confirmation/augmentation
- Final analysis for this framework
- Framework's vote: For / Against / Conditional / Neutral

**Move to next framework only after this one is resolved.**

---

### Phase 4: Value Alignment Check (Interactive)

**Actions:**
1. Load `skills/business-values/SKILL.md`
2. For each value, propose alignment reading
3. Request user calibration

**Output to user:**
```
**Value Alignment Check**

Let me walk through each value. Tell me if my reading matches yours:

**1. Add value to customers in every interaction**
- My read: [✅/⚠️/❌] — [Reasoning]
- Does this match your intuition? If not, how do you see it?

**2. Do not make the same mistake twice**
- My read: [✅/⚠️/❌] — [Reasoning]
- Does this match your intuition?

[Continue for each value...]
```

**User interaction:** User confirms or corrects each value reading

**Write checkpoint:** Update decision doc with:
- Each value
- Initial AI reading
- User's calibrated reading
- Final alignment status

---

### Phase 5: Synthesis & Risk Mitigation

**Actions:**
1. Aggregate all framework analyses
2. Identify consensus and conflicts
3. Surface top risks with mitigation strategies
4. Present synthesis for confirmation

**Output to user:**
```
**Synthesis**

**Framework consensus:**
- [X] frameworks lean toward: [direction]
- Key agreements: [list]
- Key tensions: [list]

**Top risks identified:**
1. [Risk]
   - Likelihood: [Low/Medium/High]
   - Impact: [Low/Medium/High]
   - Mitigation: [Specific action]

2. [Risk]
   - Likelihood: ...
   - Impact: ...
   - Mitigation: ...

**Value alignment summary:**
- Strong alignment: [values]
- Watch areas: [values with ⚠️]

---

Based on this analysis, my preliminary recommendation is: [GO / NO-GO / CONDITIONAL]

Does this synthesis capture the decision accurately? Any risks I'm missing or overstating?
```

**User interaction:** User confirms or augments synthesis

**Write checkpoint:** Update decision doc with full synthesis section

---

### Phase 6: Decision & Executive Summary

**Actions:**
1. Capture final decision
2. Generate executive summary
3. Define hypotheses and success metrics
4. Set review schedule

**Output to user:**
```
**Final Decision**

What's your call?
- GO: We're doing this
- NO-GO: We're not doing this (or not now)
- CONDITIONAL: We're doing this IF [conditions]

[After user answers]

Let me draft the executive summary. This will be the top of your decision doc:

---

## Executive Summary

**Decision:** [Statement]
**Date:** [Date]
**Status:** Active

**Why:** [2-3 sentence reasoning]

**Key risks and mitigations:**
1. [Risk] → [Mitigation]
2. [Risk] → [Mitigation]

**Success looks like:** [From magic wand answer]

**We'll know it's working when:** [Metrics]

**Review dates:**
- [Date]: [What we're checking]
- [Date]: [What we're checking]

---

Does this executive summary capture it? Any edits?
```

**User interaction:** User confirms or edits summary

**Write checkpoint:**
- Move executive summary to TOP of decision doc
- Update status to "Active" (or "Decided: No-Go")
- Create hypothesis doc if applicable
- Set review reminders

---

### Phase 7: Commit & Close

**Actions:**
1. Final review of complete decision doc
2. Git commit with meaningful message
3. Confirm next actions

**Output to user:**
```
Decision documented: `docs/decisions/[category]/[date]-[slug].md`

**Hypothesis created:** [Yes/No - link if yes]

**Next actions surfaced:**
- [Action 1]
- [Action 2]

Anything else before we close this decision session?
```

---

## Write Checkpoint Summary

| Phase | What Gets Written |
|-------|-------------------|
| 0 - Init | Doc created with context |
| 1 - Frameworks | Selected frameworks + reasoning |
| 2 - Clarifying | Questions + answers per framework |
| 3 - Analysis | Analysis + user confirmation per framework |
| 4 - Values | Value readings + user calibration |
| 5 - Synthesis | Risks, mitigations, recommendation |
| 6 - Decision | Executive summary at top |
| 7 - Commit | Final doc, hypothesis, git commit |

**Total write checkpoints:** 7+ (one per phase, multiple within Phase 2-4)

---

## Sub-Agent Architecture

**When to spawn sub-agents:**
- Phase 3: Could run framework analyses in parallel IF user has answered all clarifying questions
- But: Sequential is safer for context preservation
- Recommendation: Sequential by default, parallel as optional speed mode

**Context preservation:**
- Each phase writes to doc before proceeding
- If agent crashes, doc has progress up to last checkpoint
- User can resume from last written phase

---

## Parameters / Toggles

| Parameter | Options | Default |
|-----------|---------|---------|
| Risk rigor | Conservative / Balanced / Aggressive | **Conservative** |
| Framework depth | Quick / Standard / Deep | Standard |
| Value check | Full / Key-values-only / Skip | Full |
| Execution mode | Sequential / Parallel | Sequential |
| Question style | One-by-one / Batched | **One-by-one** |

---

## Decision Doc Template (Updated)

```markdown
# Decision: [Title]

## Executive Summary
<!-- Filled in Phase 6, but placed at top -->

**Decision:** [GO/NO-GO/CONDITIONAL]
**Date:** YYYY-MM-DD
**Status:** Active | Decided | Superseded

**Why:** [Brief reasoning]

**Key risks → mitigations:**
1. [Risk] → [Mitigation]

**Success looks like:** [Magic wand answer]

**Review schedule:**
- [Date]: [Check]

---

## Decision Process Log

### Context
[Initial user description]

### Frameworks Applied
[List with selection reasoning]

### Framework: [Name]
**Questions asked:**
1. Q: ... A: ...

**Analysis:**
[Preliminary → User feedback → Final]

**Verdict:** For / Against / Neutral

[Repeat for each framework]

### Value Alignment
| Value | AI Read | User Calibration | Final |
|-------|---------|------------------|-------|

### Synthesis
[Aggregated analysis, consensus, tensions]

### Risks & Mitigations
[Detailed risk table]

---

## Hypothesis
[If applicable, extracted to docs/hypotheses/]

## Related
[Links to related decisions, learnings, content]
```

---

## Resolved Design Questions

1. **Phase 2 structure:** Ask clarifying questions **one by one across all frameworks**. Earlier answers may resolve later questions. Don't batch by framework—interleave intelligently.

2. **Value calibration:** Calibrate per decision, but **write the rationale as an example** to the value skill file. Future readings get tighter. Call out drift if observed.

3. **Risk rigor default:** **Conservative** — surface everything, user dismisses what's not real.

---

## Downstream: Hypothesis → Validation → Learning Loop

The decision workflow doesn't end when the decision is made. It extends into:

### Hypothesis Creation (Phase 6-7)

Every GO decision generates at least one hypothesis:
- **What we believe:** [prediction]
- **Success metrics:** [KPIs with targets]
- **Review date:** [when to check]

Hypothesis doc created in `docs/hypotheses/` with:
- Link back to originating decision
- Specific, measurable success criteria
- Scheduled review date

### Review Trigger System

**Problem:** How do we remember to check hypotheses at the right time?

**Solution: Review Queue**

Create `docs/hypotheses/REVIEW_QUEUE.md`:
```markdown
# Hypothesis Review Queue

## Overdue
| Hypothesis | Review Date | Decision |
|------------|-------------|----------|
| [None] | | |

## This Week
| Hypothesis | Review Date | Decision |
|------------|-------------|----------|
| [Link] | 2025-12-15 | [Link] |

## This Month
| Hypothesis | Review Date | Decision |
|------------|-------------|----------|
| [Link] | 2025-12-31 | [Link] |

## Future
| Hypothesis | Review Date | Decision |
|------------|-------------|----------|
| [Link] | 2025-02-15 | [Link] |
```

**When creating a hypothesis:** Add to REVIEW_QUEUE.md in the appropriate section.

**At session start:** Check REVIEW_QUEUE for overdue or due-this-week items.

### Session Start Ritual

When beginning any working session (`/tactical-session`, `/strategic-review`, or manual):

1. **Check review queue**
   - Any overdue hypotheses?
   - Any due this week?

2. **Surface for user**
   ```
   Before we begin, you have [N] hypotheses due for review:
   - [Hypothesis 1] (due: [date]) - from decision: [link]
   - [Hypothesis 2] (overdue by [N] days)

   Would you like to review these now, defer, or proceed with today's session?
   ```

3. **If reviewing:** Run hypothesis validation workflow

### Hypothesis Validation Workflow

When reviewing a hypothesis:

1. **Load hypothesis doc**
   - Original prediction
   - Success metrics
   - Current observations

2. **Gather current data**
   - What actually happened?
   - Did we hit the KPIs?
   - What surprised us?

3. **Make the call**
   - ✅ **Validated:** Hypothesis confirmed
   - ❌ **Invalidated:** Hypothesis wrong
   - ⚠️ **Inconclusive:** Need more time/data
   - 🔄 **Pivoted:** Circumstances changed, hypothesis no longer applies

4. **Extract learning**
   - What do we now know?
   - Does this change any values or frameworks?
   - Should we update any checklists?

5. **Update system**
   - Write learning to `docs/learnings/`
   - Update value calibration examples if relevant
   - Update framework with new insight if applicable
   - Update hypothesis status
   - Remove from REVIEW_QUEUE or reschedule

### The Closed Loop

```
DECISION
    ↓
HYPOTHESIS (with review date)
    ↓
REVIEW_QUEUE (tracks due dates)
    ↓
SESSION_START (surfaces due reviews)
    ↓
VALIDATION (compare prediction to reality)
    ↓
LEARNING (extract and document)
    ↓
SYSTEM_UPDATE (values, frameworks, checklists)
    ↓
[Loop back: Next decision is better informed]
```

### Value Calibration Evolution

When a value calibration happens during Phase 4:

1. User provides their reading with rationale
2. That rationale is written as an **example application** to the value:

```yaml
# In skills/business-values/SKILL.md or a linked examples file

### Value: Add value to customers in every interaction

**Calibration Examples:**
- **Decision:** Annual review product (2025-12-08)
  - **Situation:** Building a tool primarily for myself
  - **Reading:** ✅ Aligned
  - **Rationale:** "I'm solving my own real problem, and the templates for others are genuine value-adds, not afterthoughts."

- **Decision:** [Future decision]
  - **Situation:** ...
  - **Reading:** ...
  - **Rationale:** ...
```

Over time, these examples create a "case law" of value interpretation. If readings start to drift from earlier examples, surface that:

```
Note: This reading differs from your interpretation in [previous decision].
Then: [reading + rationale]
Now: [proposed reading + rationale]

Is this evolution in your thinking, or should we maintain consistency?
```

---

## Updated Phase 2: One-by-One Clarifying Questions

Instead of batching questions by framework, ask them intelligently:

```
**Clarifying Questions**

I'll ask these one at a time. Earlier answers may resolve later questions.

**Question 1 of [N]:** (from Reversibility framework)
Can you undo this decision easily if it doesn't work out?

[User answers]

**Question 2 of [N]:** (from Opportunity Cost framework)
What are you NOT doing by doing this?

[User answers]

**Question 3 of [N]:** (from Regret Minimization framework)
At 80, looking back, would you regret NOT trying this?

[User answers - but this might already be answered by Q1 and Q2]

Ah, based on your earlier answers, I think I have enough context for the Regret Minimization lens. Let me confirm:
- You said [X], which suggests [Y].
- Does that capture your thinking on regret, or is there more?

[Continue through remaining questions, skipping or confirming those already addressed]
```

**Magic wand + worst case:** Ask once, early, as these inform multiple frameworks:

```
Before we dive into framework-specific questions:

1. **Magic wand:** If this goes perfectly—better than your wildest dreams—what does that look like? What does it unlock for you?

2. **Worst case:** What's the fear? If this fails completely, what does that look like and feel like?

[These answers inform Regret Min, Asymmetric Bets, and Risk analysis]
```
