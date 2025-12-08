# Compound AI Leadership

> Each business decision should compound institutional wisdom—not deplete it.

A Claude Code plugin for AI-augmented leadership. Transforms decision-making from isolated events into a self-reinforcing knowledge system.

## What Is This?

This is an operational system for running a business with AI assistance that gets smarter over time. It's built on the premise that:

1. **Decisions leak wisdom** - Traditional meetings and decisions happen, but the reasoning evaporates. This system captures it.

2. **Compounding beats accumulating** - Each decision, each piece of content consumed, each retrospective feeds back into the system.

3. **AI agents can embody perspectives** - Internal "org chart" agents and external "mentor" agents provide consistent, documented viewpoints.

4. **Building in public validates the thesis** - This project is itself proof-of-concept for AI-augmented leadership.

## Quick Start

```bash
# Install the plugin
claude plugins add ThriverHenry/compound-ai-leadership

# Run a tactical session
/tactical-session reviewing customer feedback

# Document a decision
/compound-decision pricing new tier at $29

# Ingest valuable content
/ingest https://paulgraham.com/ds.html
```

## Architecture

```
compound-ai-leadership/
├── agents/
│   ├── internal/          # Org chart functions (CS, marketing, ops...)
│   ├── external/          # Mentor holograms (Bezos, Jobs, etc.)
│   ├── analysis/          # Metrics, hypotheses, blind spots
│   └── synthesis/         # Cross-functional decision support
│
├── commands/
│   ├── meetings/          # /tactical-session, /strategic-review
│   ├── ingestion/         # /ingest
│   └── workflows/         # /compound-decision, /retrospective
│
├── skills/
│   ├── business-values/   # Core operational principles
│   ├── decision-frameworks/ # Mental models
│   ├── tactical-checklists/ # Repeatable procedures
│   └── author-profiles/   # Ingested thought leaders
│
└── docs/
    ├── decisions/         # Decision log with full reasoning
    ├── hypotheses/        # Active experiments
    ├── retrospectives/    # Validated/invalidated learnings
    └── ingested/          # Content summaries
```

## Core Concepts

### Internal Agents
Represent functional perspectives in your organization. The `customer-success-oracle` thinks about retention and satisfaction. The `finance-guardian` thinks about unit economics and cash flow. They're always consistent with their documented perspective.

### External Agents (Mentor Holograms)
Psychographic models of thought leaders whose frameworks you've internalized. When you face a major decision, you can consult "Bezos" on customer obsession or "Munger" on avoiding stupidity. They're built from ingested content—the more you read, the richer they become.

### The Feedback Loop
```
INGEST (content) → KNOWLEDGE BASE → RUN (meetings) → DECISIONS → RETROSPECTIVES → INGEST
```

Every piece of content you consume gets distributed to values, checklists, and personas. Every decision you make gets documented with full reasoning. Every retrospective validates or invalidates hypotheses. The system compounds.

## Commands

| Command | Purpose |
|---------|---------|
| `/tactical-session [topic]` | Run a working session with relevant agents |
| `/strategic-review` | Big picture review with mentor consultation |
| `/compound-decision [context]` | Document a decision while reasoning is fresh |
| `/ingest [content]` | Extract and distribute learnings from content |
| `/retrospective` | Validate hypotheses and update knowledge base |

## Business Values

The system enforces these operational principles:

1. **Add value to customers in every interaction**
2. **Do not make the same mistake twice**
3. **The best support is not needing support**
4. **Respect human time**
5. **Invert enshittification**
6. **Measure what matters**
7. **Revenue proves value**

See `skills/business-values/SKILL.md` for detailed application and anti-patterns.

## Building in Public

This project is both a tool and a demonstration. The newsletter documents the journey:
- Each decision made while building becomes a case study
- Each solved annoyance becomes a potential micro-product
- Subscribers get early access to tools as they mature

## Contributing

This is a personal operating system being built in public. If the approach resonates:
- Star the repo to follow along
- Open issues for questions or suggestions
- Fork and adapt for your own values and mentors

## License

MIT - Use freely, adapt to your own philosophy.

---

*"The goal is to free up time for curating the ingestion stream, letting the system compound while you focus on what matters."*
