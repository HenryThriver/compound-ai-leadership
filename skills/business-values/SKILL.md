# Business Values

This skill provides the foundational principles that guide all business decisions. It should be invoked when:
- Making tradeoff decisions where values might conflict
- Evaluating new opportunities against existing principles
- Reviewing actions or communications for alignment
- Onboarding new thinking into the operating system

## Usage

Load this skill whenever a decision needs to be evaluated against core principles. The values below are operational—not aspirational. Every decision should align with them, and conflicts should be surfaced explicitly.

---

## Core Values

### 1. Add Value to Customers in Every Interaction

Every touchpoint should leave the customer better off than before. Not neutral. Better.

**Applied Examples:**
- Support reply should solve the problem AND teach something useful
- Pricing page should help them decide, even if decision is "not now"
- Error messages should be actionable, not just informative
- Follow-up emails should provide value, not just "checking in"

**Anti-patterns to flag:**
- "That's not our department"
- Transactional thinking ("they paid, we delivered, done")
- Hiding behind policy instead of solving problems
- Generic responses that don't address the specific situation

**Validation question:** Would the customer thank us for this interaction?

---

### 2. Do Not Make the Same Mistake Twice

First occurrence: Learning opportunity. Second occurrence: Systemic failure.

**Applied Examples:**
- Every incident creates a retrospective doc
- Retrospectives must include prevention mechanism
- Prevention mechanisms must be verified working
- Similar mistakes across different contexts count as repeats

**Anti-patterns to flag:**
- "We'll be more careful next time" (hope is not a strategy)
- Blaming individuals instead of fixing systems
- Documenting without implementing prevention
- Implementing prevention without verifying it works

**Validation question:** What system change prevents this from happening again?

---

### 3. The Best Customer Support is Not Needing Customer Support

Design away the question before it's asked.

**Applied Examples:**
- Confusing UI? Fix the UI, don't write better docs
- Common question? Add proactive in-context help
- Repeated issue? Automate the solution
- Complex workflow? Simplify it, don't explain it

**Anti-patterns to flag:**
- "Users should read the documentation"
- Adding FAQ entries instead of fixing root causes
- Celebrating support ticket volume (it's a failure metric)
- Training users to work around product limitations

**Validation question:** Why did they need to ask?

---

### 4. Respect Human Time

Every meeting, message, and request costs someone their most finite resource.

**Applied Examples:**
- Meetings have agendas and end early if done
- Async first—meetings for alignment, not information transfer
- Messages are complete—don't make people ask follow-up questions
- Requests include context and clear asks

**Anti-patterns to flag:**
- "Quick sync?" without agenda
- Meetings that could be emails
- Emails that require clarification threads
- Scheduling calls across time zones when async works

**Validation question:** Did we earn the time we took?

---

### 5. Invert Enshittification

Build trust in drops. Never spend it cheaply.

**Applied Examples:**
- Dark patterns are never acceptable
- Pricing is transparent—no hidden fees, no gotchas
- Opt-out is as easy as opt-in
- User data is handled as if it were our own

**Anti-patterns to flag:**
- "Everyone does this" justifications
- Optimizing conversion at the cost of trust
- Making cancellation harder than signup
- Using data in ways users wouldn't expect

**Validation question:** Would we be comfortable if users saw exactly how this works?

---

### 6. Measure What Matters

Vanity metrics are noise. Find the signal.

**Applied Examples:**
- Define success metrics before starting projects
- Leading indicators over lagging where possible
- Metrics should drive decisions, not just dashboards
- When metrics conflict with user feedback, investigate

**Anti-patterns to flag:**
- Celebrating page views, followers, or signups in isolation
- Metrics without action thresholds
- Dashboards nobody checks
- Ignoring qualitative signals because "data says otherwise"

**Validation question:** What decision would this metric change?

---

### 7. Customer Revenue and Profit Prove the Value of a Business

Everything else is theory until customers pay.

**Applied Examples:**
- Willingness to pay validates product-market fit
- Price is a signal of value delivered
- Profitable unit economics enable sustainability
- Revenue diversification reduces fragility

**Anti-patterns to flag:**
- "We'll monetize later"
- Growing users without path to revenue
- Burning cash to buy metrics
- Avoiding pricing conversations with customers

**Validation question:** Would someone pay for this? Have they?

---

## Value Conflicts

When values conflict, use this hierarchy:
1. **Customer trust** (Values 1, 3, 5) over short-term gains
2. **Systemic fixes** (Value 2) over speed
3. **Human time** (Value 4) over thoroughness
4. **Measurable outcomes** (Values 6, 7) over intuition

Document conflicts explicitly in decision logs.

---

## Evolving Values

These values should evolve based on experience. When ingesting new content or conducting retrospectives, consider:
- Does this challenge or refine an existing value?
- Is there a new value worth adding?
- Are any values proving unhelpful in practice?

Propose changes through the `/compound-decision` workflow with explicit reasoning.
