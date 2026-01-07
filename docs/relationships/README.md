# Relationships

CLI testing ground for relationship-building workflows. Patterns validated here feed into CultivateHQ.

## Structure

```
relationships/
├── contacts/
│   └── cro-revops/     # Job search test network
│       ├── INDEX.md    # Contact list with RQ scores
│       └── [name].md   # Baseball cards
├── loops/
│   ├── open.md         # Active POGs, Asks, Intros
│   └── closed.md       # Completed loops
└── sessions/
    └── [date].md       # Relationship session logs
```

## Key Concepts

**RQ Score (Ferrazzi Greenlight Relationship Quality):**

| Score | Label | Definition |
|-------|-------|------------|
| 5 | Ambassador | Long-term friend that actively advocates and supports each other's success |
| 4 | Close Contact | Intimate personal and professional relationship, worked well together over time |
| 3 | Recurring Contact | Familiar relationship with recurring contact and some value exchange |
| 2 | Connected | One dedicated conversation/meeting, they know each other's role professionally |
| 1 | Aware | Early awareness and communication exist, but no meeting or relationship |
| 0 | Unaware | No communication or response, not on their radar (target list) |
| -1 | Strained | An unresolved issue is negatively impacting ability to work together |

**Loop Types:**
- **POG (Packet of Generosity):** Value you're giving
- **Ask:** Request you're making
- **Intro:** Connection facilitation (either direction)

**Loop States:**
- Queued → Active → Pending → Closed

## Quick Commands

- Capture an interaction: Start here, document what happened
- Log intro offers: Create open loops
- Research someone: Build a baseball card before connecting

---

*This system compounds. Every interaction captured feeds future preparation.*
