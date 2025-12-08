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
| Risk rigor | Conservative / Balanced / Aggressive | Balanced |
| Framework depth | Quick / Standard / Deep | Standard |
| Value check | Full / Key-values-only / Skip | Full |
| Execution mode | Sequential / Parallel | Sequential |

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

## Open Questions for You

1. **Phase 2 structure:** Should I ask ALL clarifying questions for ALL frameworks upfront, or ask per-framework and go deeper on each before moving to next?

2. **Value calibration:** Do you want to pre-calibrate your value interpretations once (store as examples), or calibrate fresh each decision?

3. **Risk rigor default:** Conservative (surface everything), Balanced (likely + high-impact), or Aggressive (only critical)?

4. **Anything missing from this flow?**
