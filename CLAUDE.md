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
2. Check `docs/job-search/NEXT_ACTIONS.md` for relationship/job search tasks
3. Check `docs/relationships/loops/open.md` for due loops
4. Surface any overdue or due-this-week items
5. Ask if user wants to address them first

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

### Foundational (Who I Am)

These define the person making decisions—load first to ground everything else:

| Resource | Location | Purpose |
|----------|----------|---------|
| Personal Values | `skills/personal-values/SKILL.md` | Deep philosophy of what I value - cascades into all else |
| Personal Qualities | `skills/personal-qualities/SKILL.md` | How I want to show up in the world |

### Operational (How I Work)

These translate personal values into business context:

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
| LinkedIn Voice | `skills/linkedin-voice/SKILL.md` | When drafting LinkedIn posts |
| Past Decisions | `docs/decisions/` | When context from prior decisions matters |
| Active Hypotheses | `docs/hypotheses/` | When validating experiments |
| Relationship Building | `skills/relationship-building/SKILL.md` | When working on networking/connections |
| Job Search Actions | `docs/job-search/NEXT_ACTIONS.md` | **Check at session start** - active tasks |
| Career Thesis | `docs/job-search/career-thesis.md` | When evaluating opportunities |
| Company Scorecard | `docs/job-search/company-scorecard.md` | When researching target companies |
| Open Loops | `docs/relationships/loops/open.md` | POGs, Asks, Intros to follow up on |

### Knowledge Compounding (Content → Wisdom)

Two stables of accumulated knowledge, built from consumed content:

| Resource | Location | Purpose |
|----------|----------|---------|
| **Big Idea** | `docs/content/BIG_IDEA.md` | Philosophy behind knowledge compounding |
| **Content Library** | `docs/content/` | All consumed content with notes |
| **Functional Areas** | `skills/functional/` | Domain expertise (marketing, product, voice-ai, etc.) |
| **Thinker Avatars** | `skills/thinkers/` | Individual worldviews (Paul Graham, Reid Hoffman, etc.) |
| **POG Index** | `docs/pogs/INDEX.md` | Shareable content with your angle |
| **Content Ingestion** | `skills/content-ingestion/SKILL.md` | Workflow for processing content |

**Templates for consistency:**
- `skills/thinkers/_TEMPLATE/` — Structure for every thinker profile
- `skills/functional/_TEMPLATE/` — Structure for every functional area
- `docs/content/_TEMPLATE.md` — Structure for every content file

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

**All agents embody personal values and qualities.** They are extensions of my psyche—functional AND kind, precise, clear, and aligned with what I value. An agent can be purely analytical while still being compassionate in how it surfaces hard truths.

### External (Thinker Avatars)
Located in `skills/thinkers/`. Deep profiles of thought leaders built from their content.
- Each thinker has: PROFILE.md (worldview), CANON.md (content consumed), INSIGHTS.md (ideas)
- Built incrementally through content ingestion workflow
- Depth score reflects confidence in simulation
- Invoke for perspective, advice, or debate
- See `skills/thinkers/_TEMPLATE/` for structure

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
| `/ingest-content` | `skills/content-ingestion/SKILL.md` | Process content → functional areas + thinkers + POGs |
| `/compound-decision` | `commands/workflows/` | Document decisions while fresh |
| `/retrospective` | `commands/workflows/` | Validate hypotheses, update learnings |
| `/analyze-voice` | `commands/workflows/` | Seed LinkedIn voice by analyzing posts |
| `/draft-post` | `commands/workflows/` | Draft LinkedIn post with validation |
| `/review-post-image` | `commands/workflows/` | Validate post images for LinkedIn specs |

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
1. Load `skills/business-values/SKILL.md` (operational principles)
2. Check `docs/decisions/` for related prior decisions
3. Identify which frameworks from `skills/decision-frameworks/SKILL.md` apply
4. If something feels misaligned, surface it—don't hard-stop

Note: Personal values are embodied, not checked per-decision. They surface in periodic reviews.

### During Meetings/Sessions
1. Spawn relevant internal agents
2. Surface applicable tactical checklists
3. For major decisions, consult 2-3 external mentors

### After Decisions
1. Run `/compound-decision` to capture reasoning
2. Extract hypotheses to `docs/hypotheses/`
3. Set review dates for validation

### When Communicating Publicly
1. Load `skills/linkedin-voice/SKILL.md` (voice and style)
2. Embody personal qualities—don't reference them explicitly
3. Show, don't tell. Live the values; don't announce them.

### When Things Go Wrong
1. Document in `docs/learnings/`
2. Update relevant checklists or values
3. The system should prevent repeat failures

### Periodic Reviews (Values & Qualities Check)
Values and qualities are embodied daily but reviewed periodically:

**Weekly Review:**
- Scan decision logs and communications from the week
- Gut-check: Did I live my values? Which qualities showed up?
- Surface misalignments for reflection (not judgment)

**Monthly Review:**
- Notice patterns and drift
- Ask: Are my stated values still my actual values?
- Update `skills/personal-values/SKILL.md` or `skills/personal-qualities/SKILL.md` if needed

**When Misalignment Surfaces:**
- It's data, not failure
- Either reconsider the behavior OR reconsider the value
- Document the tension and resolution in decision logs

---

## Meta-Product Notes

This system is built in public. Building it generates content:
- Decisions → case studies
- Solved annoyances → micro-products
- Journey → newsletter material

The thesis: AI-augmented leadership compounds faster than traditional approaches.
