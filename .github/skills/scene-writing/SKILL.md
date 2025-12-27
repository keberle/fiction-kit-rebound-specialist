---
name: scene-writing
description: Write fiction scenes following Stephen King principles and the McDonald opening rule. Use when drafting new scenes, editing existing prose, or writing chapters. Triggers include "write scene", "draft scene", "edit scene", "new chapter", "prose writing", "scene draft". Ensures POV discipline, character voice consistency, and craft quality.
---

# Scene Writing

Write fiction scenes following Fiction Kit voice, style, and craft principles (Stephen King methods + McDonald opening rule).

## When to Use This Skill

Use this skill when you need to:
- Draft a new scene from scratch
- Edit existing scene prose
- Rewrite a scene for pacing or voice
- Add a missing scene to an episode

## Pre-Writing Checklist (MANDATORY)

**BEFORE writing ANY prose, complete ALL these steps in order:**

### 1. Load ALL Elements Documents

**Character Files (CRITICAL - LOAD BOTH):**
- Read `elements/characters.md` for **character index** (supporting character details like Brad Levitt, Terry Tamborino, etc.)
- Read EVERY file in `elements/characters/` for **main characters** in this scene (Doogan, Eddie, Abby, etc.)
- **IMPORTANT:** Many supporting characters are ONLY documented in `elements/characters.md`, not in individual files
- Note: physical traits, voice patterns, mannerisms, relationships, anti-patterns
- Use ONLY canonical information—never invent details

**Story Structure Files:**
- `elements/plot.md` - Overall story arc and structure
- `elements/conflict.md` - Core conflicts and stakes
- `elements/theme.md` - Thematic elements
- `elements/setting.md` - Location details (do not invent setting details)
- `elements/outline.md` - Series outline
- `elements/outlines/episode-##.md` - THIS episode's outline
- `elements/notes.md` - Continuity notes and seeded clues

**Event Files (if applicable):**
- Check `elements/events/` for any past events referenced in scene
- Use ONLY canonical event details from these files

### 2. Load ALL Voice & Style Documents

- `voice/style.md` - McDonald-style prose rules, third-person close POV
- `voice/format.md` - Format structure (episodes, scenes, serial fiction rules)
- `elements/pov.md` - POV rules (third-person close, one per scene)
- `elements/tone.md` - Tone requirements (fast, witty, darkly funny)
- `elements/checklist.md` - Non-negotiable quality standards

### 3. Load ALL Prior Content for Continuity

**CRITICAL: This step prevents continuity errors.**

**For Episode 1, Scene 1:**
- No prior content to check
- Proceed with elements and voice files only

**For Episode 1, Scene 2+:**
- Read ALL previous scenes in THIS episode (Scene 1, Scene 2, ... Scene N-1)
- Note established details: names, places, objects, physical descriptions
- Note character knowledge state: what they know/don't know at this point
- Note secrets that must stay secret

**For Episode 2+, Scene 1:**
- Read ALL scenes from ALL previous episodes
- Note all established facts that cannot be contradicted
- Note character arcs and relationship changes
- Note running gags, callbacks, recurring elements

**For Episode 2+, Scene 2+:**
- Read ALL previous episodes (all scenes)
- Read ALL previous scenes in THIS episode
- Create comprehensive continuity notes

### 4. Create Continuity Notes

**Document these before writing:**
- **Established Facts:** What details have been set in stone? (store names, car models, pet names, addresses, jobs, etc.)
- **Character Knowledge:** What does POV character know at THIS point in timeline?
- **Secrets:** What must stay hidden from certain characters?
- **Physical Descriptions:** What have we established about appearance, clothing, vehicles, homes?
- **Relationship Status:** Where do character relationships stand right now?
- **Emotional State:** What just happened to POV character? What's their mood?
- **Timeline Markers (CRITICAL):** When does this scene take place relative to prior scenes?
  - Track time-of-day mentions (morning, afternoon, evening, night, 3 AM, 9 AM, etc.)
  - Track day progression ("tomorrow," "next day," "same day," "that evening")
  - Track elapsed time references ("six hours later," "the next morning," "two days ago")
  - Calculate actual timeline from Scene 1 forward to THIS scene
  - Document timeline in continuity notes to prevent contradictions

### 5. Verify Scene Context & Timeline (EXPANDED)

**Before writing, answer:**
- What happened immediately before this scene?
- **WHEN does this scene take place?** (time of day, which day in the story)
- **How much time has elapsed since the previous scene?**
- **How much time has elapsed since key events in earlier scenes?** (arrests, meetings scheduled, deadlines mentioned)
- Who is present in this scene?
- What is the POV character's emotional state?
- What information does POV character know at this point?
- What details were established in prior scenes that must be preserved?
- Are there any anti-patterns to avoid? (Check character files for Fashion Anti-Patterns, Motor-Mouth Rules, etc.)

**Timeline Verification Examples:**
```
Scene 2: "Eddie was woken at 3 AM" → Scene 2 walkout: "Hank sweating at 9 AM"
= 6 hours elapsed between call and walkout

Scene 3: "job starts tomorrow morning at nine"
Scene 5: Restaurant meeting same day as Scene 3
= Scene 5 happens BEFORE the job, on day BEFORE the job

Doogan's internal reference: "six hours out from holding cell"
✗ WRONG if holding cell was at 1-3 AM and current scene is evening (12-18 hours)
✓ CORRECT: "less than twenty-four hours out from interrogation"
```

### 6. Verify Beat Mechanisms (NEW - CRITICAL)

**For EACH outline beat in episode-##.md, verify the MECHANISM:**

**The "HOW?" and "WHY?" Questions:**
- Beat says "Character X arrives" → HOW do they know to come? WHY are they there?
- Beat says "Character knows Y" → HOW did they learn it? WHEN? FROM WHOM?
- Beat says "Object appears" → WHERE did it come from? WHO brought it?
- Beat says "Character does Z" → WHY do they do it? What's their motivation?

**Check These Sources:**
1. **notes.md** - Look for established procedures, mechanisms, information flow
2. **Prior scenes** - Was the mechanism established earlier?
3. **Character files** - Does character background explain this knowledge/action?
4. **Common sense** - Is there an obvious implied mechanism (e.g., "lawyer knows case details" = standard briefing)?

**If Mechanism is Unclear:**
- ❌ DO NOT INVENT a mechanism
- ✅ FLAG IT in your context log as "UNVERIFIED BEAT"
- ✅ Ask user for clarification before proceeding
- ✅ Check if mechanism should be shown on-screen vs. implied

**Example Verification:**
```
Outline Beat: "Eddie is there, Hank is there"
❓ HOW does Eddie know to come?
✅ VERIFIED: notes.md says "one phone call" → Doogan called Eddie
✅ MECHANISM: Police procedure allows one call, Doogan used it

Outline Beat: "Hank mentions money too many times"
❓ WHY does Hank bring up money?
✅ VERIFIED: Character type = "parking meter with law degree"
✅ MECHANISM: Hank's personality (transactional, business-focused)

Outline Beat: "Eddie knows about Annabelle investigation"
❓ HOW does Eddie know investigation details?
✅ VERIFIED: Episode 1, Scene 8 - Doogan called Eddie from store
✅ MECHANISM: Phone call established information flow
```

**Document Verified Mechanisms:**
Add to your continuity notes:
- "Eddie knows Doogan was arrested → Doogan called him (one phone call, police procedure)"
- "Hank knows case basics → Eddie briefed him when calling at 3 AM (implied off-screen)"

### 7. Load ENTIRE Episode Outline & Create Scene Map (MANDATORY - CRITICAL)

**BEFORE writing ANY scene, you MUST:**

1. **Read the COMPLETE episode outline** from `elements/outlines/episode-##.md`
2. **Create a SCENE MAP** of the entire episode
3. **Identify THIS scene's boundaries** within the full episode structure

**Why This Is Non-Negotiable:**
- Prevents scene spillover into subsequent scenes
- Ensures you know what comes BEFORE and AFTER this scene
- Catches multi-scene plot threads that would create duplication
- Enforces episode-level structure awareness

**SCENE MAP FORMAT:**

```
EPISODE 2 SCENE MAP:
Scene 1: Holding Cell Graffiti (Doogan POV - interrogation)
  Button: "You've got a lawyer"
  
Scene 2: The Walkout (Doogan POV - lawyer arrives)
  Button: Eddie says "Abby's making pancakes"
  
Scene 3: Eddie's Kitchen (Doogan POV - team briefing)
  Button: Doogan goes home to sleep
  
Scene 4: Doogan's Condo (Doogan POV - shower, sleep, reset)
  Button: Doogan leaves for country club
  
Scene 5: Restaurant Meeting (Doogan POV - client meeting)
  Button: Doogan goes home
  
Scene 6: Country Club Kickoff (Doogan POV - hunt begins)
  Button: "They head for Rose Shop—Jillian tailing"
  
Scene 7: Strip Mall Clinic (Eddie POV - Martinez confrontation)
  Button: Eddie waits for Martinez to leave
  
Scene 8: The Flower Shop (Doogan POV - roses clue)
  Button: "They head for bookstore—Jillian following"
  
Scene 9: Eddie's House (Eddie/Abby/Baxter POV - plan infiltration)
  Button: "Baxter in IT uniform"
  
Scene 10: Bookstore to Speakeasy (Doogan POV - accelerated hunt)
  Button: [to be determined]
```

**CRITICAL VERIFICATION (for Scene 8 example):**

```
WRITING SCENE 8: The Flower Shop

PRIOR SCENE (Scene 7):
- Eddie at clinic
- Martinez confrontation
- Different timeline/POV

THIS SCENE'S BEATS (Scene 8 outline):
- Arrive at Rose Shop
- Jillian follows and eavesdrops
- Cheryl orders red roses (wrong)
- Baxter reads sonnet, identifies "red and white"
- Doogan orders red and white roses
- Clerk gives envelope
- Next clue is Pride and Prejudice
- Baxter finds bookstore
- Cheryl decides to "crush" not just win

THIS SCENE'S BUTTON:
"They head for the bookstore—Jillian and her boyfriend still tailing"

NEXT SCENE (Scene 9):
- Eddie's House
- Different timeline/POV
- Baxter/Abby planning

SCENE AFTER THAT (Scene 10):
- Bookstore to Speakeasy
- THIS is where bookstore happens

BOUNDARY ENFORCEMENT:
❌ DO NOT write: Arriving at bookstore
❌ DO NOT write: Inside bookstore
❌ DO NOT write: Finding Pride and Prejudice clue
❌ DO NOT write: Next clue reveal
✅ STOP AT: Heading toward bookstore
```

**MANDATORY PRE-WRITING CHECKLIST:**

Before writing Scene N:
- [ ] Read ENTIRE episode outline (all scenes)
- [ ] Created scene map with all Buttons identified
- [ ] Identified Scene N-1 (what came before)
- [ ] Identified Scene N's beats and Button
- [ ] Identified Scene N+1 (what comes after)
- [ ] Identified Scene N+2 (to catch multi-scene threads)
- [ ] Verified NO overlap with Scene N+1 or N+2
- [ ] Documented where to STOP writing

**If You Cannot Create Complete Scene Map:**
- ❌ DO NOT proceed with writing
- ✅ FLAG: "Incomplete episode outline - cannot verify boundaries"
- ✅ Ask user for complete episode structure

### 8. Compare Outline to Scene (ANTI-FABRICATION CHECK + BOUNDARY ENFORCEMENT)

**AFTER creating scene map, do line-by-line comparison:**

**Read the episode outline beat list for THIS scene:**
- List every action mentioned in the outline
- List every piece of dialogue mentioned
- List every object/prop mentioned
- List every character interaction specified
- **IDENTIFY WHERE THIS SCENE ENDS** (the "Button" in the outline)

**CRITICAL: SCENE BOUNDARY RULE**
> **Each scene must END at its designated outline "Button." NEVER spill into the next scene's beats.**

**Why This Matters:**
- Episode outlines define clear scene boundaries
- Each scene has a designated purpose, beats, and ending
- Spillover into next scene creates duplication and ruins pacing
- Next scene's opening is carefully crafted—don't steal it

**Scene Boundary Verification:**
1. **Read THIS scene's outline beats** (Scene N)
2. **Read NEXT scene's outline beats** (Scene N+1)
3. **Identify the dividing line**:
   - Where does Scene N's "Button" end?
   - Where does Scene N+1's opening begin?
4. **STOP writing at Scene N's button**—even if it feels like the story should continue

**Example (Episode 2):**
```
Scene 6 Outline:
- Terry introduces Doogan to Cheryl
- Rules announced (scavenger hunt, literature theme)
- First clue given: Shakespeare sonnet
- Baxter identifies "roses"
- Button: "They head for Rose Shop—Jillian tailing"

Scene 7 Outline:
- [Different timeline: Eddie at clinic]

Scene 8 Outline:
- Doogan and Cheryl at Rose Shop
- Roses clue solved
- Next clue received

❌ WRONG (Scene 6 spillover):
Scene 6 includes: heading to Rose Shop → arriving → entering → solving clue → leaving
RESULT: Scene 8 duplicates Rose Shop visit

✅ CORRECT (Scene 6 boundary respected):
Scene 6 includes: rules → clue → Baxter identifies location → Button: heading toward Rose Shop
Scene 8 includes: FULL Rose Shop visit (arrival → entry → solve → exit)
```

**Enforcement Checklist:**
- [ ] Identified where THIS scene's Button ends (per outline)
- [ ] Verified NEXT scene's opening (per outline)
- [ ] Stopped writing at Button—did not continue into next scene
- [ ] If tempted to continue, STOP and flag as "Scene Boundary Risk"

**Create "Outline Implementation Map":**
```
Outline Beat: "Terry introduces Doogan to Cheryl"
Implementation: Terry calls Doogan over, names him, Cheryl responds
Verification: ✅ Matches outline exactly

Outline Beat: "First prize is a designer handbag"
Implementation: Terry announces "vintage Birkin handbag"
Verification: ❌ FABRICATION - outline says "designer handbag" (generic), not specific brand
FIX NEEDED: Use generic "designer handbag" OR verify with user which brand
```

**CRITICAL ANTI-FABRICATION RULES:**

**DO NOT add actions not in outline:**
- ❌ Outline: "Baxter feeds location" → ❌ WRONG: Add phone call charade
- ✅ Outline: "Baxter feeds location" → ✅ RIGHT: Baxter speaks in earpiece, Doogan relays info

**DO NOT add dialogue beats not in outline:**
- ❌ Outline: Silent beat → ❌ WRONG: Add witty banter
- ✅ Outline: Silent beat → ✅ RIGHT: Action/movement only

**DO NOT upgrade generic terms to specific brands:**
- ❌ Outline: "designer handbag" → ❌ WRONG: "Chanel handbag"
- ✅ Outline: "designer handbag" → ✅ RIGHT: "designer handbag" (or ask user for specific brand)

**DO NOT attribute knowledge to characters they shouldn't have:**
- ❌ Outline: "Baxter identifies Sonnet 130" → ❌ WRONG: Doogan recognizes it first
- ✅ Outline: "Baxter identifies Sonnet 130" → ✅ RIGHT: Baxter provides info, Doogan relays

**DO NOT invent character traits from social class assumptions:**
- ❌ ❌ WRONG: "Wealthy character → must know literature" OR "Wealthy character → failed school"
- ✅ ✅ RIGHT: Check character file for actual education/knowledge

**IMPLEMENT EXACTLY WHAT'S WRITTEN:**
- Outline says character "taps ear" → They tap their ear (not make phone call)
- Outline says "Baxter feeds location" → Baxter speaks in earpiece (already established device)
- Outline says "designer handbag" → Use that exact phrase (or ask which brand)
- Outline says beat is character's knowledge → That character provides it (not POV character)

**If outline beat seems incomplete or unclear:**
- ❌ DO NOT improvise to "make it work"
- ✅ FLAG IT and ask user for clarification
- ✅ Implement literally what IS written, skip what ISN'T

### 8. Flag Missing Details (NEW - CRITICAL)

**If ANY detail needed for the scene is NOT in element files, STOP writing.**

**Create a "❓ MISSING DETAILS - USER INPUT NEEDED" section:**

**Examples of details to flag:**
- Character physical descriptions not in files
- Character backgrounds/history not documented
- Relationship histories not established
- Object descriptions (car models, clothing brands, possessions)
- Location specifics (if setting.md doesn't cover it)
- Character motivations not explained in files
- Technical details (procedures, mechanisms, how things work)

**Format for asking:**
```
## ❓ MISSING DETAILS - USER INPUT NEEDED

Before proceeding with Scene X, I need clarification:

### 1. [Detail Category]
**Outline says:** [what outline mentions]
**Currently missing:** [what's not in files]
**Question:** [specific question for user]
**Options (if applicable):** [logical possibilities based on context]

### 2. [Next detail]
...

**Please provide answers, and I'll proceed with accurate details.**
```

**DO NOT:**
- ❌ Invent details to fill gaps
- ❌ Guess at character backgrounds
- ❌ Make up object descriptions
- ❌ Assume relationship histories
- ❌ Proceed with scene until user provides details

**DO:**
- ✅ Stop immediately when detail is missing
- ✅ List ALL missing details before asking
- ✅ Provide context from outline/prior scenes
- ✅ Offer logical options when possible
- ✅ Wait for user response
- ✅ Document user's answers in appropriate element file after scene is complete

## McDonald Opening Rule (NON-NEGOTIABLE)

See `references/mcdonald-rule.md` for full explanation.

**NEVER open with:**
- ❌ Weather descriptions
- ❌ Atmospheric scene-setting
- ❌ Introspection before dialogue
- ❌ Character arriving at location

**ALWAYS open with:**
- ✅ Dialogue mid-progress
- ✅ Action already in motion
- ✅ Eavesdropper test: reader overhears conversation in progress

**Test:** Could an eavesdropper understand what's happening without needing narrator exposition first?

### Quick Examples

**❌ BAD:**
```
Rain drummed against the windows of Eddie's kitchen. Doogan felt exhausted after the interrogation.
```

**✅ GOOD:**
```
"—so Hank costs money, obviously, guy's a lawyer even if he's a bottom-tier one—"
```

## Stephen King Principles

See `references/king-principles.md` for full details. Key rules:

1. **Discovery-Driven** - Character action drives plot (not convenience)
2. **Sensory Detail** - One specific sensory detail per scene beat
3. **Emotional Truth** - Character behavior must be honest
4. **Cut 10-20%** - First draft is too long; remove adverbs, strengthen verbs

## POV Discipline (CRITICAL)

**This project uses third-person close, one POV per scene.**

- Reader knows ONLY what POV character knows
- No head-hopping (switching POV mid-scene)
- No omniscient narrator intrusions
- Off-screen events delivered indirectly (briefing, document, report)

**Fletch Rule:** Reader learns when protagonist learns.

## Continuity Violation Prevention (CRITICAL)

**Common continuity errors to avoid:**

### Invented Details
- ❌ Adding store brand names not mentioned (e.g., "Ralphs" when prior scene said "grocery store")
- ❌ Specifying car makes/models not in character files
- ❌ Describing homes/apartments with details not established
- ❌ Inventing clothing brands, styles, or colors
- ❌ Adding physical traits not in character files (eye color, height, build)

### Knowledge Violations
- ❌ Character knowing information they haven't learned yet
- ❌ Character forgetting information they learned earlier
- ❌ POV character knowing things that happened off-screen without being told

### Relationship Errors
- ❌ Changing established relationship dynamics without cause
- ❌ Characters using nicknames not yet established
- ❌ Ignoring established tensions or conflicts

### Physical Continuity
- ❌ Objects appearing/disappearing (if character arrived with coffee cup, it stays unless mentioned)
- ❌ Time inconsistencies (scene 2 can't be morning if scene 1 ended at night)
- ❌ Location errors (if they're in Eddie's kitchen, stay consistent with established layout)

**Rule:** When in doubt, stay VAGUE. "She drove away" not "She drove away in her BMW." Generic is safe.

## Character Voice Patterns

**Doogan Andrews:**
- Measured drawl
- Short responses
- Dry humor
- Observant, not chatty

**Eddie Palmer:**
- Motor-mouth avalanche
- Mid-sentence starts with em-dashes
- Tangents that circle back
- Nervous energy

**Abby Palmer:**
- Elevated vocabulary
- Sharp, pragmatic
- No yoga pants / messy home clichés
- Confident, competent

**Martinez:**
- Deadpan delivery
- Dry wit
- Principled, married high school sweetheart
- Doesn't understand Doogan's world

## Dialogue Formatting

**Max 3 untagged lines** in 2-person dialogue:

```markdown
"First line," Doogan said.
"Response."
"Follow-up."
"Final response," Eddie said.
```

After 3 lines, re-tag speaker.

## Scene Structure

1. **Opening** (McDonald rule compliance)
2. **Escalation** (tension increases or discovery occurs)
3. **Turn** (something shifts—information, emotion, decision)
4. **Button** (scene ending that propels to next scene)

## Output Format

Output scene content as markdown:

```markdown
## Scene [Number] — [Title]

[Scene content here]

---
```

## Validation Checklist

After writing, verify:

- [ ] **Pre-Writing Completed:** ALL elements, voice, and prior content files loaded
- [ ] **Continuity Preserved:** NO invented details (checked against prior scenes and element files)
- [ ] **Established Facts Honored:** Store names, car models, pet names, physical traits all match prior content
- [ ] McDonald opening (no weather/introspection first)
- [ ] POV maintained throughout (no head-hopping)
- [ ] Character voices accurate (reviewed character files)
- [ ] Sensory details present (specific, not generic)
- [ ] Emotional truth (behavior feels honest)
- [ ] Scene opens/closes doors (discovery momentum)
- [ ] Scene break marker `---` at end

## Continuity Cross-Check

**Before finalizing, answer these questions:**

1. Did I invent ANY detail not in element files or prior scenes? (If yes, remove or make vague)
2. Does this contradict anything established in prior episodes/scenes? (If yes, fix it)
3. Do all character voices match their established patterns? (Check character files)
4. Does POV character know only what they should know at this point? (Check timeline)
5. Are all physical details (clothing, vehicles, locations) consistent with prior scenes?

**If you cannot verify a detail exists in canon, make it GENERIC or REMOVE IT.**

## Next Step

After drafting, use **draft-validation** skill to check against full checklist.
