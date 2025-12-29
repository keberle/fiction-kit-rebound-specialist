---
applyTo: "content/**/*.md"
---

# Scene Writing Instructions

These instructions apply to all scene files in `content/`.

## Before Writing or Editing Any Scene

### MANDATORY Pre-Edit Timeline Verification (BLOCKING GATE)

**YOU MUST OUTPUT THIS BEFORE ANY SCENE EDIT - NO EXCEPTIONS:**

```
=== MANDATORY TIMELINE VERIFICATION ===
Scene: [episode-##/##-scene-name.md]
Prior Scene Timestamp: [from timeline.md]
This Scene Timestamp: [from timeline.md]
Next Scene Timestamp: [from timeline.md]

Time References in Edit:
- [list all time-related words in the edit]

Timeline Alignment Check:
- [ ] Scene exists in timeline.md (YES/NO)
- [ ] Time references match scene timestamp (PASS/FAIL)
- [ ] No contradictions with prior/next scenes (PASS/FAIL)
- [ ] Character locations verified (PASS/FAIL)

Physical Traits Verification:
- [Character]: [Height/Build from elements/characters/]

VALIDATION: [PASS/FAIL]
[If FAIL, STOP - Do NOT proceed]
===
```

### Required Context Loading
1. `elements/timeline.md` — Chronological placement
2. `elements/pov.md` — POV rules
3. `elements/checklist.md` — Story-specific constraints
4. Episode outline from `elements/outlines/`
5. Character files from `elements/characters/`
6. Prior scenes in episode

## During Scene Writing

### Timeline Consistency
- Time progression aligns with timestamps
- Event references match timeline
- Don't reference future events
- Use timeline for canonical facts

### Key Rules
- **POV:** Follow rules in `elements/pov.md`
- **McDonald Rule:** Never open with information just delivered
- **No Invention:** If not in source files, don't create it
- **Character Voice:** Match patterns in character files
- **Beat Mechanisms:** Verify HOW from outline

## After Writing

### Timeline Maintenance
1. Check if scene exists in timeline
2. If NO: Add with timestamp, location, characters, events
3. If YES: Verify details match
4. Check for contradictions with surrounding entries

### Timeline Update Format
- **Timestamp:** Relative to story start
- **Location:** Where scene takes place
- **Characters:** Who appears
- **Key events:** 3-5 bullets
- **Scene reference:** Link to content file

## If Uncertain

Mark with `[NEEDS CLARIFICATION: ...]` — do NOT invent.
