# Author Profiles

This skill manages structured models of thought leaders and authors whose frameworks have been internalized through content ingestion. Author profiles serve two purposes:

1. **Context for ingestion** - Understanding an author's worldview helps extract more value from their content
2. **Mentor agent creation** - Rich profiles enable the creation of external "mentor hologram" agents

## Usage

Load author profiles when:
- Ingesting content from a known author (to contextualize new material)
- Creating or updating an external mentor agent
- Cross-referencing ideas across multiple thinkers
- Evaluating advice that references a particular thinker's framework

---

## Profile Structure

Profiles are stored in `profiles/` subdirectory as YAML files.

```yaml
# profiles/author-name.yaml

name: "Full Name"
slug: "author-name"
created: "YYYY-MM-DD"
last_updated: "YYYY-MM-DD"

# Core identity
bio: |
  Brief professional background and why they're worth studying.

known_for:
  - "Key contribution 1"
  - "Key contribution 2"
  - "Signature framework or concept"

# Worldview
core_thesis: |
  The central belief that underlies their thinking.

beliefs:
  - belief: "Specific belief statement"
    implication: "What this means for decisions"
  - belief: "Another belief"
    implication: "Its practical implication"

blind_spots:
  - "What they tend to overlook"
  - "Where their advice should be tempered"

# Style
communication_style:
  tone: "formal/casual/provocative/etc"
  typical_format: "essays/threads/speeches/etc"
  distinctive_patterns:
    - "Characteristic 1"
    - "Characteristic 2"

# Frameworks
frameworks:
  - name: "Framework Name"
    description: |
      What it is and how it works.
    when_to_use: "Situations where this applies"
    key_questions:
      - "Question 1?"
      - "Question 2?"

# Decision style
decision_approach:
  speed: "fast/deliberate/varies"
  style: "data-driven/intuitive/principle-based"
  notable_decisions:
    - decision: "What they decided"
      reasoning: "Why - illustrates their approach"

# Signature questions
signature_questions:
  - "What would [Author] ask when evaluating this?"
  - "Another characteristic question?"

# Red flags
would_object_to:
  - "Pattern or behavior they'd criticize"
  - "Anti-pattern in their worldview"

# Source material
ingested_content:
  - title: "Book/Article/Interview Title"
    type: "book/article/interview/letter/speech"
    date_ingested: "YYYY-MM-DD"
    key_takeaways:
      - "Main insight 1"
      - "Main insight 2"

# Mentor agent
has_mentor_agent: true/false
mentor_agent_path: "agents/external/author-name.md"
```

---

## Building Profiles Over Time

Profiles compound through ingestion:

1. **First ingestion** - Create basic profile with core thesis and initial frameworks
2. **Additional content** - Add to `ingested_content`, refine beliefs and frameworks
3. **Cross-referencing** - Note connections to other authors
4. **Mentor creation** - When profile is rich enough, generate external agent

The `/ingest` command automatically checks for existing profiles and offers to update or create.

---

## Profile → Mentor Agent

When a profile has sufficient depth (typically 3+ ingested sources):

1. Review the profile for completeness
2. Generate mentor agent from template at `agents/external/mentor-template.md`
3. Populate with profile content
4. Link profile to agent: `mentor_agent_path`

The mentor agent becomes a consultation resource for decisions in their domain of expertise.

---

## Active Profiles

*Profiles are stored in `profiles/` subdirectory*

*None yet - populate through `/ingest` workflow*

---

## Profile Ideas

Authors/thinkers worth profiling based on initial values:

**Business Strategy**
- Jeff Bezos (shareholder letters, interviews)
- Charlie Munger (Poor Charlie's Almanack, talks)
- Hamilton Helmer (7 Powers)

**Product & Design**
- Steve Jobs (interviews, bios)
- Jony Ive (design philosophy)

**Writing & Thinking**
- Paul Graham (essays)
- Derek Sivers (books, blog)

**Operations & Systems**
- Ray Dalio (Principles)
- Andy Grove (High Output Management)

Select based on whose frameworks you find yourself naturally reaching for.
