# Draft Plan (Execution Blueprint)

**Draft:** 001-episode-01-draft
**Created:** 2024-12-24

## Purpose
This plan translates the rewrite intent from `idea.md` into a clear, actionable structural blueprint for creating the full prose draft of Episode 1 ("The Receptionist"). This is a new content creation task, not a rewrite—no existing prose exists yet.

---

## Element Changes

### No Changes Required
All foundational elements are already established in the repo:
- **Characters:** Doogan, Eddie, Abby, Baxter, Sebastian, Annabelle, Martinez (profiles exist in `elements/characters/`)
- **Setting:** Pacific Point, Southern California (defined in `elements/setting.md`, including cultural details about car culture, transportation, social norms)
- **Tone:** Fast, witty, satirical, darkly funny (defined in `elements/tone.md`)
- **POV:** First-person for all Doogan scenes, Fletch Rule compliance (defined in `elements/pov.md`)
- **Checklist:** All technical constraints documented (`elements/checklist.md`)
- **Outline:** Complete 9-scene structure (`elements/outlines/episode-01.md`)

### Clarifications for Execution
- **Doogan's voice:** Sharp adaptive humor, observational intelligence, effortless charm that adjusts to conversation partner
- **Eddie's voice:** Fast-talking salesman energy, shorthand with Doogan, comfortable bending rules
- **Abby's voice:** Razor-sharp, calls out the absurdity, loves Eddie but thinks the business is ridiculous
- **Baxter's voice:** Earnest, tech-focused, starstruck by Doogan, rapid-fire intel delivery

### CRITICAL CONSTRAINT: NO INVENTED DETAILS
**Do not invent character details, physical descriptions, backstory, or world-building elements that are not explicitly in the `elements/` folder.**
- If a character's car, clothing, physical traits, or habits are not specified in their character file, DO NOT MAKE THEM UP.
- Use only what is canonical in `elements/characters/`, `elements/setting.md`, `elements/notes.md`, and other element files.
- When in doubt, stay vague or ask for clarification rather than inventing.
- Invented details create continuity problems that require cleanup later.

---

## Content Changes

### File Creation
**Primary Output:**
- Episode directory: `content/episodes/episode-01-the-receptionist/`
- Individual scene files (9 total, numbered sequentially):
  - `01-the-dumping.md`
  - `02-valet-sweet-goodbye.md`
  - `03-the-new-client.md`
  - `04-morning-run.md`
  - `05-coffeehouse-meet.md`
  - `06-farmers-market.md`
  - `07-meet-cute-debrief.md`
  - `08-tomato-aisle.md`
  - `09-dinner-at-annabelles.md`
- Compiled output: `output/episode-01-the-receptionist.md` (created via compile prompt after all scenes complete)

**Structure:**
Each scene file contains:
- Scene heading: `## Scene # — Title`
- Scene prose content
- Scene break marker: `---`

Episode target: 4,500–5,500 words total across all scenes

### Writing Process References
**All scene writing must follow these prompts from `.github/prompts/`:**
- **New scenes:** **MUST use `addscene.prompt.md`** (non-negotiable)
  - Follow mandatory pre-writing workflow: load character files FIRST
  - Load ALL character files for characters appearing in scene from `elements/characters/<name>.md`
  - Review Physical Characteristics, Personality, Voice & Style, Relationships
  - Use character traits from element files ONLY—do not invent
  - Apply character detail checklist during writing
  - Apply checklist.md items
  - Maintain continuity with existing scenes
- **Scene edits:** Use `editscene.prompt.md` guidelines
  - Preserve original structure unless task specifies otherwise
  - Load character files for any characters in scene
  - Maintain character voices from element files
  - Apply voice.md, tone.md, style.md rigorously
  - No invented details

### Scene-Level Specifications

#### Scene 1: Prologue — "The Dumping"
- **Purpose:** Introduce Doogan's charm and show what looks like a real, amicable breakup (NO foreshadowing of his job)
- **Length:** 400–600 words
- **Key beats:** Claire's confident/grateful breakup, Doogan supportive and gracious, must read as genuine relationship ending, turn (caught feelings—subtle), button (exit cleanly, no reveals)
- **Tone:** Breezy, slightly melancholic edge
- **Technical:** Open in media res, dialogue-driven, minimal exposition
- **CRITICAL:** No hints about Doogan's work, no "consultant" talk, no burner phones, no shadowy anything. This must play as a real breakup. The reveal that it was engineered comes in Scene 2.

#### Scene 2: Valet — Sweet Goodbye
- **Purpose:** Show exit ritual, Eddie's handler energy, Doogan's ethics, **establish dinner plan that sets up Scene 3**
- **Length:** 500–700 words
- **Key beats:** Walk-and-talk to valet, young couple imploding ("follow her" advice), Cougar arrival, in-car Eddie call (two job pitches rejected), Eddie mentions third job—rich guy, office situation, usual thing—wants to discuss in person (not seeking Abby's input—she'll give it anyway, whether they want it or not), Eddie bribes Doogan with Thai takeout invitation, Doogan accepts and heads to their place
- **Tone:** Light, comedic beat with couple, transitions to business, ends with anticipation
- **Technical:** Action beats for movement, earpiece tech introduction, **must NOT reveal Sebastian/Annabelle details—those are for Scene 3**

#### Scene 3: Eddie & Abby's Kitchen — The New Client Briefing
- **Purpose:** First in-person introduction to Eddie and Abby, establish trio dynamic, reveal Sebastian job details
- **Length:** 500–700 words
- **Key beats:** Doogan arrives at Eddie and Abby's home, kitchen setting over Thai food, **first time audience meets Eddie and Abby in person**, Eddie briefs Sebastian LeClere case (receptionist situation, wants clean break), Doogan asks questions, Eddie provides Annabelle Anders details, Doogan skeptical, Abby teases them about business ethics, **Abby observes they always meet sketchy clients at obscure places like Duke's Coffee**, Eddie confirms meeting details (tomorrow, Duke's Coffee, 10 AM, business casual), Cougar joke, Doogan reluctantly agrees
- **Tone:** Domestic, lived-in banter, moral friction, comedic
- **Technical:** Three-way dialogue rhythm, team shorthand, Abby's observations must land sharp, **this scene REVEALS job details withheld in Scene 2**

#### Scene 4: Morning Run — Baxter in the Ear
- **Purpose:** Introduce Baxter, deliver "first job" backstory (using details from `elements/events/the-first-job.md`), locate Annabelle
- **Length:** 800–1,000 words (longest scene for backstory delivery)
- **Key beats:** Running with earpiece, Baxter's research update, "How did you do this before the internet?", first job story **using canonical details from `elements/events/the-first-job.md`** (VP with secret engagement, hooking up with sister sorority girl, wealthy family job promise, Eddie's pitch, Doogan reluctant but broke, clean breakup execution, girl grateful, Eddie wants to make it regular, Doogan says no but they do it anyway), Baxter fascinated, Snapchat/Instagram intel, farmer's market location, white poodle detail
- **Tone:** Sorkin-style walk-and-talk energy, fond memory with edge, class tension (broke kids outsmarting rich guy's problem)
- **Technical:** Maintain running action throughout dialogue, Baxter's rapid-fire delivery, Doogan's story paced naturally, **MUST match event file details exactly**

#### Scene 5: Coffeehouse Meet — "Sebastian LeClere"
- **Purpose:** Introduce villain persona, Doogan's first "off" moment
- **Length:** 400–600 words
- **Key beats:** Doogan arrives in running gear, Eddie comments, running gear as cover for meet-cute, Sebastian too polished/rehearsed, doesn't know basic receptionist details, not married/office mess excuse, Doogan exits ("late for meet-cute"), bacon steal from plate
- **Tone:** Subtly wrong without being obvious, Doogan's instincts firing
- **Technical:** Sebastian's dialogue must feel rehearsed without being cartoonish

#### Scene 6: Farmer's Market — Doogan Charms Annabelle
- **Purpose:** Show Doogan in his element, establish chemistry
- **Length:** 500–700 words
- **Key beats:** Dog obsessed with Doogan (bacon pocket), Annabelle embarrassed, banter lands fast, Doogan leaves first (on purpose), Baxter confused in ear
- **Tone:** Playful, not predatory; accidentally charming
- **Technical:** Chemistry through dialogue rhythm, Doogan's social intelligence on display

#### Scene 7: The Meet Cute Debrief — Looking for Background
- **Purpose:** Articulate mismatch, show team research methods
- **Length:** 400–600 words
- **Key beats:** Doogan post-market to Eddie, explains encounter, Eddie dismisses, Abby sides with Doogan, Baxter on FaceTime tablet, social media check (no recent breakup), Eddie pushes Baxter to bend rules, transaction patterns, Abby's "bunch of stalkers" line
- **Tone:** Team friction, comedic tension, Abby as conscience
- **Technical:** Four-way scene (Eddie/Doogan/Abby in room + Baxter on tablet)

#### Scene 8: Coincidence #2 — The Tomato Aisle
- **Purpose:** Build chemistry and tension, engineering the invitation
- **Length:** 600–800 words
- **Key beats:** Doogan pretending with tomatoes, Annabelle surprised, cart check (trendy premade meals), restaurant questions → shrimp risotto guess, Baxter: "no way she invites you", grocery store has ingredients, buys them anyway, walk-out chat, condo across street reveal, minimal utensils/takes minutes, she invites him, Baxter: "WHAT?"
- **Tone:** Flirty escalation, slightly unnatural for her (override instinct)
- **Technical:** Annabelle's hesitation must show (weird he's there again) but curiosity wins

#### Scene 9: Dinner at Annabelle's
- **Purpose:** Pay off charm run with hard tonal snap
- **Length:** 400–600 words
- **Key beats:** Quick tidy ("camera ready" apartment), Doogan cooks, wine from client (Woodmark Vineyards, Napa—Doogan doesn't recognize), toast/banter/heat, Annabelle makes first move, BLACKOUT, foggy wake-up, badge tap, detective gesture, Annabelle dead in bed, "Hands where I can see them." CUT.
- **Tone:** Light → intimate → HARD CUT to horror
- **Technical:** Blackout transition must be abrupt, disorienting; no fade, no transition prose

---

## Directory Changes

### New Directory Creation
- `content/episodes/` (if doesn't exist)

### File Naming Convention
- Episode files: `episode-##-title-slug.md`
- Format: `episode-01-the-receptionist.md`

---

## Sequence of Work

### Phase 1: Setup (Task 001)
- Create `content/episodes/` directory
- Create file: `content/episodes/episode-01-the-receptionist.md`
- Add episode metadata header (title, episode number, word count placeholder, status)

### Phase 2: Scene Drafting (Tasks 002–010)
Draft scenes in sequence, one task per scene:
- **Task 002:** Scene 1 — Prologue
- **Task 003:** Scene 2 — Valet
- **Task 004:** Scene 3 — Eddie's Briefing
- **Task 005:** Scene 4 — Morning Run / Baxter
- **Task 006:** Scene 5 — Coffeehouse Meet
- **Task 007:** Scene 6 — Farmer's Market
- **Task 008:** Scene 7 — Debrief
- **Task 009:** Scene 8 — Tomato Aisle
- **Task 010:** Scene 9 — Dinner / Cliffhanger

### Phase 3: Integration & Polish (Task 011)
- Review full episode for:
  - Dialogue rhythm and tag/beat distribution
  - POV compliance (Fletch Rule)
  - Tone consistency and nimble shifts
  - Word count target (4,500–5,500)
  - Serial beat delivery (hook, escalation, cliffhanger)
- Add scene breaks/dividers per format.md conventions
- Update metadata (final word count, status: "draft-complete")

---

## Dependencies

### Sequential Dependencies
- Tasks 002–010 must execute in order (scenes build sequentially)
- Task 011 requires completion of all scene drafts

### Information Dependencies
- Scene 4 (Baxter) references Scene 5 (coffeehouse) timing
- Scene 6 (market meet-cute) setup requires Scene 4 intel
- Scene 7 (debrief) reacts to Scene 6 events
- Scene 8 (tomato aisle) is second encounter building on Scene 6
- Scene 9 (dinner) pays off Scenes 6 and 8

### Technical Dependencies
- All scenes must maintain first-person POV narrated by Doogan
- Dialogue-driven constraint: 80–90% dialogue per scene
- Tag/beat insertion: max 3 untagged lines (2-person), max 5 (multi-character)

---

## Serial Episode Beats

### Hook (Cold Open)
**Scene 1: Prologue**
- Pull: A breakup that feels weirdly successful
- Promise: Doogan's job is unusual and morally ambiguous
- Tonal signature: Witty, breezy, with melancholic edge

### Escalation / Turn
**Scenes 2–8: Building tension**
- Scene 2: Eddie pulls Doogan back in (he can't escape)
- Scene 3: New client feels wrong
- Scene 4: Backstory reveals how they got here
- Scene 5: Sebastian doesn't add up (Doogan's instincts fire)
- Scene 6: Annabelle is sharp and charming (complication: he likes her)
- Scene 7: Team research confirms something's off
- Scene 8: Chemistry escalates; Doogan engineers the invitation

**Turn:** Doogan proceeds despite instincts, charm overrides caution

### End-Button / Cliffhanger
**Scene 9: Dinner → Corpse**
- Payoff: Chemistry lands, intimacy happens
- SNAP: Blackout → wake-up → badge → body
- Hook forward: Doogan is now the prime suspect
- Final line: "Hands where I can see them." [CUT]

---

## Technical Formatting Requirements

### Dialogue & Tags
- New speaker = new paragraph
- Prefer action beats over tags for clarity
- Use neutral tags ("said") when beats would distract
- Insert tag/beat after max 3 consecutive untagged lines (2-person dialogue)
- Insert tag/beat after max 5 consecutive untagged lines (multi-character scenes)

### POV & Information Flow
- First-person narration by Doogan
- Reader learns when Doogan learns (Fletch Rule)
- No villain POV, no omniscient narration
- Off-screen events delivered through: Eddie/Baxter briefings, dialogue recounting, documents, messages

### Scene Openings
- Open in media res (action or dialogue first)
- Minimal setup exposition
- Let reader infer context from exchange

### Prose Economy
- Active verbs, minimal adjectives/adverbs
- Description only when plot-essential
- Avoid explanatory narration
- Trust reader to follow

### Tonal Shifts
- Light → dark → light shifts must feel nimble
- Use humor to handle dark material
- Gallows humor and irony for heavy beats
- Never linger in darkness; bounce back quickly

---

## Risk Mitigation

### Risk: Sebastian too obviously villainous
**Mitigation:** Keep his "off" quality subtle—he's too polished, doesn't know details, but could plausibly be a nervous CEO. Doogan's discomfort is instinctual, not factual.

### Risk: Doogan/Annabelle chemistry feels predatory
**Mitigation:** Doogan must be accidentally charming, not smooth operator. He leaves first (Scene 6), lets her curiosity do work. Playful, not calculated. Scene 8 hesitation from her must show.

### Risk: "First job" story feels expository
**Mitigation:** Deliver through natural Baxter question ("How did you do this before internet?"), Doogan tells while running (action throughout), keep tone light/fond with edge, Baxter's reactions keep it dynamic.

### Risk: Blackout transition feels cheap
**Mitigation:** No fade, no "his vision blurred" prose. Hard cut. One paragraph intimate moment, immediate next paragraph is foggy wake-up. Disorienting by design.

### Risk: Dialogue tags disrupt rhythm
**Mitigation:** Read each scene aloud during drafting. If tags/beats feel intrusive, remove. If speaker is unclear, add minimal action beat. Prefer rhythmic clarity over rule compliance.

### Risk: Word count bloat or compression
**Mitigation:** Track running word count per scene. If trending over 5,500, tighten Scene 4 (longest) or compress Scene 7 (team debrief can be snappier). If under 4,500, expand Scenes 6 and 8 (chemistry beats have room).

---

## Open Questions

None at this stage. All necessary information exists in:
- `elements/outlines/episode-01.md` (scene breakdown)
- `elements/checklist.md` (technical constraints)
- `elements/pov.md` (POV rules)
- `elements/tone.md` (tonal guidelines)
- `voice/format.md` (serial fiction structure)
- `voice/style.md` (Gregory McDonald style)
- Character files in `elements/characters/`

If ambiguity emerges during scene drafting, log in `clarify.md`.

---

## Assumptions

1. **Content directory structure:** Episodes live in `content/episodes/episode-##-title-slug/` with individual scene files numbered sequentially
2. **Scene file format:** Each scene is a separate markdown file (e.g., `01-the-dumping.md`, `02-valet-sweet-goodbye.md`) for easier editing
3. **Compilation:** When episode is complete, scene files are compiled into single file in `output/episode-##-title-slug.md` using compile prompt
4. **Scene file content:** Each contains scene heading (`## Scene # — Title`), prose content, and scene break marker (`---`)
5. **Character voices extrapolatable:** Existing outline dialogue snippets and character profiles provide sufficient voice samples for full scene expansion
6. **Woodmark Vineyards wine:** Planted clue for later episodes; Doogan's non-recognition is intentional (he's not a wine snob, but it'll matter later)
7. **Detective Martinez introduction:** Badge and one line only; full character introduction comes in Episode 2
8. **Baxter's tech methods:** Posing as cosmetic rep, Snapchat adds, Instagram location tracking—all ethically gray but within team's operational boundaries
9. **Target word count achievable:** 9 scenes at specified lengths (400–1,000 words each) totals ~5,000 words, within target range
10. **Annabelle's apartment "camera ready":** Detail suggests she curates her space for social media, consistent with influencer-adjacent lifestyle established in outline
