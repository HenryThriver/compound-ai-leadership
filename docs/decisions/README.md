# Decision Log

Decisions documented with full reasoning chain. The goal: never make the same decision twice, and always learn from outcomes.

---

## Why Document Decisions?

1. **Reasoning decays** - In 3 months you won't remember why you chose X over Y
2. **Context matters** - Future you needs to know what you knew then
3. **Patterns emerge** - Reviewing past decisions reveals tendencies
4. **Learning requires data** - Can't validate hypotheses without recording bets

---

## Decision Categories

Organize decisions by domain:

```
decisions/
├── pricing/          # Pricing, packaging, revenue model
├── product/          # Features, roadmap, UX decisions
├── hiring/           # Team, contractors, roles
├── strategy/         # Business model, market, partnerships
├── operations/       # Process, tools, systems
└── communication/    # Messaging, support, content
```

---

## Decision Document Structure

Created via `/compound-decision` workflow. See `commands/workflows/compound-decision.md` for full template.

Key sections:
- **Summary** - One paragraph
- **Context** - What situation prompted this
- **Decision** - What we decided
- **Reasoning** - Why we chose this
- **Alternatives** - What else we considered
- **Hypothesis** - The bet we're making (links to `docs/hypotheses/`)
- **Tradeoffs** - What we're gaining/losing/risking
- **Value Alignment** - Check against business values
- **Review Schedule** - When to revisit

---

## Finding Past Decisions

When facing a new decision:
1. Check if similar decision exists in relevant category
2. Review the reasoning and outcome
3. Check linked hypotheses - were they validated?
4. Apply learnings to current situation

---

## Decision Index

*Populate through `/compound-decision` workflow*

<!--
### Pricing
- [YYYY-MM-DD] [Title](pricing/file.md) - [Status]

### Product
- [YYYY-MM-DD] [Title](product/file.md) - [Status]

### Hiring
- [YYYY-MM-DD] [Title](hiring/file.md) - [Status]

### Strategy
- [YYYY-MM-DD] [Title](strategy/file.md) - [Status]

### Operations
- [YYYY-MM-DD] [Title](operations/file.md) - [Status]
-->
