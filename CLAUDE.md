# Compound AI Leadership

> Each business decision should compound institutional wisdom—not deplete it.

This plugin transforms decision-making from isolated events into a self-reinforcing knowledge system. Every meeting, every decision, every piece of content consumed becomes fuel for better future decisions.

## Philosophy

### The Compounding Principle
Traditional business operations leak wisdom. Decisions happen in meetings, rationale lives in someone's head, lessons learned evaporate. This system captures, structures, and compounds that wisdom.

**The feedback loop:**
```
INGEST (content) → KNOWLEDGE BASE → RUN (meetings) → DECISIONS → RETROSPECTIVES → INGEST
```

### Core Values
These aren't aspirational—they're operational. Every decision gets reviewed against them.

1. **Add value to customers in every interaction** - Not neutral. Better.
2. **Do not make the same mistake twice** - First occurrence: learn. Second: systemic failure.
3. **The best support is no support needed** - Design away the question.
4. **Respect human time** - Meetings, messages, everything has a cost.
5. **Invert enshittification** - Build trust in drops, never spend it cheaply.
6. **Measure what matters** - Vanity metrics are noise. Find the signal.
7. **Revenue proves value** - Customers pay for solutions to real problems.

---

## Architecture

### Agents

#### Internal Agents (Org Chart Functions)
Represent functional perspectives in your organization:
- `marketing-strategist` - Growth, positioning, messaging
- `sales-advisor` - Revenue, customer acquisition, deal dynamics
- `customer-success-oracle` - Retention, satisfaction, support patterns
- `operations-optimizer` - Efficiency, process, scalability
- `finance-guardian` - Unit economics, cash flow, investment decisions
- `product-advocate` - User needs, feature prioritization, roadmap

#### External Agents (Mentor Holograms)
Psychographic models of thought leaders whose frameworks you've internalized:
- Invoke for major decisions requiring outside perspective
- Built from ingested content (books, interviews, letters)
- Each has distinct decision frameworks and red flags

#### Analysis Agents
- `metrics-interrogator` - Finds the signal in the noise
- `hypothesis-validator` - Tests assumptions against evidence
- `blind-spot-detector` - Surfaces what you're not seeing

### Commands

#### Meetings (`/tactical-session`, `/strategic-review`)
Structured decision sessions that:
1. Pull relevant context from knowledge base
2. Invoke appropriate internal agents
3. Surface decision against core values
4. Optionally consult external mentors
5. Document decisions with full reasoning chain

#### Ingestion (`/ingest`)
When you consume content:
1. Extract key ideas, frameworks, examples
2. Profile the author (style, worldview, biases)
3. Distribute learnings across PKM:
   - New values or refinements
   - Tactical checklists
   - Agent persona updates
   - Big ideas by function

#### Decision Capture (`/compound-decision`)
When you make a decision:
1. Crystallize the what and why
2. Extract the hypothesis being tested
3. Define success metrics
4. Log tradeoffs explicitly
5. Run past relevant mentors
6. Store in searchable decision log

### Skills

#### `business-values`
The canonical source of operational principles with examples and anti-patterns.

#### `decision-frameworks`
Mental models for recurring decision types:
- Reversible vs irreversible (Type 1/Type 2)
- Regret minimization
- Second-order effects

#### `tactical-checklists`
Repeatable procedures for recurring situations:
- Customer inquiry response
- Pricing change review
- Hiring decisions

#### `author-profiles`
Structured models of ingested thought leaders, enabling mentor agent creation.

---

## Workflows

### Daily: Tactical Sessions
For working sessions (customer inquiries, operational decisions):
```
/tactical-session [context]
```
Spawns relevant internal agents, surfaces applicable checklists, ensures alignment with values.

### Weekly: Strategic Review
For bigger picture thinking:
```
/strategic-review
```
Reviews active hypotheses, validates metrics, consults external mentors on major decisions.

### On Content: Ingestion
When you read/watch/listen to something valuable:
```
/ingest [content or URL]
```
Extracts and distributes learnings across the system.

### On Decision: Compound
When you make a decision worth documenting:
```
/compound-decision [context]
```
Captures full reasoning chain for future reference.

### Monthly: Retrospective
Review hypotheses, validate/invalidate, update knowledge base:
```
/retrospective
```

---

## The Meta-Product

This system is itself a product in development. Building it in public:
- Each decision becomes a case study
- Each solved annoyance becomes a potential micro-product
- The newsletter documents the journey
- Subscribers get access to the tools as they mature

**The thesis:** AI-augmented leadership compounds faster than traditional approaches. This project proves it by example.

---

## Key Learnings

<!-- This section grows as we learn. Each entry is a mistake we won't make twice. -->

*None yet. We're just getting started.*
