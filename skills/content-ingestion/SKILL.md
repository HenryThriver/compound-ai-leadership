# Content Ingestion Skill

Transform consumed content into compounding knowledge assets.

---

## Purpose

Every piece of content you consume should:
1. Be cataloged with your notes and highlights
2. Route insights to relevant functional areas
3. Route insights to relevant thinker profiles
4. Optionally be marked as POG-worthy for sharing

This skill defines the workflow to make that happen—with explicit approval gates.

---

## Invoke With

```
/ingest-content
```

Or manually: "Help me ingest [content title/link]"

---

## Approval Gates

**CRITICAL:** This workflow requires explicit user approval before writing to:
- Any functional area (`skills/functional/*/INSIGHTS.md`)
- Any thinker profile (`skills/thinkers/*/`)
- The POG index (`docs/pogs/INDEX.md`)

The only file written without approval is the content file itself (`docs/content/`).

---

## Workflow

### Phase 1: Gather Content

**Input:** One of the following:
- Readwise article URL or title
- Manual content (copy-paste highlights)
- Link to original article

**Actions:**
1. If Readwise: Pull highlights using `./utils/readwise/get-highlights.sh "[search]"`
2. Identify author/thinker
3. Identify content type (article, book, podcast, etc.)

**Output:** Raw content with highlights ready for processing

---

### Phase 2: Create Content File

**Actions:**
1. Create file in `docs/content/2026/[date]-[slug].md`
2. Fill in metadata (source, author, type, date)
3. Paste highlights
4. User adds their commentary/takes on each highlight

**Approval Gate:** None (this is the source file)

**Output:** Content file created

---

### Phase 3: Extract Insights

**Actions:**
1. Review highlights and user commentary
2. Identify discrete insights worth capturing
3. For each insight, propose:
   - The insight statement
   - Suggested functional area(s)
   - Suggested thinker attribution
   - Topic tags

**Output:** List of proposed insights with routing suggestions

---

### Phase 4: Route to Functional Areas

**APPROVAL GATE**

For each functional area to receive insights:

1. **Show the user:**
   - Which functional area
   - Whether it exists or needs to be created
   - Exact insights to be added
   - How they'll be formatted

2. **Ask for approval:**
   - "Should I add these [N] insights to `skills/functional/[area]/INSIGHTS.md`?"
   - If new area: "This will create a new functional area. Proceed?"

3. **On approval:**
   - Create area from template if needed
   - Append insights to INSIGHTS.md
   - Update content file to note routing

4. **On rejection:**
   - Ask for modifications or skip

---

### Phase 5: Route to Thinker Profiles

**APPROVAL GATE**

For each thinker to receive content:

1. **Show the user:**
   - Which thinker
   - Whether profile exists or needs to be created
   - Updates to CANON.md (content log)
   - Insights to add to INSIGHTS.md
   - Any PROFILE.md updates suggested

2. **Ask for approval:**
   - "Should I update `skills/thinkers/[name]/` with this content?"
   - If new thinker: "This will create a new thinker profile. Proceed?"

3. **On approval:**
   - Create thinker from template if needed
   - Update CANON.md with content entry
   - Append insights to INSIGHTS.md
   - Optionally update PROFILE.md themes

4. **On rejection:**
   - Ask for modifications or skip

---

### Phase 6: POG Assessment

**APPROVAL GATE**

1. **Assess POG-worthiness:**
   - Is this content worth sharing with others?
   - Who would benefit from it?
   - What's the angle/framing?

2. **Show the user:**
   - Recommended POG status (yes/no)
   - Suggested audience types
   - Proposed angle for sharing

3. **Ask for approval:**
   - "Should I add this to the POG index?"

4. **On approval:**
   - Add entry to `docs/pogs/INDEX.md`
   - Update content file POG notes

---

### Phase 7: Finalize

**Actions:**
1. Update `docs/content/INDEX.md` with new entry
2. Summarize what was created/updated
3. Note any follow-up actions

**Output:** Completed ingestion with full audit trail

---

## Creating New Areas/Thinkers

When content requires a new functional area or thinker profile:

### New Functional Area
1. Copy `skills/functional/_TEMPLATE/` to new folder
2. Rename appropriately (lowercase, hyphenated)
3. Update CLAUDE.md if needed
4. Proceed with adding insights

### New Thinker Profile
1. Copy `skills/thinkers/_TEMPLATE/` to new folder
2. Rename appropriately (lowercase, hyphenated)
3. Fill in PROFILE.md with initial bio
4. Add content to CANON.md
5. Proceed with adding insights

---

## Consistency Checks

During ingestion, verify:

1. **Citation format:** All insights cite back to `docs/content/` files
2. **Tag consistency:** Use existing tags where possible
3. **Thinker naming:** Match existing thinker folder names
4. **Date format:** YYYY-MM-DD everywhere

If inconsistencies are found in existing files, flag them for cleanup.

---

## Example Session

```
User: Help me ingest the NFX Voice AI article

Claude: I'll pull your Readwise highlights for this article.
[Runs get-highlights.sh "voice-ai"]

Found 26 highlights. Let me create the content file.
[Creates docs/content/2026/01-07-nfx-voice-ai.md]

Now I need your commentary on the key highlights.
[Walks through highlights, user adds takes]

Based on your notes, I've identified 8 discrete insights:
1. "Voice as wedge vs voice as product" → voice-ai, gtm
2. "Expansion paths from voice" → voice-ai, product
[etc.]

APPROVAL NEEDED: Route to Functional Areas
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Area: skills/functional/voice-ai/ (NEW - will create)
Insights to add:
- "Voice as wedge vs voice as product" [tags: strategy, positioning]
- "Expansion paths from voice" [tags: growth, platform]

Create this area and add these insights? [y/n]

User: y

[Creates voice-ai functional area, adds insights]

APPROVAL NEEDED: Route to Thinker
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Thinker: skills/thinkers/james-currier/ (NEW - will create)
CANON.md: Add "Voice AI is Working" (read, 2026-01-07)
INSIGHTS.md: Add 4 insights on network effects, wedge strategy

Create this thinker profile? [y/n]

User: y

[Creates james-currier profile, adds content]

APPROVAL NEEDED: POG Assessment
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Recommend: YES - POG-worthy
Audience: Voice AI founders, GTM leaders at AI companies
Angle: "Voice as wedge, not destination"

Add to POG index? [y/n]

User: y

[Updates POG index]

✓ Ingestion complete
- Content file: docs/content/2026/01-07-nfx-voice-ai.md
- New functional area: voice-ai (4 insights)
- New thinker: james-currier (4 insights)
- Added to POG index
```

---

## Troubleshooting

### "I don't have Readwise highlights"
- Use manual input: paste highlights directly
- Or provide article link for fresh reading

### "This content doesn't fit any functional area"
- Create a new one! That's the point of organic growth.
- If truly miscellaneous, use a catch-all tag in the content file

### "Multiple thinkers in one piece of content"
- Route to all relevant thinkers
- Each gets their own approval gate

### "I changed my mind about routing"
- Insights can be removed from functional areas/thinkers later
- The content file remains the source of truth

---

## Lessons Learned

*Updated as we refine the workflow.*

### Full Text Extraction (2026-01-07)

Different approaches for getting full article text:

| Approach | Result | When to Use |
|----------|--------|-------------|
| WebFetch | Fails on long articles ("Prompt too long") | Short articles only |
| Readwise v2 API | Highlights only, not full text | Always use for highlights |
| Readwise v3 API | Has `withHtmlContent` but auth needs debugging | TBD - needs fix |
| Claude in Chrome JS | Content often blocked by security filters | Avoid |
| **Playwright browser snapshot** | **Works** - structured content extraction | **Default for long articles** |

**Recommendation:** Use Playwright browser tools (`mcp__plugin_compound-engineering_pw__browser_navigate` then `browser_snapshot`) to extract full article content.

### Thinker Attribution: Entity vs. Individual (2026-01-07)

When ingesting content, decide whether to attribute to:
- **Individual** (e.g., `paul-graham`) — When the person has a distinct voice/worldview
- **Entity** (e.g., `nfx`) — When content represents a collective thesis (like firm essays)

Check actual authorship, don't assume. NFX essays are signed by partners but represent collective thinking.

### Citations Are Non-Negotiable

Every insight routed to functional areas or thinker profiles **MUST** include:
```
**Source:** `docs/content/[year]/[filename].md`
```

This is not optional. The system's value depends on traceability.

---

## Related Resources

- `docs/content/BIG_IDEA.md` — Philosophy behind this system
- `skills/thinkers/_TEMPLATE/` — Thinker folder structure
- `skills/functional/_TEMPLATE/` — Functional area structure
- `docs/pogs/INDEX.md` — POG library
