# Sample Scene Generation — Using Agent Skills

Generate standalone sample scenes for testing, demonstration, or exploration using **scene-writing** and **character-management** Agent Skills.

---

## Purpose

Sample scenes are non-canonical explorations used for:
- Testing character voice and dynamics
- Demonstrating writing style to collaborators
- Exploring "what if" scenarios
- Practicing craft techniques
- Generating examples for style guides

**Samples are NOT part of the official story and do not affect continuity.**

---

## Clarification Questions

If the prompt is incomplete, ask the user to specify:

### 1. Episode/Timeline Context
- When does this sample take place? (Episode #, or "non-canonical")
- What's the story state at this point?
- What do characters know at this point in timeline?

### 2. Scene Characters
- Which characters appear in this scene?
- Who is the POV character?
- What are their relationships at this point?

### 3. Scene Setting
- Where does this scene take place?
- Is it an established location or new?
- Time of day? Environmental details?

### 4. Scene Purpose
- What's the scene exploring? (character dynamic, tone, conflict, etc.)
- Any specific beats or moments to include?
- What's the emotional core?

---

## Generation Workflow

### Step 1 — Invoke Character-Management Skill

**BEFORE writing, use the character-management skill:**

1. **Load ALL character files** for characters in scene
   - Read from `elements/characters/<name>.md`
   - Note: physical traits, possessions, habits, voice patterns
   - Review anti-pattern sections (Fashion Anti-Patterns, Motor-Mouth Rules, etc.)

2. **Verify character details:**
   - Use ONLY canonical information from character files
   - Do NOT invent: physical traits, cars, homes, habits, backstory
   - Stay VAGUE if detail not in files

3. **Timeline verification:**
   - What does POV character know at THIS point?
   - What relationships are established?
   - What events have occurred by this point?

**Character-management skill will:**
- Validate character usage against canonical files
- Prevent invented details
- Ensure voice patterns match established canon
- Flag any contradictions to character files

### Step 2 — Load All Context Documents

**Elements documents:**
- `elements/characters.md` - Character list
- `elements/characters/<name>.md` - ALL characters in scene
- `elements/setting.md` - Location details
- `elements/theme.md` - Thematic elements
- `elements/tone.md` - Tone requirements
- `elements/conflict.md` - Core conflicts
- `elements/plot.md` - Story structure
- `elements/notes.md` - Continuity notes
- `elements/arc.md` - Character arcs
- `elements/outline.md` - Series outline
- `elements/outlines/episode-##.md` - Specific episode outline (if applicable)

**Voice documents:**
- `voice/style.md` - McDonald-style prose rules
- `voice/format.md` - Format structure
- `elements/pov.md` - POV rules
- `elements/checklist.md` - Quality standards

**Prior content (for context only):**
- If sample references established events, read relevant prior scenes
- Note: samples don't affect canon, but should feel consistent

### Step 3 — Invoke Scene-Writing Skill

**Use the scene-writing skill to generate the sample:**

**The skill will automatically enforce:**
- Pre-writing character file loading
- McDonald opening rule (dialogue-first, no atmospheric intros)
- POV discipline (third-person close, one per scene)
- Stephen King principles (discovery-driven, sensory detail, emotional truth)
- Character voice consistency
- Continuity preservation (even for non-canonical samples)

**Context to provide to skill:**
1. Scene description/purpose
2. Character files (from character-management skill)
3. Timeline/knowledge state
4. Setting details
5. Emotional core or key beats
6. Episode context (if applicable)

**The scene-writing skill will handle:**
- McDonald opening validation
- POV maintenance
- Character voice accuracy
- Sensory detail inclusion
- Scene structure (opening → escalation → turn → button)
- Craft quality

### Step 4 — Apply Checklist

**Before finalizing, verify against `elements/checklist.md`:**

- ✅ McDonald opening (dialogue-first, no atmospheric intro)
- ✅ POV maintained (third-person close, one character)
- ✅ Character voices match character files
- ✅ No invented details (physical traits, cars, homes)
- ✅ Sensory details present
- ✅ Emotional truth (behavior feels honest)
- ✅ Scene has structure (opening → escalation → turn → button)
- ✅ Dialogue-to-prose ratio (80-90% dialogue)
- ✅ Tone matches (fast, witty, darkly funny)

### Step 5 — Save to Samples Directory

**File naming convention:**
- `samples/##-kebab-case-description.md`
- Use descriptive name capturing scene's core (e.g., `01-eddie-doogan-coffee-shop.md`)
- Check existing samples to avoid duplicates

**File format:**
```markdown
## Sample — [Title]

**Context:** [Episode/timeline or "non-canonical"]  
**POV:** [Character name]  
**Characters:** [List all present]  
**Setting:** [Location]  
**Purpose:** [What this sample explores]

---

[Scene content here]

---
```

---

## Agent Skills Reference

### 1. character-management
**File:** `.github/skills/character-management/SKILL.md`

**Use BEFORE writing:**
- Load and validate character files
- Prevent invented details
- Ensure voice pattern consistency
- Verify timeline-appropriate knowledge

### 2. scene-writing
**File:** `.github/skills/scene-writing/SKILL.md`

**Use FOR writing:**
- Enforce McDonald opening rule
- Maintain POV discipline
- Ensure character voice accuracy
- Apply Stephen King craft principles
- Structure scene properly
- Prevent continuity violations

---

## Sample Scene Types

### Character Voice Exploration
- Focus: How does this character speak and interact?
- Goal: Demonstrate voice patterns and personality
- Example: Doogan and Eddie debating strategy over coffee

### Relationship Dynamic Test
- Focus: How do these characters interact?
- Goal: Explore chemistry, conflict, or connection
- Example: Abby and Martinez comparing notes on Doogan

### Tone Demonstration
- Focus: Show the story's tonal range
- Goal: Demonstrate humor, darkness, or balance
- Example: Baxter explaining technical hacking while eating cereal

### Craft Technique Example
- Focus: Demonstrate specific writing technique
- Goal: Show McDonald opening, dialogue rhythm, etc.
- Example: Scene opening mid-conversation

---

## Critical Rules

1. **Always use character-management skill FIRST** - Load and validate characters
2. **Always use scene-writing skill FOR writing** - Ensures craft quality
3. **Samples don't affect canon** - But should feel consistent with story world
4. **No invented details** - Use only character file information
5. **Character voices must be accurate** - Match established patterns
6. **Apply full checklist** - Same quality standards as canonical scenes
7. **Document purpose** - Include context note explaining what sample explores
8. **Save to samples/** - Keep separate from canonical content

---

## Skill Integration Benefits

**Before (old sample process):**
- Manual character file checking
- Inconsistent voice/style
- Easy to invent details
- No validation

**After (with skills):**
- character-management skill ensures accuracy
- scene-writing skill enforces all craft rules
- Consistent quality with canonical content
- Automated validation
- Samples serve as reliable style examples

---

## Goal

Generate high-quality sample scenes that:
- Use **character-management** skill to ensure accuracy
- Use **scene-writing** skill to ensure craft excellence
- Demonstrate story voice and style effectively
- Maintain character consistency with canonical content
- Serve as useful examples for style reference
