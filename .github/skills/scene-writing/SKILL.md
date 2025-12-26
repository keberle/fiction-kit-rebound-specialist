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

**Character Files:**
- Read `elements/characters.md` for character list
- Read EVERY file in `elements/characters/` for characters in this scene
- Note: physical traits, voice patterns, mannerisms, relationships, anti-patterns
- Use ONLY canonical information—never invent details

**Story Structure Files:**
- `elements/plot.md` - Overall story arc and structure
- `elements/arc.md` - Character arcs and development
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

### 5. Verify Scene Context

**Before writing, answer:**
- What happened immediately before this scene?
- Who is present in this scene?
- What is the POV character's emotional state?
- What information does POV character know at this point?
- What details were established in prior scenes that must be preserved?
- Are there any anti-patterns to avoid? (Check character files for Fashion Anti-Patterns, Motor-Mouth Rules, etc.)

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
