# GTM — Insights

Accumulated ideas, frameworks, and opinions on go-to-market strategy.

---

## GTM 3.0 Framework

### GTM 3.0 = Individual → Team → Enterprise

Go-to-market 3.0 is not a sales motion—it is a business model, a business architecture, and fundamental to your customer journey. Instead of selling to the department first and then selling to the enterprise, you start with adoption at the individual level, migrate up to the team via self-serve, and then ultimately have an enterprise motion on top.

> "PLG is not a sales motion. Go-to-market 3.0 is not a sales motion; it is a business model, it is a business architecture, and it is fundamental to your customer journey."

**Source:** `docs/content/2026/01-08-adam-gross-self-serve-gtm-heavybit-2020.md`
**Tags:** `plg`, `framework`

---

### Three Value Propositions

Each tier has a distinct value proposition—you can't just offer the same product with modest differentiation:

| Tier | Value Prop | GTM Motion | Key Metric |
|------|-----------|------------|------------|
| Free / Individual | Creation | Adoption | MAU |
| Team (self-serve) | Collaboration | Self-serve | MRR |
| Enterprise (C-level) | Compliance | Enterprise sales | ACV |

If you're just offering the same product with modest differentiation from free to team, you're going to have limited success in conversion. It has to be a distinct value proposition.

**Source:** `docs/content/2026/01-08-adam-gross-self-serve-gtm-heavybit-2020.md`
**Tags:** `framework`, `value-prop`

---

### Two PMF Cycles

The transition from Free→Team and Team→Enterprise represent two distinct product-market fit cycles. When you have that nonlinear value proposition change as you go from free to team, it's almost like there are two customer discovery cycles that need to happen.

**Source:** `docs/content/2026/01-08-adam-gross-self-serve-gtm-heavybit-2020.md`
**Tags:** `pmf`, `framework`

---

## Timing & Transitions

### $10M-$30M ARR Enterprise Band

Don't begin thinking about enterprise until your self-serve business is at about $10M ARR. But if you're past $30M and haven't done it, that's suspicious. This is the tolerance band for graduating from team mode to enterprise mode.

When you're ready for enterprise, don't start with a Head of Sales—start with a solution-oriented sales rep who's comfortable helping the CEO, product teams, and marketing team discover the enterprise value proposition.

**Source:** `docs/content/2026/01-08-adam-gross-self-serve-gtm-heavybit-2020.md`
**Tags:** `timing`, `enterprise`

---

### The Enterprise Mirage

Startups fall into the "Enterprise Mirage" when VCs introduce them to big logos who will sign $100K "if you only do X, Y, and Z." They land a few big logos through heroic efforts but fail to build repeatable systems.

Don't underestimate the cost and complexity of building everything you need for Enterprise. The infrastructure cost for real Enterprise readiness is massive. Wait until you have the resources to do it right.

**Source:** `docs/content/2026/01-08-adam-gross-freemium-plg-slg-saastr-2024.md`
**Tags:** `anti-pattern`, `enterprise`

---

## Org Design

### Cross-Functional Squads Per Pillar

Create standing monthly meetings across sales, marketing, and product—one for the free business, one for the self-serve business, one for the enterprise business. This gives clarity by allowing each cross-functional team to have a common set of priorities and backlog items within each vertical.

**Squad Playbook:**
1. Create squad teams around each pillar (Free, Team, Enterprise)
2. Include cross-functional representatives in each squad
3. Sync priorities quarterly while maintaining functional autonomy
4. Implement common reporting frameworks
5. Hold regular stakeholder meetings to maintain alignment

If you just have one product backlog for the company without a lens for each business line, it affects your ability to prioritize.

**Source:** `docs/content/2026/01-08-adam-gross-self-serve-gtm-heavybit-2020.md`, `docs/content/2026/01-08-adam-gross-gtm-saastr-summary.md`
**Tags:** `org-design`, `framework`

---

### Support + Sales Integration for Self-Serve

For self-serve, build integrated support and sales teams. The work account managers do in self-serve is almost always technical and support in nature. Have a support team oriented around talking to both existing customers AND prospective customers, helping them through the buying process.

This is why Forward Deployed Engineers (FDEs) are such a common emerging pattern. FDEs can be the sales force until there's a significant threshold to pass into delineating the sales motion—maybe only once you hit enterprise.

> "There's something really powerful about explicitly defining what value looks like and holding oneself accountable to value before and as the sales pitch process."

**Source:** `docs/content/2026/01-08-adam-gross-self-serve-gtm-heavybit-2020.md`
**Tags:** `org-design`, `self-serve`

---

## Anti-Patterns

### 2.0 Marketers for 3.0 Motion

A super common anti-pattern: developer-facing company looking to build self-serve hires people with "marketing" in their title, but they're classic sales 2.0 people. They start buying ads and doing gated content capture—completely opposite of how 3.0 works.

- **GTM 2.0:** Lead capture, trial, sell
- **GTM 3.0:** Drive product adoption

Are your customers coming from lead gen and gated content capture (2.0)? Or from converting engaged active users to a teams product (3.0)? Entirely different businesses, entirely different motions.

**Source:** `docs/content/2026/01-08-adam-gross-self-serve-gtm-heavybit-2020.md`
**Tags:** `anti-pattern`, `hiring`

---

### Skipping Self-Serve for Enterprise

Companies really want to go to enterprise and skip self-serve. What happens: you end up selling via enterprise channels, which is very expensive. Deals under $40-50K annually should be self-serve deals. If your enterprise sales org is doing $20K transactions, those should be self-serve.

**Source:** `docs/content/2026/01-08-adam-gross-self-serve-gtm-heavybit-2020.md`
**Tags:** `anti-pattern`, `enterprise`

---

## Operational Excellence

### Customer Data Systems = CEO Priority

In the 3.0 world, operational excellence becomes paramount. To do pillar 1 well and connect it all the way to pillar 3, you need to be excellent at your customer data systems.

**Requirements:**
- Rock-solid customer data systems
- Sophisticated sales ops and RevOps
- Advanced operational data warehousing
- Modern customer data platforms

Your customer schema is as important as your product roadmap. This needs to be a CEO-level priority.

**Source:** `docs/content/2026/01-08-adam-gross-freemium-plg-slg-saastr-2024.md`
**Tags:** `ops`, `infrastructure`

---

### Adoption > Conversion

The key measure becomes adoption, not conversion, not closing. Once you have adoption, you convert to the department, and then you convert to ultimately the enterprise.

**Source:** `docs/content/2026/01-08-adam-gross-freemium-plg-slg-saastr-2024.md`
**Tags:** `metrics`, `plg`

---

## Index by Tag

| Tag | Insights |
|-----|----------|
| `plg` | GTM 3.0 Framework, Adoption > Conversion |
| `framework` | GTM 3.0 Framework, Three Value Propositions, Two PMF Cycles, Cross-Functional Squads |
| `value-prop` | Three Value Propositions |
| `pmf` | Two PMF Cycles |
| `timing` | $10M-$30M ARR Band |
| `enterprise` | $10M-$30M ARR Band, Enterprise Mirage, Skipping Self-Serve |
| `anti-pattern` | Enterprise Mirage, 2.0 Marketers, Skipping Self-Serve |
| `org-design` | Cross-Functional Squads, Support + Sales Integration |
| `self-serve` | Support + Sales Integration |
| `hiring` | 2.0 Marketers Anti-Pattern |
| `ops` | Customer Data Systems |
| `infrastructure` | Customer Data Systems |
| `metrics` | Adoption > Conversion |

---

## Last Updated

2026-01-08
