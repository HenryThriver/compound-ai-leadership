# Compound AI Leadership

> Each business decision should compound institutional wisdom—not deplete it.

This plugin transforms decision-making from isolated events into a self-reinforcing knowledge system.

---

## Operational Rules

**These rules apply to ALL interactions with this system:**

### 1. Verify Date Before Creating Documents
Before creating any document with a date in the filename or content, verify today's actual date. Do not assume or guess.

### 2. Write Frequently
When running any multi-phase workflow (decisions, ingestion, sessions):
- Write to the document after EVERY phase
- Never batch writes until the end
- If a crash occurs, the document should have all progress up to that point
- Treat documents as running logs, not final artifacts

### 3. Interactive Over One-Shot
Decision-making and analysis should be dialogues:
- Ask clarifying questions before concluding
- Confirm analysis at each step before moving on
- Give the user opportunity to augment, correct, or redirect

### 4. Check Review Queue at Session Start
At the start of any session (`/tactical-session`, `/strategic-review`, etc.):
1. Check `docs/hypotheses/REVIEW_QUEUE.md`
2. Surface any overdue or due-this-week items
3. Ask if user wants to address them first

### 5. Value Calibration Compounds
When checking value alignment:
- Ask user to confirm or correct readings
- Write their rationale as an example back to `skills/business-values/SKILL.md`
- Flag drift if current reading differs from past calibrations

### 6. Intuition Matters
Don't rely solely on rational frameworks:
- Capture gut feel, excitement, and energy at the start
- Check if rational conclusions align with intuition
- Explore divergence as data, not a problem

---

## Core Resources

**Always load these for any decision or session:**

| Resource | Location | Purpose |
|----------|----------|---------|
| Business Values | `skills/business-values/SKILL.md` | Operational principles - every decision aligns to these |
| Decision Frameworks | `skills/decision-frameworks/SKILL.md` | Mental models for recurring decision types |
| Key Learnings | `docs/learnings/README.md` | Mistakes we won't make twice |

**Load as needed:**

| Resource | Location | When |
|----------|----------|------|
| Tactical Checklists | `skills/tactical-checklists/` | Specific repeatable procedures |
| Author Profiles | `skills/author-profiles/` | When consulting external mentors |
| Past Decisions | `docs/decisions/` | When context from prior decisions matters |
| Active Hypotheses | `docs/hypotheses/` | When validating experiments |

---

## Agents

### Internal (Org Chart Functions)
Located in `agents/internal/`. Represent functional perspectives:
- `customer-success-oracle` - Retention, satisfaction, support patterns
- `marketing-strategist` - Growth, positioning, messaging
- `sales-advisor` - Revenue, customer acquisition, deal dynamics
- `operations-optimizer` - Efficiency, process, scalability
- `finance-guardian` - Unit economics, cash flow, investment decisions
- `product-advocate` - User needs, feature prioritization, roadmap

### External (Mentor Holograms)
Located in `agents/external/`. Psychographic models of thought leaders.
- Built from ingested content (books, interviews, letters)
- Invoke for major decisions requiring outside perspective
- Use `mentor-template.md` to create new mentors

### Analysis
Located in `agents/analysis/`. Cross-functional analysis:
- `metrics-interrogator` - Signal vs noise
- `hypothesis-validator` - Test assumptions
- `blind-spot-detector` - Surface what you're missing

---

## Commands

| Command | Location | Purpose |
|---------|----------|---------|
| `/tactical-session` | `commands/meetings/` | Structured working sessions |
| `/strategic-review` | `commands/meetings/` | Big picture reviews with mentors |
| `/ingest` | `commands/ingestion/` | Process content into knowledge base |
| `/compound-decision` | `commands/workflows/` | Document decisions while fresh |
| `/retrospective` | `commands/workflows/` | Validate hypotheses, update learnings |

---

## The Feedback Loop

```
INGEST (content) → KNOWLEDGE BASE → RUN (meetings) → DECISIONS → RETROSPECTIVES
     ↑                                                                    ↓
     └────────────────────────────────────────────────────────────────────┘
```

Every piece flows back into the system. The goal: compound wisdom, not deplete it.

---

## Working With This System

### Before Any Decision
1. Load `skills/business-values/SKILL.md`
2. Check `docs/decisions/` for related prior decisions
3. Identify which frameworks from `skills/decision-frameworks/SKILL.md` apply

### During Meetings/Sessions
1. Spawn relevant internal agents
2. Surface applicable tactical checklists
3. For major decisions, consult 2-3 external mentors

### After Decisions
1. Run `/compound-decision` to capture reasoning
2. Extract hypotheses to `docs/hypotheses/`
3. Set review dates for validation

### When Things Go Wrong
1. Document in `docs/learnings/`
2. Update relevant checklists or values
3. The system should prevent repeat failures

---

## Meta-Product Notes

This system is built in public. Building it generates content:
- Decisions → case studies
- Solved annoyances → micro-products
- Journey → newsletter material

The thesis: AI-augmented leadership compounds faster than traditional approaches.
