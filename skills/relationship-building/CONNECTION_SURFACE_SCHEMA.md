# Connection Surface Schema

The sieve for extracting relationship-building signal from any content source.

Every piece of content about a person - LinkedIn profile, posts, meetings, voice memos, tweets, YouTube - passes through this schema looking for information that increases surface area for genuine connection.

---

## Schema Metadata

Each extracted field includes:

```yaml
field_name:
  value: "the actual content"
  confidence: high | medium | low      # How certain are we?
  frequency: number                    # How often mentioned (1 = once, 5+ = recurring theme)
  observed_or_inferred: observed | inferred
  sources:                             # Where did we learn this?
    - source_type: linkedin_profile | linkedin_post | meeting | voice_memo | twitter | etc
      source_id: "artifact_id or url"
      date: "2026-01-08"
  first_learned: "2026-01-08"
  last_confirmed: "2026-01-08"
```

**Confidence Levels:**
- `high` - explicitly stated, multiple sources, or directly observed
- `medium` - mentioned once clearly, or strongly inferred from pattern
- `low` - inferred, ambiguous, or dated information

---

## Public vs Private Sphere

**Public sphere** - scraped from publicly available sources:
- LinkedIn profile/posts
- Twitter/X
- YouTube videos/comments
- Podcast appearances
- Blog posts
- News mentions

**Private sphere** - gathered from direct interactions:
- Meeting notes
- Voice memos
- Email exchanges
- Shared conversations
- Direct observations

Private sphere data is generally higher confidence and more personal.

---

## Content POG Surface
*What topics, ideas, or content would resonate with them?*

### Topics & Interests
| Field | Description |
|-------|-------------|
| `topics_they_write_about` | Themes across their posts/content |
| `topics_they_engage_with` | What they like, comment on, share |
| `topics_they_ask_about` | Open questions they're exploring |
| `contrarian_views` | Opinions that go against conventional wisdom |
| `expertise_areas` | What they know deeply |
| `learning_interests` | What they're trying to learn |

### Intellectual Influences
| Field | Description |
|-------|-------------|
| `thinkers_they_follow` | People they quote, mention admiringly, or cite |
| `books_mentioned` | Books they reference or recommend |
| `podcasts_mentioned` | Shows they listen to |
| `newsletters_mentioned` | Publications they subscribe to |
| `frameworks_they_use` | Mental models they reference |

### Content Preferences
| Field | Description |
|-------|-------------|
| `content_format_preferences` | Long reads? Podcasts? Threads? Videos? |
| `tone_preferences` | Data-driven? Story-based? Provocative? |
| `sharing_style` | How they share content (commentary? quotes? links only?) |

---

## Entertainment & Lifestyle Surface
*What do they enjoy? Potential gift/connection opportunities.*

### Media & Entertainment
| Field | Description |
|-------|-------------|
| `movies_mentioned` | Films they reference or recommend |
| `tv_shows_mentioned` | Shows they watch |
| `music_preferences` | Artists, genres, playlists |
| `games_mentioned` | Video games, board games |
| `sports_followed` | Teams, leagues, athletes they follow |
| `live_events_enjoyed` | Concerts, comedy shows, theater, sports |

### Hobbies & Activities
| Field | Description |
|-------|-------------|
| `hobbies` | Activities outside work |
| `fitness_activities` | How they stay active |
| `outdoor_activities` | Hiking, camping, skiing, etc. |
| `creative_pursuits` | Art, writing, music they make |
| `collections` | Things they collect or appreciate |

### Food & Drink
| Field | Description |
|-------|-------------|
| `food_preferences` | Cuisines, restaurants, cooking style |
| `dietary_info` | Vegetarian, allergies, etc. |
| `drink_preferences` | Coffee, wine, cocktails, etc. |
| `favorite_spots` | Restaurants, cafes, bars they love |

### Aesthetic & Style
| Field | Description |
|-------|-------------|
| `aesthetic_preferences` | Design taste, brands they mention |
| `fashion_style` | How they present themselves |
| `home_style` | Decor, design preferences |

---

## Gift POG Surface
*What physical item would genuinely delight them?*

### Personal Items
| Field | Description |
|-------|-------------|
| `wishlist_items` | Things they've explicitly said they want |
| `recent_purchases_mentioned` | Things they're excited about buying |
| `tools_they_use` | Products they mention loving |
| `brands_they_love` | Companies they're loyal to |

### Family-Adjacent Gifts
| Field | Description |
|-------|-------------|
| `partner_info` | Partner name, interests (for couple gifts) |
| `kids_info` | Ages, names, interests |
| `pet_info` | Pet name, type, breed |
| `family_activities` | What they do together |

---

## Event POG Surface
*Where and when could we connect in person?*

### Location
| Field | Description |
|-------|-------------|
| `location_home` | Where they currently live |
| `location_work` | Where they work (if different) |
| `location_origin` | Where they grew up |
| `neighborhoods_frequent` | Areas they hang out |
| `local_spots` | Specific places they frequent |

### Travel
| Field | Description |
|-------|-------------|
| `travel_patterns` | Where they go regularly |
| `upcoming_travel` | Mentioned future trips |
| `travel_style` | Business? Adventure? Family? |
| `bucket_list_destinations` | Places they want to go |

### Events & Gatherings
| Field | Description |
|-------|-------------|
| `conferences_attended` | Professional events |
| `communities_active_in` | Groups, meetups, clubs |
| `recurring_events` | Annual things they attend |
| `event_preferences` | Big conferences vs intimate dinners? |

---

## Intro POG Surface
*Who from my network should they meet?*

### Network Needs
| Field | Description |
|-------|-------------|
| `people_they_admire` | Who they want to meet |
| `stated_intro_requests` | Explicit asks for introductions |
| `expertise_gaps` | Where they need help or advice |
| `hiring_for` | Roles they're trying to fill |
| `looking_for_investors` | Fundraising status |
| `looking_for_customers` | Sales/BD needs |
| `looking_for_partners` | Strategic partnership needs |

### Existing Network
| Field | Description |
|-------|-------------|
| `mutual_connections` | People we both know |
| `people_they_mention` | Names that come up frequently |
| `alumni_networks` | Schools, companies (= intro vectors) |
| `board_members_advisors` | Their formal network |

---

## Timing POG Surface
*What dates and milestones matter to them?*

### Personal Dates
| Field | Description |
|-------|-------------|
| `birthday` | Birth date (even just month) |
| `anniversary` | Wedding/relationship anniversary |
| `personal_milestones` | Life events with dates |

### Professional Dates
| Field | Description |
|-------|-------------|
| `work_anniversary` | When they started current role/company |
| `company_founded` | If founder, when they started |
| `company_milestones` | Funding rounds, launches, exits |
| `career_milestones` | Promotions, achievements |

### Upcoming
| Field | Description |
|-------|-------------|
| `mentioned_deadlines` | Things coming up they've mentioned |
| `upcoming_launches` | Products, features, announcements |
| `upcoming_life_events` | Weddings, babies, moves |

---

## Signal POG Surface
*What would show I genuinely pay attention and care?*

### Identity & Values
| Field | Description |
|-------|-------------|
| `values` | What they care about deeply |
| `causes` | Non-profit, social, political interests |
| `origin_story` | How they got to where they are |
| `identity_markers` | How they describe themselves |
| `proud_of` | Achievements they mention with pride |

### Communication
| Field | Description |
|-------|-------------|
| `communication_style` | Email? Text? Voice notes? |
| `response_patterns` | Fast responder? Batch processor? |
| `meeting_preferences` | Video? Phone? In-person? |
| `timezone` | For scheduling awareness |

### Quirks & Preferences
| Field | Description |
|-------|-------------|
| `inside_references` | Shared jokes, callbacks, moments |
| `pet_peeves` | Things that annoy them |
| `hot_takes` | Strong opinions on specific things |
| `rituals` | Daily/weekly routines they mention |

---

## Negative Space
*What do they explicitly NOT like or want?*

| Field | Description |
|-------|-------------|
| `topics_to_avoid` | Subjects they don't want to discuss |
| `dislikes_stated` | Things they've said they hate |
| `anti_recommendations` | Products, people, ideas they warn against |
| `past_negative_experiences` | Bad experiences they've shared |
| `communication_dislikes` | How they don't want to be contacted |

---

## Professional Context
*Standard professional background (high-value for context)*

| Field | Description |
|-------|-------------|
| `current_role` | Job title |
| `current_company` | Where they work |
| `company_stage` | Startup? Enterprise? |
| `industry` | Sector they operate in |
| `previous_companies` | Work history |
| `education` | Schools attended |
| `board_roles` | Advisory, board seats |
| `investments` | Angel investments, LP positions |

---

## Synthesis Workflow

When processing any content source:

1. **Extract** - Pull all fields that have signal
2. **Annotate** - Add confidence, frequency, observed/inferred
3. **Source** - Tag with source type, ID, date
4. **Merge** - Combine with existing profile data
5. **Timestamp** - Update first_learned / last_confirmed
6. **Flag Conflicts** - Note if new info contradicts existing

---

## Usage

This schema is used by:
- `skills/linkedin-scraper/` - Extract from profiles and posts
- `skills/relationship-building/` - Manual capture from interactions
- Future: Twitter, YouTube, podcast transcript scrapers

The extracted data populates the contact's baseball card at:
- `docs/relationships/contacts/{category}/{name}.md`

---

*This schema evolves. When you find a new signal type that increases connection surface area, add it.*
