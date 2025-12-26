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

**BEFORE writing ANY prose, complete these steps:**

### 1. Load Character Files

- Read ALL relevant files from `elements/characters/<name>.md`
- Review physical traits, voice patterns, mannerisms, relationships
- Use ONLY canonical information—never invent details

### 2. Load Constraint Files

- `elements/pov.md` - POV rules (third-person close, one per scene)
- `elements/tone.md` - Tone requirements
- `elements/checklist.md` - Non-negotiable quality standards
- `voice/style.md` - Voice patterns and prose style
- `voice/format.md` - Format structure (episodes, scenes, etc.)

### 3. Check Scene Context

- What happened immediately before this scene?
- Who is present?
- What is the POV character's emotional state?
- What information does POV character know at this point?

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

- [ ] McDonald opening (no weather/introspection first)
- [ ] POV maintained throughout (no head-hopping)
- [ ] Character voices accurate (reviewed character files)
- [ ] Sensory details present (specific, not generic)
- [ ] Emotional truth (behavior feels honest)
- [ ] Scene opens/closes doors (discovery momentum)
- [ ] Scene break marker `---` at end

## Next Step

After drafting, use **draft-validation** skill to check against full checklist.
