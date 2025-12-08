# Learning: Decision Workflow V1 Friction Points

**Date:** 2025-12-08
**Category:** process
**Severity:** moderate

## What Happened
First real test of the `/compound-decision` workflow revealed significant friction. The system produced output but the experience felt like a one-shot analysis rather than an interactive decision-making session.

## Why It Happened
The initial workflow was designed as "gather context → analyze → output document" rather than "dialogue → clarify → confirm → document incrementally."

## What We Learned

### 1. Framework Selection Should Be Interactive
The system applied frameworks without confirming with the user. Better: propose frameworks, explain fit, ask which to use.

### 2. Clarifying Questions Before Conclusions
Jumped to conclusions without asking the questions that would inform them. Each framework has diagnostic questions—ask them BEFORE analyzing.

### 3. Value Alignment Needs Calibration
My interpretation of values vs user's interpretation may differ. Need mechanism for user to calibrate/confirm value alignment readings.

### 4. Step-by-Step Confirmation Required
Should pause after each framework for user to confirm, deny, or augment. User's thinking may evolve mid-process.

### 5. Write Frequently to Prevent Context Loss
Sub-agents can lose context on compact/crash. Write to decision doc after every phase, not just at the end.

### 6. Executive Summary Belongs at Top
Final doc should lead with decision + key reasoning, not bury it after all the analysis.

### 7. Best/Worst Case Visioning Missing
Standard questions should include aspirational ("magic wand success") and fear-surfacing ("worst case") to get full picture.

### 8. Date Check Before Doc Creation
Embarrassing error: used 2024 instead of 2025. Add date verification to doc creation workflow.

## Prevention Mechanism

- [x] Learning documented: this file
- [ ] CLAUDE.md updated: date checking, write-frequently principle
- [ ] compound-decision.md rewritten: interactive, phased architecture
- [ ] business-values/SKILL.md: add calibration mechanism
- [ ] decision-frameworks/SKILL.md: add best/worst case visioning
- [ ] Decision doc template: executive summary at top

## Verification
Re-run annual review product decision with new workflow. Should feel like an interactive dialogue that yields a well-documented decision, not a one-shot analysis dump.

## Related
- Decision that surfaced this: `docs/decisions/product/2025-12-08-annual-review-product-draft.md`
