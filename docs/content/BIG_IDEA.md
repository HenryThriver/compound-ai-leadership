# The Big Idea: Compounding Content Ingestion

> Every piece of content you consume should compound your institutional wisdom—not evaporate after reading.

---

## The Problem

Most knowledge work is extractive:
- Read an article → share it → forget it
- Highlight a book → close it → lose the insights
- Learn from a thinker → never systematically capture their worldview

The result: **knowledge entropy**. You've read thousands of articles, but can you retrieve the key insight from any of them? Can you simulate what Paul Graham would say about your current problem?

## The Solution: Dual-Routing Knowledge Architecture

Every piece of content you consume gets **dual-routed**:

1. **Functional Areas** — Domain expertise accumulates (GTM, Product, RevOps, etc.)
2. **Thinker Avatars** — Individual worldviews deepen (Paul Graham, Reid Hoffman, etc.)

Over time, you build two powerful assets:
- A **functional knowledge base** you can query for domain expertise
- A **stable of mentors** you can consult for perspective and debate

---

## How It Compounds

```
                    ┌─────────────────────────────────────────┐
                    │           CONTENT INGESTION             │
                    │   (Article, Book, Podcast, Interview)   │
                    └─────────────────┬───────────────────────┘
                                      │
                                      ▼
                    ┌─────────────────────────────────────────┐
                    │         CONTENT FILE CREATED            │
                    │   docs/content/2026/[content-name].md   │
                    │   • Source link & metadata              │
                    │   • Your highlights & notes             │
                    │   • Key insights extracted              │
                    └─────────────────┬───────────────────────┘
                                      │
                          ┌───────────┴───────────┐
                          │                       │
                          ▼                       ▼
          ┌───────────────────────┐   ┌───────────────────────┐
          │   FUNCTIONAL AREAS    │   │   THINKER AVATARS     │
          │                       │   │                       │
          │ skills/functional/    │   │ skills/thinkers/      │
          │ • marketing/          │   │ • paul-graham/        │
          │ • sales/              │   │ • reid-hoffman/       │
          │ • product/            │   │ • adam-gross/         │
          │ • voice-ai/           │   │ • dan-shipper/        │
          │ • revops/             │   │                       │
          │                       │   │ Each thinker has:     │
          │ Each area has:        │   │ • PROFILE.md          │
          │ • INSIGHTS.md         │   │ • CANON.md            │
          │   (accumulated)       │   │ • INSIGHTS.md         │
          └───────────┬───────────┘   └───────────┬───────────┘
                      │                           │
                      └─────────────┬─────────────┘
                                    │
                                    ▼
                    ┌─────────────────────────────────────────┐
                    │            POG INDEX                    │
                    │   (If content is shareable)             │
                    │   docs/pogs/INDEX.md                    │
                    │   • Curated "greatest hits"             │
                    │   • Your take on each piece             │
                    │   • Tagged by topic/relevance           │
                    └─────────────────────────────────────────┘
```

---

## The Compounding Effects

### 1. Functional Expertise Compounds
Each article about GTM adds to your GTM knowledge base. After 50 articles, you have a synthesized understanding that no single article could provide. You can ask: "What do I know about expansion revenue?" and get cited answers from your accumulated reading.

### 2. Thinker Depth Compounds
Each Paul Graham essay deepens your PG model. After reading 30 essays, you can legitimately ask: "What would Paul Graham say about this pricing decision?" and get a response grounded in his actual writing, not generic LLM knowledge.

### 3. POG Quality Compounds
Your library of "shareable content with your take" grows. When meeting someone new, you can dynamically surface relevant content based on their interests. The more you read, the more connection currency you have.

### 4. Cross-Pollination Compounds
An insight from a marketing article might inform your product thinking. A Paul Graham essay about startups might apply to your RevOps strategy. The connections multiply as the library grows.

---

## Why This Is Different

| Traditional Approach | Compounding Approach |
|---------------------|---------------------|
| Read → Share → Forget | Read → Extract → Route → Accumulate |
| Knowledge lives in your head | Knowledge lives in queryable system |
| "I read something about that once..." | "Here's what I know, with sources" |
| Generic AI advice | Advice grounded in YOUR reading |
| Surface-level mentor simulation | Deep avatar built from their actual work |

---

## Data Sovereignty

**Principle:** Your knowledge base must be vendor-independent and locally owned.

### Why This Matters

1. **Vendor Lock-in Prevention** — Readwise (or any service) could change, shut down, or alter their API. Your years of accumulated highlights shouldn't disappear with them.

2. **Linkrot Protection** — Original articles vanish. Paywalls go up. Sites restructure. The full text archived locally ensures the content survives.

3. **Offline Capability** — Your knowledge system should work without internet access. Local markdown files ensure this.

4. **True Ownership** — If you can't export it, you don't own it. Every piece of content in this system is plain markdown, portable anywhere.

### Implementation

Every content file in `docs/content/` includes:
- **Full article text** at the bottom, converted to markdown
- **Original source URL** for reference
- **Highlights and notes** extracted from Readwise

This means Readwise is a **capture tool**, not the system of record. The local files ARE the system of record.

### Trade-offs

- Content files are larger (full text included)
- Ingestion takes slightly longer (conversion to markdown)
- Worth it for permanence and independence

---

## The Architecture

### Content Library (`docs/content/`)
- Every piece of content gets its own file
- Metadata: source, date, thinker(s), functional area(s)
- Your highlights and notes preserved
- Key insights extracted

### Functional Areas (`skills/functional/`)
- Domain expertise organized by topic
- Each area has `INSIGHTS.md` — accumulated knowledge with citations
- New areas created organically as content demands
- Every insight traces back to source content

### Thinker Avatars (`skills/thinkers/`)
- Individual worldviews captured
- `PROFILE.md` — who they are, key themes, thinking patterns
- `CANON.md` — what you've consumed, depth tracker
- `INSIGHTS.md` — their ideas, cited to source
- Depth = confidence in simulation

### POG Index (`docs/pogs/`)
- Curated content worth sharing
- Your take/commentary on each piece
- Tagged for dynamic matching to contacts

---

## Rigor & Consistency

**The danger**: organic growth becomes chaotic sprawl.

**The solution**:
1. Every thinker folder follows identical template (`_TEMPLATE/`)
2. Every functional area follows identical template
3. Each folder has its own `CLAUDE.md` defining structure
4. Ingestion workflow enforces consistency
5. Periodic audits normalize any drift

---

## Approval Gates

To build confidence in the system, the ingestion workflow includes explicit approval gates:

1. **Content file creation** — Review before saving
2. **Functional area routing** — Approve what goes where
3. **Thinker routing** — Approve attribution and insights
4. **POG marking** — Confirm if shareable

This adds overhead initially but ensures the system reflects your actual thinking, not automated assumptions.

---

## The Vision

In 12 months:
- **50+ thinkers** with varying depth (10 deep, 40 shallow)
- **15+ functional areas** with accumulated insights
- **200+ pieces of content** indexed and cross-referenced
- **100+ POGs** ready to share with the right person at the right time

You can:
- Ask any functional question and get YOUR synthesized answer
- Consult any thinker for THEIR perspective (grounded in their work)
- Stage a debate between thinkers on any topic
- Instantly surface relevant content for any new contact

This is **compound interest for knowledge work**.

---

## Changelog

| Date | Change |
|------|--------|
| 2026-01-07 | Initial architecture designed |
| 2026-01-07 | Added Data Sovereignty principle (vendor independence, linkrot protection) |

