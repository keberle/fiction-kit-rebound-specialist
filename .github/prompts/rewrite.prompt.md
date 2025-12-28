# Scene Rewrite — Using Agent Skills

A structured rewrite process that leverages **scene-writing** and **character-management** Agent Skills to ensure consistency and quality while propagating changes throughout the repository.

---

## Overview

Rewriting a scene involves more than just changing the prose—it requires:
1. Using **scene-writing** skill to ensure craft quality
2. Using **character-management** skill to prevent invented details
3. Propagating changes to element files and other affected content
4. Maintaining continuity across the entire story

---

## Rewrite Workflow

### Step 1 — Identify Scene & Changes

**Document what you're changing:**
- Which scene file? (`content/episodes/episode-##-name/##-scene-name.md`)
- What's the rewrite goal? (pacing, voice, clarity, emotional impact)
- What NEW details are being added? (physical descriptions, possessions, locations, backstory)
- What details are being CHANGED? (contradictions to fix, upgrades to existing info)

**CRITICAL: Read subsequent scenes BEFORE rewriting:**
- Read the scene that follows this one
- Check for forward references (character actions, decisions, knowledge)
- Verify scene ending doesn't contradict what comes next
- Example: If character says "I'll do X" but next scene shows they did Y, fix the statement

### Step 2 — Invoke Character-Management Skill

**BEFORE rewriting, use the character-management skill:**

1. **Load ALL character sources** for characters in this scene
   - Read from `elements/characters.md` (character index - supporting characters like Brad Levitt, Terry, Jillian)
   - Read from `elements/characters/<name>.md` (individual files for main characters like Doogan, Eddie, Abby)
   - **CRITICAL:** Many supporting characters are ONLY documented in `elements/characters.md`, not in individual files
   - Note established details: physical traits, possessions, habits, voice patterns

2. **Verify NO invented details:**
   - Check character files for cars, clothing, homes, physical traits
   - If detail doesn't exist in file, DO NOT add it (or add to file first)
   - Stay VAGUE if uncertain

3. **Timeline verification (CRITICAL - EXPANDED):**
   - **Build timeline from prior scenes:** Track explicit time markers (3 AM, 9 AM, etc.), day progression ("tomorrow," "next day"), elapsed time references
   - **Calculate actual elapsed time** from key events to THIS scene
   - **Cross-check character internal thoughts** about elapsed time against actual timeline
   - What does POV character know at THIS point?
   - Where would they have learned this information?
   - Check character file "What Team Knows & When" sections
   - **FLAG timeline contradictions** (e.g., "six hours" when actual timeline shows "18 hours")

4. **Antagonist/mystery character caution:**
   - Many details may be lies or unknowable
   - Don't invent background info not in files

**Character-management skill will:**
- Validate character usage against canonical files
- Prevent invented physical traits, cars, homes, habits
- Enforce "stay vague if missing" rule
- Check voice patterns match established canon
- **Verify timeline consistency** (elapsed time references match prior scene markers)

### Step 3 — Invoke Scene-Writing Skill

**Use the scene-writing skill to rewrite the scene:**

**The skill will automatically enforce:**
- Pre-writing character file loading
- McDonald opening rule (dialogue-first, no atmospheric intros)
- POV discipline (third-person close, one per scene)
- Stephen King principles (discovery-driven, sensory detail, emotional truth)
- Character voice consistency
- Continuity preservation

**Your responsibilities before invoking skill:**
1. ✅ Load ALL elements documents (plot, arc, conflict, theme, setting, outline, notes, episode outline, **characters.md** for supporting character details)
2. ✅ Load ALL voice documents (style, format, pov, tone, checklist)
3. ✅ Read ALL previous episodes (if Episode 2+)
4. ✅ Read ALL previous scenes in THIS episode (if Scene 2+)
5. ✅ **Read the NEXT scene** (verify no forward-reference contradictions)
6. ✅ Create continuity notes (established facts, character knowledge, secrets)
7. ✅ **Build timeline from prior scenes** (track time markers, calculate elapsed time to THIS scene)
8. ✅ Identify what's changing in the rewrite
9. ✅ **OUTPUT CONTEXT VERIFICATION LOG** (see format in implement.prompt.md)
10. ✅ Pass complete context to scene-writing skill

**The scene-writing skill will handle:**
- McDonald opening validation
- POV maintenance
- Character voice accuracy
- Sensory detail inclusion
- Scene structure (opening → escalation → turn → button)
- Continuity violation prevention

### Step 3a — Invoke Continuity-Checking Skill (Post-Writing Validation)

**AFTER scene-writing skill completes, BEFORE updating element files:**

**Use the continuity-checking skill to validate the rewritten scene:**

1. **Scan for invented details:**
   - Brand names (stores, cars, products)
   - Street names, location specifics
   - Physical details not in character files
   - Objects or props not established

2. **Validate character knowledge:**
   - POV character knows only what they've learned
   - No off-screen information without being told
   - Timeline-appropriate awareness

3. **Validate timeline consistency (CRITICAL - NEW):**
   - Check all elapsed time references in character thoughts
   - Verify time-of-day consistency with prior scenes
   - Confirm day progression matches schedule mentions
   - Cross-check "hours since event X" against actual timeline from Scene 1
   - No off-screen information without being told
   - Timeline-appropriate awareness

3. **Check physical continuity:**
   - Objects from scene opening persist
   - Location details match prior scenes
   - Character state (clothing, mood) consistent

4. **Review violation report:**
   - If violations found: fix and re-validate
   - If clean: proceed to element file updates
   - Do NOT proceed until continuity check passes

**Continuity-checking skill will produce:**
- Line-by-line violation report
- Recommendations for fixes
- PASS/FAIL/WARNINGS status

**Automated check:**
```bash
python .github/skills/continuity-checking/scripts/validate_continuity.py [scene-file]
```

**CRITICAL: Do not mark rewrite complete or update element files until continuity validation passes.**

### Step 4 — Update Element Files (Make Changes Canonical)

**For each NEW detail added in the rewrite:**

#### A. Character Files (`elements/characters/<name>.md`)
- Add physical details to Physical Characteristics section
- Add habits/behaviors to Personality Traits or Background sections
- Add possessions (car make/model/color, tech, signature items)
- Add relationships or dynamics to Relationships section
- Mark source: "*(Established in Episode #, Scene #)*"

#### B. Setting Updates (`elements/setting.md`)
- Add new locations with descriptions
- Add cultural details or social norms
- Add recurring venues or landmarks

#### C. Continuity Tracking (`elements/notes.md`)
- Document any detail that might be referenced later
- Track clues, foreshadowing, or planted information
- Note callbacks or recurring motifs

#### D. Episode Outline Updates (`elements/outlines/episode-##.md`)
- Update scene beat descriptions to reflect the rewritten version
- Adjust outline if scene structure or purpose has changed
- Add notes about new details that affect future scenes

#### E. Event/Timeline Updates (`elements/events/` or `elements/timeline.md`)
- If rewrite changes chronology or adds backstory events
- If rewrite establishes new timeline anchors

### Step 5 — Update Current Draft Folder (if applicable)

If this rewrite is part of an active draft cycle:

**A. Update `drafts/<###-name>/plan.md`:**
- If rewrite changes scene structure or approach
- If new details affect execution strategy

**B. Update `drafts/<###-name>/tasks.md`:**
- Mark rewrite task as complete `[X]`
- Add new tasks if rewrite reveals additional work needed

**C. Update `drafts/<###-name>/analyze.md`:**
- Add analysis entry documenting the rewrite and its impact
- Note what was changed and why
- Document what element files were updated

**D. Update `drafts/<###-name>/feedback.md`:**
- If rewrite addresses previous feedback items

### Step 6 — Scan Content Folder for Impact

**Search for affected characters/locations:**

1. **Character mentions:**
   ```bash
   grep -r "CharacterName" content/episodes/
   ```
   - Find all scenes that mention the character
   - Flag scenes that might need consistency updates
   - Note opportunities for callback details

2. **Location mentions:**
   - Find all scenes set in the same location
   - Ensure descriptions remain consistent

3. **Related objects/themes:**
   - If new recurring object introduced (car, accessory)
   - Check if it should appear in other scenes

**Document in analyze.md:**
- Which scenes flagged for review
- Potential continuity conflicts
- Recommended follow-up rewrites

### Step 7 — Final Consistency Check

**Run continuity-checking skill one final time:**
- ✅ Rewritten scene passes continuity validation
- ✅ Zero invented details detected
- ✅ Character knowledge timeline verified
- ✅ Physical continuity maintained

**Cross-reference using character-management skill:**
- ✅ All new details documented in element files
- ✅ Character files complete and accurate
- ✅ Setting details captured
- ✅ No invented details remained
- ✅ Voice patterns consistent

**Verify draft folder (if applicable):**
- ✅ Plan, tasks, analyze files updated
- ✅ Follow-up work documented

**Review content implications:**
- ✅ Flagged scenes listed
- ✅ Continuity conflicts identified
- ✅ Follow-up work prioritized

### Step 8 — Output Documentation

**Provide summary of all updates:**

#### Scene Rewritten
- `content/episodes/episode-##-name/##-scene-name.md`

#### Element Files Updated
- `elements/characters/<name>.md` - Added [detail], marked source
- `elements/setting.md` - Added [location/detail]
- `elements/notes.md` - Added [continuity note]
- `elements/outlines/episode-##.md` - Updated scene beats

#### Draft Folder Updated (if applicable)
- `drafts/<###>/plan.md` - [changes]
- `drafts/<###>/tasks.md` - Marked T### complete
- `drafts/<###>/analyze.md` - Added rewrite entry

#### Content Folder Impact
- Flagged scenes for review: [list with file paths]
- Recommended follow-up rewrites: [list]
- Potential continuity conflicts: [list]

#### Continuity Notes
- [Any implications for future scenes]
- [New details that might appear in other scenes]

---

## Agent Skills Reference

### 1. scene-writing
**File:** `.github/skills/scene-writing/SKILL.md`

**Handles:**
- McDonald opening rule enforcement
- POV discipline (third-person close)
- Character voice consistency
- Stephen King craft principles
- Scene structure and pacing
- Continuity violation prevention

**Pre-writing workflow (automatic):**
- Loads character files
- Checks constraint files (POV, tone, checklist, style)
- Validates scene context
- Enforces McDonald eavesdropper test
- Cross-checks prior scenes for continuity

### 2. character-management
**File:** `.github/skills/character-management/SKILL.md`

**Handles:**
- Character consistency validation
- Prevents invented details (NO invented: physical traits, cars, homes, habits, backstory)
- Enforces "stay vague if missing" rule
- Voice pattern validation
- Timeline-aware knowledge verification

**Validation script:**
```bash
python .github/skills/character-management/scripts/validate_consistency.py [scene-file]
```

### 3. continuity-checking
**File:** `.github/skills/continuity-checking/SKILL.md`

**Handles:**
- Post-writing continuity validation
- Detects invented proper nouns (brands, street names, car models)
- Validates character knowledge timeline
- Checks physical continuity across scenes
- Produces violation report with line numbers and fix recommendations

**Validation script:**
```bash
python .github/skills/continuity-checking/scripts/validate_continuity.py [scene-file]
```

**Critical: Run this AFTER scene-writing skill completes, BEFORE updating element files.**

---

## Rewrite Quality Prompts

Before finalizing, ask yourself:

**Craft Quality (scene-writing skill enforces):**
- What can be cut without losing meaning?
- Is this the strongest verb available?
- What sensory detail grounds this moment?
- Does this scene earn its place?

**Consistency (character-management skill enforces):**
- Have all new details been documented in element files?
- Did I verify all character details against character files?
- What does the POV character actually KNOW at this point?
- Where would they have learned this information?
- Am I inventing details not in canon?
- Is this an antagonist? Are these details true, lies, or unknowable?

**Impact:**
- Do any other scenes need updates to maintain consistency?
- Have I searched content/ for all mentions of affected characters/locations?
- Are there callback opportunities I should note?

---

## Critical Rules

1. **Always use character-management skill BEFORE writing** - Prevents invented details
2. **Always use scene-writing skill FOR writing** - Ensures craft quality
3. **Always use continuity-checking skill AFTER writing** - Detects violations before they become canon
4. **Every new detail must become canonical** - Add to element files
5. **Search for impact** - Always grep content/ for character mentions
6. **Document the cascade** - Track what files were updated in analyze.md
7. **Output everything** - Provide scene + all updated element/draft files
8. **Timeline awareness is mandatory** - Character knows only what they've learned by this point
9. **No invented backstory** - If not in character file, stay vague
10. **Verify before writing** - Use character-management skill to load and validate
11. **Information source required** - If character knows something, show where it came from
12. **Do not proceed until continuity validation passes** - Zero tolerance for violations

---

## Skill Integration Benefits

**Before (old rewrite process):**
- Manual character file checking
- Easy to invent details
- No automated validation
- Craft rules scattered across documents

**After (with skills):**
- character-management skill prevents invented details automatically (pre-writing)
- scene-writing skill enforces all craft rules (during writing)
- continuity-checking skill detects violations automatically (post-writing)
- Three-stage validation: prevent → enforce → detect
- Pre-writing checklists enforced by skills
- Validation scripts available
- Consistent quality across all rewrites

---

## Goal

Produce a high-quality rewritten scene that:
- Uses **character-management** skill to ensure NO invented details (pre-writing)
- Uses **scene-writing** skill to ensure craft excellence (during writing)
- Uses **continuity-checking** skill to validate final result (post-writing)
- Propagates all changes to element files
- Maintains continuity across entire story
- Documents all impacts and follow-up work
- Passes continuity validation with zero violations
