# Draft Tasks — Actionable Work Items

**Draft:** 001-episode-01-draft  
**Created:** 2024-12-24  
**Status:** Ready for execution

---

## Writing Process Requirements

**All tasks must follow the prompts in `.github/prompts/`:**
- **New scene creation: MUST use `.github/prompts/addscene.prompt.md`**
  - Follow mandatory pre-writing workflow
  - Load character files BEFORE writing any prose
  - Review ALL character details from `elements/characters/<name>.md`
  - Use character detail checklist during writing
  - No invented details—use only canonical information
- **Scene editing: Follow `.github/prompts/editscene.prompt.md`**
- **Task execution: Follow `.github/prompts/implement.prompt.md`**

**CRITICAL: NO INVENTED DETAILS**
- Use ONLY canonical information from `elements/` folder
- Do not invent character physical traits, cars, clothing, habits, or backstory
- Do not invent setting details not in `elements/setting.md`
- When information is missing from element files, stay vague or generic
- Reference character files in `elements/characters/` for all character details

---

## Task List

### Scene Setup and Structure

- [X] **T001: Setup Episode Directory Structure** — Create episode directory structure
  - **Files/Directories Affected:** `content/episodes/episode-01-the-receptionist/` (directory)
  - **Action:** Create episode directory for individual scene files
  - **Acceptance Criteria:**
    - Directory `content/episodes/episode-01-the-receptionist/` exists and is ready for scene files
  - **Dependencies:** None

### Scene Implementation

- [X] **T002: Draft Scene 1 — Prologue (The Dumping)** — Write Scene 1 — Prologue (Restaurant Breakup)
  - **Files/Directories Affected:** `content/episodes/episode-01-the-receptionist/01-the-dumping.md`
  - **Action:** Draft new scene file (400–600 words)
  - **Acceptance Criteria:**
    - File created: `01-the-dumping.md` in episode directory
    - Scene heading: `## Scene 1 — The Dumping`
    - Scene opens in media res at restaurant
    - Claire's confident/grateful breakup dialogue present
    - Doogan supportive, gracious, charming—reads as genuine boyfriend
    - NO hints about Doogan's work (no "consultant," no burner phones, no government contractor talk, no shadowy references)
    - NO foreshadowing—this must look like a real breakup
    - Turn beat: Doogan caught feelings (extremely subtle, internal only)
    - Button: clean exit, no reveals, no winks to audience
    - Scene break marker: `---` at end of file
    - POV: First-person (Doogan), Dialogue-driven (80–90% dialogue)
    - Tags/beats: max 3 untagged lines (2-person dialogue)
    - Tone: Breezy with slight melancholic edge
    - Word count: 400–600 words
    - CRITICAL: Scene 2 will reveal this was engineered—Scene 1 cannot hint at it
  - **Dependencies:** T001

- [X] **T003: Draft Scene 2 — Valet (Sweet Goodbye)** — Write Scene 2 — Valet Walk and Eddie Call
  - **Files/Directories Affected:** `content/episodes/episode-01-the-receptionist/02-valet-sweet-goodbye.md`
  - **Action:** Draft new scene file (500–700 words)
  - **Acceptance Criteria:**
    - File created: `02-valet-sweet-goodbye.md` in episode directory
    - Scene heading: `## Scene 2 — Valet (Sweet Goodbye)`
    - Walk-and-talk from restaurant to valet
    - Claire exits via silver BMW sedan (establishes her professional status)
    - Young couple imploding scene (Doogan's "follow her" advice)
    - Cougar arrival (car introduction)
    - In-car Eddie phone call begins
    - Eddie pitches two jobs, Doogan rejects both
    - Eddie mentions third job (vague, no details—reserved for Scene 3)
    - Eddie bribes Doogan with Thai takeout invitation
    - Doogan accepts and heads to their place
    - **CRITICAL:** Scene must NOT reveal Sebastian LeClere, Annabelle Anders, or Duke's Coffee meeting details—those are reserved for Scene 3
    - Action beats anchor movement throughout
    - Earpiece tech introduction (setup for later scenes)
    - Scene break marker: `---` at end of file
    - POV: First-person (Doogan) maintained throughout
    - Dialogue-driven with action beats for pacing
    - Tone: Light, comedic beat with couple, transitions to business tone
    - Word count: 500–700 words
  - **Dependencies:** T002

- [X] **T003a: Polish Scenes 1-2 (Feedback Implementation)** — Apply feedback from Feedback Session 1
  - **Files/Directories Affected:** 
    - `content/episodes/episode-01-the-receptionist/01-the-dumping.md`
    - `content/episodes/episode-01-the-receptionist/02-valet-sweet-goodbye.md`
    - `elements/characters/doogan-andrews.md`
  - **Action:** Implement critical and minor feedback fixes using `rewrite.prompt.md`
  - **Acceptance Criteria:**
    - ✅ Scene 1: Removed on-the-nose tiramisu metaphor
    - ✅ Scene 1: Tightened final interior beat for punchier rhythm
    - ✅ Scene 2: Fixed POV slip ("both of them" → first-person)
    - ✅ Scene 2: Removed scene spoiling (Eddie's job details kept vague)
    - ✅ Scene 2: Trimmed earpiece exposition for better flow
    - ✅ Scene 2: Claire's car detail (initially made generic, then CORRECTED to restore "silver BMW sedan" - Claire's car, not Doogan's)
    - ✅ Character file: Confirmed Doogan drives 1970 Mercury Cougar convertible (not BMW)
    - ✅ Updated `analyze.md` with rewrite documentation
    - ✅ Scenes 1-2 now publication-ready
    - ✅ Scene 1 quality: A- → A
    - ✅ Scene 2 quality: B+ → A-
  - **Dependencies:** T003
  - **Status:** Completed 2024-12-24

- [X] **T004: Draft Scene 3 — Eddie & Abby's Kitchen (The New Client Briefing)** — Write Scene 3 — Kitchen Scene with Job Briefing
  - **Files/Directories Affected:** `content/episodes/episode-01-the-receptionist/03-the-new-client.md`
  - **Action:** Draft new scene content (500–700 words) using `addscene.prompt.md`
  - **Pre-Writing Requirements:**
    - Load character files: `elements/characters/doogan-andrews.md`, `elements/characters/eddie-palmer.md`, `elements/characters/abby-palmer.md`
    - Review each character's Voice & Style, Personality Traits, Relationships sections
    - Verify dialogue patterns and relationship dynamics before writing
  - **Acceptance Criteria:**
    - File created: `03-the-new-client.md` in episode directory
    - Scene heading: `## Scene 3 — The New Client (Eddie's Briefing)` or `## Scene 3 — Eddie & Abby's Kitchen`
    - Scene break marker: `---` at end of file
    - Doogan arrives at Eddie and Abby's home
    - Kitchen setting over Thai food
    - **First in-person introduction of Eddie and Abby to audience**
    - Eddie briefs Sebastian LeClere case details (wealthy client, receptionist situation)
    - Doogan asks questions; Eddie provides Annabelle Anders details (late twenties, pretty, smart, Sebastian says she's pulling away)
    - Doogan expresses skepticism about client and job
    - Abby teases both of them about business ethics
    - **Abby's key observation: they always meet sketchy clients at obscure places like Duke's Coffee**
    - Eddie confirms meeting details: tomorrow, Duke's Coffee, 10 AM, business casual
    - Cougar comment or callback included
    - Doogan reluctantly agrees to at least meet Sebastian
    - Three-way dialogue rhythm (Eddie/Doogan/Abby)
    - Team shorthand and lived-in banter establish dynamics
    - Abby's observations must land sharp and comedic
    - **This scene REVEALS the job details that were withheld in Scene 2**
    - **Character voices match element files:** Eddie's motor-mouth sales energy, Abby's sarcastic-loving teasing, Doogan's measured drawl
    - POV: First-person (Doogan)
    - Domestic, intimate setting contrasts with sleazy work
    - Rapid-fire banter, dialogue-driven
    - Word count: 500–700 words
  - **Dependencies:** T003
  - **Status:** Completed 2024-12-24

- [X] **T005: Draft Scene 4 — Morning Run (Baxter in the Ear)** — Write Scene 4 — Running Scene with Baxter Backstory
  - **Files/Directories Affected:** `content/episodes/episode-01-the-receptionist/04-morning-run.md`
  - **Action:** Draft new scene content (800–1,000 words, longest scene) using `addscene.prompt.md`
  - **Pre-Writing Requirements:**
    - Load character files: `elements/characters/doogan-andrews.md`, `elements/characters/rodney-baxter.md`
    - **Load event file: `elements/events/the-first-job.md`** (REQUIRED for backstory details)
    - Review Doogan's voice patterns and backstory sections
    - Review Baxter's personality traits and voice & style
    - Note earpiece detail from Doogan's character file
  - **Acceptance Criteria:**
    - File created: `04-morning-run.md` in episode directory
    - Scene heading: `## Scene 4 — Morning Run (Baxter in the Ear)`
    - Scene break marker: `---` at end of file
    - Doogan running with earpiece; Baxter delivering intel
    - Baxter's research update on Annabelle (location: farmer's market)
    - "How did you do this before the internet?" line included
    - **First job backstory delivered using canonical details from `elements/events/the-first-job.md`:** VP with secret engagement to wealthy family friend's daughter (job promise), hooking up with sister sorority girl all semester, panicking about clean exit, Eddie spots opportunity and pitches Doogan, both broke (rent due, Cougar needs transmission), Doogan charms girl to forget VP, girl grateful and wishes VP well in marriage, Eddie wants to make it regular, Doogan says no, they do it anyway post-graduation
    - Baxter fascinated by the story
    - Snapchat/Instagram intel methods mentioned
    - White poodle detail (setup for Scene 6)
    - Running action maintained throughout dialogue
    - **Baxter's voice:** earnest, tech-focused, starstruck, rapid-fire intel delivery (per character file)
    - **Doogan's voice:** measured drawl, self-deprecating humor, fond but edged memory, class tension awareness (per character file and event file)
    - POV: First-person (Doogan)
    - Sorkin-style walk-and-talk energy
    - Word count: 800–1,000 words
    - **CRITICAL:** Story details match `elements/events/the-first-job.md` exactly
  - **Dependencies:** T004
  - **Status:** Completed 2024-12-24 (rewritten to match event file)

- [X] **T006: Draft Scene 5 — Coffeehouse Meet (Sebastian LeClere)** — Write Scene 5 — Duke's Coffee Meeting with Sebastian
  - **Files/Directories Affected:** `content/episodes/episode-01-the-receptionist/05-coffeehouse-meet.md`
  - **Action:** Draft new scene content (400–600 words) using `addscene.prompt.md`
  - **Pre-Writing Requirements:**
    - Load character files: `elements/characters/doogan-andrews.md`, `elements/characters/villain.md` (Sebastian)
    - Review Doogan's observational intelligence and reading-people skills
    - Review Sebastian's deceptive/polished characteristics
  - **Acceptance Criteria:**
    - File created: `05-coffeehouse-meet.md` in episode directory
    - Scene heading: `## Scene 5 — Coffeehouse Meet`
    - Scene break marker: `---` at end of file
    - Doogan arrives in running gear (Eddie comments)
    - Running gear justified as cover for farmer's market meet-cute
    - Sebastian too polished/rehearsed in manner
    - Sebastian doesn't know basic receptionist job details
    - Not married excuse + office mess excuse delivered
    - Doogan's instincts fire (subtle "off" feeling)
    - Doogan exits with "late for meet-cute" line
    - Bacon steal from plate (callback to Scene 6 setup)
    - **Sebastian's dialogue:** feels rehearsed but not cartoonish (per character file deception traits)
    - **Doogan's perceptions:** emotionally perceptive, reads tells (per character file)
    - POV: First-person (Doogan's perceptions)
    - Tone: Subtly wrong without being obvious
    - Word count: 400–600 words
  - **Dependencies:** T005
  - **Status:** Completed 2024-12-24

- [X] **T007: Draft Scene 6 — Farmer's Market (Doogan Charms Annabelle)** — Write Scene 6 — First Meet-Cute at Farmer's Market
  - **Files/Directories Affected:** `content/episodes/episode-01-the-receptionist/06-farmers-market.md`
  - **Action:** Draft new scene content (500–700 words) using `addscene.prompt.md`
  - **Pre-Writing Requirements:**
    - Load character files: `elements/characters/doogan-andrews.md`, `elements/characters/villain.md` (for Annabelle details)
    - Review Doogan's charm style: "playful, not predatory; accidentally effective"
    - Review social intelligence and reading-people traits
  - **Acceptance Criteria:**
    - File created: `06-farmers-market.md` in episode directory
    - Scene heading: `## Scene 6 — Farmer's Market`
    - Scene break marker: `---` at end of file
    - White poodle obsessed with Doogan (bacon in pocket callback)
    - Annabelle embarrassed by dog behavior
    - Fast banter establishes chemistry
    - Doogan leaves first (intentional social intelligence move)
    - Baxter confused in earpiece ("why'd you leave?")
    - Chemistry shown through dialogue rhythm, not description
    - **Doogan's charm:** playful, not predatory; accidentally effective (per character file)
    - **Doogan's voice:** Southern lilt when being sincere, devastating smile weaponized (per character file)
    - POV: First-person (Doogan)
    - Tone: Playful, light, charming
    - Word count: 500–700 words
  - **Dependencies:** T006
  - **Status:** Completed 2024-12-24

- [X] **T008: Draft Scene 7 — The Meet Cute Debrief (Looking for Background)** — Write Scene 7 — Team Debrief and Research
  - **Files/Directories Affected:** `content/episodes/episode-01-the-receptionist/07-meet-cute-debrief.md`
  - **Action:** Draft new scene content (400–600 words) using `addscene.prompt.md`
  - **Pre-Writing Requirements:**
    - Load character files: `elements/characters/doogan-andrews.md`, `elements/characters/eddie-palmer.md`, `elements/characters/abby-palmer.md`, `elements/characters/rodney-baxter.md`
    - Review four-way team dynamics and relationship patterns
    - Note Abby's role as moral anchor who sides with Doogan's instincts
  - **Acceptance Criteria:**
    - File created: `07-meet-cute-debrief.md` in episode directory
    - Scene heading: `## Scene 7 — The Meet Cute Debrief`
    - Scene break marker: `---` at end of file
    - Doogan reports market encounter to Eddie
    - Eddie dismisses concerns about the job
    - Abby sides with Doogan (ethics/instinct alignment)
    - Baxter on FaceTime tablet (four-way scene dynamics)
    - Social media check: no recent breakup visible
    - Eddie pushes Baxter to bend rules (transaction patterns research)
    - Abby's "bunch of stalkers" line delivered
    - **Four-way dialogue:** Eddie/Doogan/Abby in room + Baxter on screen
    - **Team dynamics:** Eddie optimistic/dismissive, Abby conscience, Doogan instinctual, Baxter technical (per character files)
    - Team friction and comedic tension present
    - POV: First-person (Doogan)
    - Word count: 400–600 words
  - **Dependencies:** T007

- [X] **T009: Draft Scene 8 — Coincidence #2 (The Tomato Aisle)** — Write Scene 8 — Grocery Store Second Encounter
  - **Files/Directories Affected:** `content/episodes/episode-01-the-receptionist/08-tomato-aisle.md`
  - **Action:** Draft new scene content (600–800 words) using `addscene.prompt.md`
  - **Status:** Completed 2024-12-24
  - **Pre-Writing Requirements:**
    - Load character files: `elements/characters/doogan-andrews.md`, `elements/characters/villain.md` (for Annabelle)
    - Review Doogan's reading-people skills and charm deployment
    - Note Eddie's role via earpiece at scene opening
  - **Acceptance Criteria:**
    - File created: `08-tomato-aisle.md` in episode directory
    - Scene heading: `## Scene 8 — Tomato Aisle`
    - Scene break marker: `---` at end of file
    - **NEW OPENING:** Eddie in Doogan's earpiece at scene start, relaying that Sebastian wants a status update; Doogan responds that he's meeting up with her tonight but has to go as he spots Annabelle entering the store for her usual Monday night dinner grocery trip
    - Setting: Monday evening, Gelsons grocery store (per Scene 7 intel)
    - Doogan pretending to shop (tomatoes), Annabelle surprised to see him again
    - Cart check: trendy premade meals visible
    - Restaurant questions lead to shrimp risotto guess by Doogan
    - Baxter in ear: "no way she invites you"
    - Grocery store has ingredients; Doogan buys them anyway
    - Walk-out conversation
    - Condo across street reveal (convenience)
    - Minimal utensils joke / "takes minutes" line
    - Annabelle invites him to cook for her
    - Baxter reaction: "WHAT?"
    - Annabelle's hesitation visible (weird he's there again) but curiosity/attraction wins
    - **Doogan's charm:** naturally effective, reads her perfectly (per character file traits)
    - Flirty escalation tone, slightly unnatural override for her
    - POV: First-person (Doogan)
    - Word count: 600–800 words
  - **Dependencies:** T008

- [X] **T010: Draft Scene 9 — Dinner at Annabelle's (Blackout Cliffhanger)** — Write Scene 9 — Dinner, Intimacy, and Cliffhanger
  - **Files/Directories Affected:** `content/episodes/episode-01-the-receptionist/09-dinner-at-annabelles.md`
  - **Action:** Draft new scene content (400–600 words) using `addscene.prompt.md`
  - **Pre-Writing Requirements:**
    - Load character files: `elements/characters/doogan-andrews.md`, `elements/characters/paul-martinez.md` (detective), `elements/characters/villain.md` (Annabelle)
    - Review Doogan's genuine-despite-con trait: catches feelings during jobs
    - Review Martinez's professional demeanor for wake-up scene
  - **Acceptance Criteria:**
    - File created: `09-dinner-at-annabelles.md` in episode directory
    - Scene heading: `## Scene 9 — Dinner at Annabelle's`
    - Scene break marker: `---` at end of file
    - Quick tidy of apartment ("camera ready" detail)
    - Doogan cooks shrimp risotto
    - Wine from client: Woodmark Vineyards, Napa (Doogan doesn't recognize brand)
    - Toast/banter/heat between them
    - Annabelle makes first move (kiss/intimacy)
    - **BLACKOUT transition** (abrupt, disorienting—no fade prose)
    - Foggy wake-up: Doogan disoriented
    - Badge tap sound (police/detective)
    - Detective gesture/presence
    - Annabelle dead in bed (revealed)
    - Line: "Hands where I can see them."
    - Hard CUT. End episode.
    - **Doogan's genuine connection:** he caught feelings despite job (per character trait)
    - Tone: Light → intimate → HARD SNAP to horror
    - Blackout must be abrupt and jarring (no transition prose)
    - Cliffhanger: Doogan now prime suspect
    - POV: First-person (Doogan)
    - Word count: 400–600 words
  - **Dependencies:** T009

### Integration and QA

- [X] **T011: Episode Integration, Polish, and Metadata Update** — Review, polish, and finalize episode
  - **Files/Directories Affected:** `content/episodes/episode-01-the-receptionist.md`
  - **Action:** Review and refine full episode draft
  - **Acceptance Criteria:**
    - **Dialogue rhythm check:** Verify 80–90% dialogue per scene
    - **Tags/beats distribution:** Max 3 untagged lines (2-person), max 5 (multi-character)
    - **POV compliance:** All scenes third-person personal viewpoint (Fletch Rule)
    - **Tone consistency:** Fast, witty, satirical; nimble shifts from light to dark executed cleanly
    - **Word count target:** Episode total 4,500–5,500 words
    - **Serial beat delivery:** Hook (Scene 1), escalation (Scenes 2–8), cliffhanger (Scene 9)
    - **Scene breaks/dividers:** Add per `voice/format.md` conventions
    - **Metadata update:** Final word count, status changed to "draft-complete"
    - **Character voice consistency:** Doogan, Eddie, Abby, Baxter voices match profiles
    - **Continuity check:** No contradictions with `elements/**` files
  - **Dependencies:** T002, T003, T004, T005, T006, T007, T008, T009, T010
  - **Status:** Completed 2024-12-24

- [X] **T012: QA Pass — Checklist and Continuity Verification** — Final QA pass for checklist compliance and continuity
  - **Files/Directories Affected:** `content/episodes/episode-01-the-receptionist.md`, `elements/checklist.md` (reference), `elements/pov.md` (reference), `elements/tone.md` (reference), `elements/characters/*.md` (reference)
  - **Action:** Verify compliance and log any issues in `feedback.md`
  - **Acceptance Criteria:**
    - **POV Rule:** third-person narration by Doogan; no omniscient narration
    - **Fletch Rule:** Reader learns when Doogan learns (no villain POV, no off-screen dramatization)
    - **Dialogue-Driven:** 80–90% dialogue confirmed per scene
    - **Tags/Beats:** No violations of 3-line (2-person) or 5-line (multi-character) untagged limits
    - **New Speaker Rule:** Each speaker gets new paragraph
    - **Tag Tone:** Neutral tags preferred; vivid verbs in action beats only
    - **Secrecy Rule:** Target never learns they were hired (n/a for this episode but verified)
    - **Tone Consistency:** Fast, witty, satirical with nimble mood shifts
    - **Character Consistency:** All character voices match canonical profiles
    - **Continuity Check:** No contradictions with existing `elements/**` or `content/**`
    - **Length:** Episode within 4,500–5,500 word target
    - **Serial Structure:** Hook → escalation → cliffhanger present and functional
    - Document any issues or needed revisions in `drafts/001-episode-01-draft/feedback.md`
  - **Dependencies:** T011
  - **Status:** Completed 2024-12-24
  - **QA Result:** 11 POV violations identified and FIXED; 1 typo found and FIXED; all criteria now met
  - **Overall Quality:** A (publication-ready)
- **Action:** Draft new scene content (800–1,000 words, longest scene)
- **Acceptance Criteria:**
  - Doogan running with earpiece; Baxter delivering intel
  - Baxter's research update on Annabelle (location: farmer's market)
  - "How did you do this before the internet?" line included
  - **First job backstory delivered:** college era, engagement breakup job, sister's sorority, Eddie's pitch, gratitude moment, transition to full-time
  - Baxter fascinated by the story
  - Snapchat/Instagram intel methods mentioned
  - White poodle detail (setup for Scene 6)
  - Running action maintained throughout dialogue
  - Baxter's rapid-fire delivery style established
  - Doogan's story paced naturally (fond memory with edge)
  - POV: First-person (Doogan)
  - Sorkin-style walk-and-talk energy
  - Word count: 800–1,000 words
- **Dependencies:** T004

---

### T006: Draft Scene 5 — Coffeehouse Meet (Sebastian LeClere)
- **Task ID:** T006
- **Task Name:** Write Scene 5 — Duke's Coffee Meeting with Sebastian
- **Files/Directories Affected:**  
  - `content/episodes/episode-01-the-receptionist.md`
- **Action:** Draft new scene content (400–600 words)
- **Acceptance Criteria:**
  - Doogan arrives in running gear (Eddie comments)
  - Running gear justified as cover for farmer's market meet-cute
  - Sebastian too polished/rehearsed in manner
  - Sebastian doesn't know basic receptionist job details
  - Not married excuse + office mess excuse delivered
  - Doogan's instincts fire (subtle "off" feeling)
  - Doogan exits with "late for meet-cute" line
  - Bacon steal from plate (callback to Scene 6 setup)
  - Sebastian's dialogue feels rehearsed but not cartoonish
  - POV: First-person (Doogan's perceptions)
  - Tone: Subtly wrong without being obvious
  - Word count: 400–600 words
- **Dependencies:** T005

---

### T007: Draft Scene 6 — Farmer's Market (Doogan Charms Annabelle)
- **Task ID:** T007
- **Task Name:** Write Scene 6 — First Meet-Cute at Farmer's Market
- **Files/Directories Affected:**  
  - `content/episodes/episode-01-the-receptionist/06-farmers-market.md`
- **Action:** Draft new scene content (500–700 words)
- **Acceptance Criteria:**
  - File created: `06-farmers-market.md` in episode directory
  - Scene heading: `## Scene 6 — Farmer's Market`
  - Scene break marker: `---` at end of file
  - White poodle obsessed with Doogan (bacon in pocket callback)
  - Annabelle embarrassed by dog behavior
  - Fast banter establishes chemistry
  - Doogan leaves first (intentional social intelligence move)
  - Baxter confused in earpiece ("why'd you leave?")
  - Chemistry shown through dialogue rhythm, not description
  - Doogan's charm: playful, not predatory; accidentally effective
  - POV: First-person (Doogan)
  - Tone: Playful, light, charming
  - Word count: 500–700 words
- **Dependencies:** T006

---

### T008: Draft Scene 7 — The Meet Cute Debrief (Looking for Background)
- **Task ID:** T008
- **Task Name:** Write Scene 7 — Team Debrief and Research
- **Files/Directories Affected:**  
  - `content/episodes/episode-01-the-receptionist/07-meet-cute-debrief.md`
- **Action:** Draft new scene content (400–600 words)
- **Acceptance Criteria:**
  - File created: `07-meet-cute-debrief.md` in episode directory
  - Scene heading: `## Scene 7 — The Meet Cute Debrief`
  - Scene break marker: `---` at end of file
  - Doogan reports market encounter to Eddie
  - Eddie dismisses concerns about the job
  - Abby sides with Doogan (ethics/instinct alignment)
  - Baxter on FaceTime tablet (four-way scene dynamics)
  - Social media check: no recent breakup visible
  - Eddie pushes Baxter to bend rules (transaction patterns research)
  - Abby's "bunch of stalkers" line delivered
  - Four-way dialogue scene: Eddie/Doogan/Abby in room + Baxter on screen
  - Team friction and comedic tension present
  - Abby as conscience/moral anchor
  - POV: First-person (Doogan)
  - Word count: 400–600 words
- **Dependencies:** T007

---

### T009: Draft Scene 8 — Coincidence #2 (The Tomato Aisle)
- **Task ID:** T009
- **Task Name:** Write Scene 8 — Grocery Store Second Encounter
- **Files/Directories Affected:**  
  - `content/episodes/episode-01-the-receptionist/08-tomato-aisle.md`
- **Action:** Draft new scene content (600–800 words)
- **Acceptance Criteria:**
  - File created: `08-tomato-aisle.md` in episode directory
  - Scene heading: `## Scene 8 — Coincidence #2 (The Tomato Aisle)`
  - Scene break marker: `---` at end of file
  - Doogan pretending to shop (tomatoes), Annabelle surprised to see him again
  - Cart check: trendy premade meals visible
  - Restaurant questions lead to shrimp risotto guess by Doogan
  - Baxter in ear: "no way she invites you"
  - Grocery store has ingredients; Doogan buys them anyway
  - Walk-out conversation
  - Condo across street reveal (convenience)
  - Minimal utensils joke / "takes minutes" line
  - Annabelle invites him to cook for her
  - Baxter reaction: "WHAT?"
  - Annabelle's hesitation visible (weird he's there again) but curiosity/attraction wins
  - Flirty escalation tone, slightly unnatural override for her
  - POV: First-person (Doogan)
  - Word count: 600–800 words
- **Dependencies:** T008

---

### T010: Draft Scene 9 — Dinner at Annabelle's (Blackout Cliffhanger)
- **Task ID:** T010
- **Task Name:** Write Scene 9 — Dinner, Intimacy, and Cliffhanger
- **Files/Directories Affected:**  
  - `content/episodes/episode-01-the-receptionist/09-dinner-at-annabelles.md`
- **Action:** Draft new scene content (400–600 words)
- **Acceptance Criteria:**
  - File created: `09-dinner-at-annabelles.md` in episode directory
  - Scene heading: `## Scene 9 — Dinner at Annabelle's`
  - Scene break marker: `---` at end of file
  - Quick tidy of apartment ("camera ready" detail)
  - Doogan cooks shrimp risotto
  - Wine from client: Woodmark Vineyards, Napa (Doogan doesn't recognize brand)
  - Toast/banter/heat between them
  - Annabelle makes first move (kiss/intimacy)
  - **BLACKOUT transition** (abrupt, disorienting—no fade prose)
  - Foggy wake-up: Doogan disoriented
  - Badge tap sound (police/detective)
  - Detective gesture/presence
  - Annabelle dead in bed (revealed)
  - Line: "Hands where I can see them."
  - Hard CUT. End episode.
  - Tone: Light → intimate → HARD SNAP to horror
  - Blackout must be abrupt and jarring (no transition prose)
  - Cliffhanger: Doogan now prime suspect
  - POV: First-person (Doogan)
  - Word count: 400–600 words
- **Dependencies:** T009

---

### T011: Episode Integration, Polish, and Metadata Update
- **Task ID:** T011
- **Task Name:** Review, polish, and finalize episode
- **Files/Directories Affected:**  
  - `content/episodes/episode-01-the-receptionist/*.md` (all scene files)
  - `output/episode-01-the-receptionist.md` (compiled output — created via separate compile prompt)
- **Action:** Review and refine full episode draft
- **Note:** Episode compilation into single output file happens via separate compile prompt after all scenes complete
- **Acceptance Criteria:**
  - **Dialogue rhythm check:** Verify 80–90% dialogue per scene
  - **Tags/beats distribution:** Max 3 untagged lines (2-person), max 5 (multi-character)
  - **POV compliance:** All scenes first-person narrated by Doogan (Fletch Rule)
  - **Tone consistency:** Fast, witty, satirical; nimble shifts from light to dark executed cleanly
  - **Word count target:** Episode total 4,500–5,500 words
  - **Serial beat delivery:**
    - Hook: Scene 1 establishes premise
    - Escalation: Scenes 2–8 build tension
    - Cliffhanger: Scene 9 ends on corpse reveal
  - **Scene breaks/dividers:** Add per `voice/format.md` conventions
  - **Metadata update:** Final word count, status changed to "draft-complete"
  - **Character voice consistency:** Doogan, Eddie, Abby, Baxter voices match profiles
  - **Continuity check:** No contradictions with `elements/**` files
- **Dependencies:** T002, T003, T004, T005, T006, T007, T008, T009, T010

---

### T012: QA Pass — Checklist and Continuity Verification
- **Task ID:** T012
- **Task Name:** Final QA pass for checklist compliance and continuity
- **Files/Directories Affected:**  
  - `content/episodes/episode-01-the-receptionist/*.md` (all scene files)
  - `output/episode-01-the-receptionist.md` (compiled output — created via separate compile prompt)
  - `elements/checklist.md` (reference only)
  - `elements/pov.md` (reference only)
  - `elements/tone.md` (reference only)
  - `elements/characters/*.md` (reference only)
- **Action:** Verify compliance and log any issues in `feedback.md`
- **Note:** QA pass reviews both individual scene files and final compiled output
- **Acceptance Criteria:**
  - **POV Rule:** First-person narration by Doogan; no omniscient narration
  - **Fletch Rule:** Reader learns when Doogan learns (no villain POV, no off-screen dramatization)
  - **Dialogue-Driven:** 80–90% dialogue confirmed per scene
  - **Tags/Beats:** No violations of 3-line (2-person) or 5-line (multi-character) untagged limits
  - **New Speaker Rule:** Each speaker gets new paragraph
  - **Tag Tone:** Neutral tags preferred; vivid verbs in action beats only
  - **Secrecy Rule:** Target never learns they were hired (n/a for this episode but verified)
  - **Tone Consistency:** Fast, witty, satirical with nimble mood shifts
  - **Character Consistency:** All character voices match canonical profiles
  - **Continuity Check:** No contradictions with existing `elements/**` or `content/**`
  - **Length:** Episode within 4,500–5,500 word target
  - **Serial Structure:** Hook → escalation → cliffhanger present and functional
  - Document any issues or needed revisions in `drafts/001-episode-01-draft/feedback.md`
- **Dependencies:** T011

---

## Execution Notes

- **Sequential Execution Required:** Tasks T002–T010 must execute in scene order (each scene builds on prior context).
- **Context Limit Strategy:** Each scene task (T002–T010) is isolated and can be executed independently with reference to the plan and prior completed scenes, minimizing token load per task.
- **QA Separation:** T011 (polish) and T012 (QA) are separate to allow focused passes without conflating integration with validation.
- **Atomic Tasks:** Each task has clear acceptance criteria and can be verified independently.

---

## Task Summary

| Task ID | Task Name | Type | Est. Words | Dependencies | Status |
|---------|-----------|------|------------|--------------|--------|
| T001 | Setup Episode File Structure | Setup | — | None | ✅ Complete |
| T002 | Scene 1 — Prologue | Draft | 400–600 | T001 | ✅ Complete |
| T003 | Scene 2 — Valet | Draft | 500–700 | T002 | ⏳ Pending |
| T004 | Scene 3 — Eddie's Briefing | Draft | 400–500 | T003 | ⏳ Pending |
| T005 | Scene 4 — Morning Run | Draft | 800–1,000 | T004 | ⏳ Pending |
| T006 | Scene 5 — Coffeehouse Meet | Draft | 400–600 | T005 | ⏳ Pending |
| T007 | Scene 6 — Farmer's Market | Draft | 500–700 | T006 | ⏳ Pending |
| T008 | Scene 7 — Debrief | Draft | 400–600 | T007 | ⏳ Pending |
| T009 | Scene 8 — Tomato Aisle | Draft | 600–800 | T008 | ⏳ Pending |
| T010 | Scene 9 — Dinner Cliffhanger | Draft | 400–600 | T009 | ⏳ Pending |
| T011 | Integration & Polish | Polish | — | T002–T010 | ⏳ Pending |
| T012 | QA Pass | QA | — | T011 | ⏳ Pending |

**Total Estimated Words:** 4,500–5,500  
**Total Tasks:** 12  
**Completed:** 2  
**Remaining:** 10
