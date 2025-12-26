---
name: character-management
description: Maintain character consistency by cross-referencing canonical character files. Use when writing scenes with established characters, updating character information, or checking for contradictions. Prevents invented physical details, cars, homes, or backstory. Triggers include "character consistency", "check character", "update character file", "character canon", "character validation".
---

# Character Management

Ensure character consistency across scenes and episodes by maintaining canonical character files and validating usage.

## When to Use This Skill

Use this skill when you need to:
- Write a scene with established characters
- Update a character file with new canonical information
- Check if character usage contradicts established facts
- Verify character voices remain consistent

## Critical Rule: NO INVENTED DETAILS

**NEVER invent:**
- Physical traits (hair color, height, clothing style)
- Cars or vehicles ("drove away in her BMW" ❌)
- Homes or living spaces
- Habits or mannerisms not established
- Backstory elements
- Relationships not previously mentioned

**IF information is missing:**
- Stay vague ("drove away" ✅ not "drove away in her BMW" ❌)
- Use generic descriptions ("sat down" ✅ not "slumped into leather chair" ❌)
- Flag for author to decide and add to character file

## Character File Structure

All character canonical data lives in `elements/characters/<name>.md`:

### Required Sections
- **Name & Role**
- **Physical Description** (age, appearance, distinctive features)
- **Voice Patterns** (speech style, vocabulary, cadence)
- **Mannerisms** (habits, body language, tics)
- **Relationships** (to other characters)
- **Background** (only what's established in canon)
- **Motivation** (current arc goals)

## Character Consistency Workflow

### Before Writing Any Scene

1. **Load All Present Characters**
   - Read complete file for each character in scene
   - Note current emotional state from previous scenes
   - Check relationships to other present characters

2. **Voice Verification**
   - Review speech patterns for each character
   - Check vocabulary level and cadence
   - Verify dialogue tags match voice

3. **Visual Consistency**
   - Check physical descriptions match established canon
   - Verify mannerisms appear consistently
   - Check clothing/appearance only if previously established

4. **Relationship Dynamics**
   - Verify how characters interact matches established relationships
   - Check emotional temperature between characters
   - Note any relationship changes that occurred in previous scenes

## Updating Character Files

**When adding to character files:**

1. **Source Verification**
   - Information must come from published scenes
   - Author explicitly established it
   - Not inferred or invented

2. **Update Process**
   - Add to appropriate section in character file
   - Include scene reference where established
   - Format consistently with existing entries

3. **Change Log**
   - Note date of update
   - Reference scene/episode where detail was added

## Character Introduction Pattern

**First appearance of character:**
- Use name + role: "Eddie Palmer, his business partner"
- Give 1-2 distinctive physical details (if relevant to POV)
- Establish voice immediately through dialogue
- Show relationship to POV character

**Subsequent appearances:**
- Use first name only (unless context requires full)
- Reference distinctive trait only if relevant to moment
- Voice carries identity more than description

## Validation

Use `scripts/validate_consistency.py` to check character usage:

```bash
python .github/skills/character-management/scripts/validate_consistency.py content/episodes/episode-01-*/01-scene.md
```

Checks:
- [ ] All characters in scene have files in `elements/characters/`
- [ ] No physical details contradict character files
- [ ] Voice patterns match established speech
- [ ] Relationships match established canon
- [ ] No invented details (cars, homes, habits)

## Example Character File

```markdown
# Doogan Andrews

**Role:** Protagonist, Rebound Specialist

**Physical Description:**
- Age: Late 30s
- [Details per author's establishment only]

**Voice Patterns:**
- Measured drawl
- Short, economical responses
- Dry humor
- Rarely volunteers information

**Mannerisms:**
- Observes before speaking
- Physical stillness (doesn't fidget)
- Eye contact without intimidation

**Relationships:**
- Eddie Palmer: Business partner, best friend since college
- Abby Palmer: Eddie's wife, friend, occasional moral compass
- Paul Martinez: Detective, professional respect, occasional friction

**Motivation (Episodes 1-2):**
- Clear his name in Annabelle Anders murder investigation
- Complete client jobs to pay mounting legal fees
- Protect Eddie/Abby from investigation fallout

**Established in Episodes:**
- Episode 1: Voice, business model, arrest circumstances
- Episode 2: Interrogation style, work ethic, relationship with police
```

## Next Step

After updating character files, use **continuity-checking** skill to verify no contradictions exist across episodes.
