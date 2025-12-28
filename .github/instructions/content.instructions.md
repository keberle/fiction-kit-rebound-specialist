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
- [list all time-related words: "tonight", "tomorrow", "yesterday", "now", etc.]

Timeline Alignment Check:
- [ ] Scene exists in timeline.md (YES/NO)
- [ ] Time references match scene timestamp (PASS/FAIL)
- [ ] No contradictions with prior/next scenes (PASS/FAIL)
- [ ] Character locations verified (PASS/FAIL)

Character Physical Traits Verification:
- [Character Name]: [Height/Build/Clothing Size from elements/characters/]
- [Repeat for each character with physical details mentioned]

VALIDATION: [PASS/FAIL]

[If FAIL, STOP and report issues - Do NOT proceed with edits]
===
```

**If you skip this verification output, you are violating project requirements.**

### Required Context Loading (Minimum)
1. **Read `.github/copilot-instructions.md`** — All workflow and writing rules
2. **Read `elements/timeline.md`** — Verify scene's chronological placement and surrounding events
3. **Check scene's episode outline** — Verify beat mechanisms from `elements/outlines/episode-##.md`
4. **Check character files** — Only use canonical details from `elements/characters/`
5. **Review prior scenes in episode** — Maintain continuity with earlier events

### Timeline Verification Process
1. **Locate scene in timeline:** Find the scene's timestamp and event summary in `elements/timeline.md`
2. **If scene is NOT in timeline:** Flag for timeline update after writing
3. **Verify surrounding events:** Check what happened before/after for continuity
4. **Check event references:** If timeline references `events/*.md` files, read them for detailed context
5. **Note time gaps:** Understand how much time passes between this scene and adjacent scenes

## During Scene Writing

### Timeline Consistency Rules
- **Time progression:** Ensure scene timing aligns with timeline timestamps
- **Event references:** Match details from timeline (who's present, what's known, what's happened)
- **Continuity:** Don't reference events that haven't happened yet in timeline
- **Details:** Use timeline for canonical facts (names, times, locations, sequences)

### Key Rules (Summary)
- **POV:** Third-person close, locked to Doogan (see `elements/pov.md`)
- **McDonald Rule:** Never open with information just delivered to reader
- **No Invention:** If a detail isn't in source files, don't create it
- **Character Voice:** Match patterns in character files
- **Beat Mechanisms:** Verify HOW events happen from outline, don't guess

## After Writing or Editing a Scene

### Timeline Maintenance (REQUIRED)
1. **Review scene for new timeline events:**
   - New characters introduced
   - Key plot revelations
   - Location changes
   - Time passage indicators
   - Critical decisions or actions

2. **Check if scene exists in timeline:**
   - If YES: Verify details match timeline entry
   - If NO: Scene must be added to timeline

3. **Update `elements/timeline.md` if needed:**
   - Add missing scene with timestamp, location, characters, key events
   - Add scene filename reference
   - Update surrounding context if necessary
   - If event is complex, consider creating `events/*.md` file and reference it

4. **Verify no timeline contradictions:**
   - New details don't contradict earlier timeline entries
   - Time gaps make sense
   - Character knowledge tracks correctly
   - Sequences remain logical

### Timeline Update Format
When adding scene to timeline, include:
- **Timestamp:** Relative to Day 0, Hour 0 (Episode 1, Scene 1)
- **Location:** Where scene takes place
- **Characters present:** Who appears in scene
- **Key events:** 3-5 bullet points of what happens
- **Scene reference:** Link to content file
- **Connections:** References to related events or event files

## If Uncertain

When a mechanism, fact, or detail is unclear:
- Mark with `[NEEDS CLARIFICATION: ...]`
- Do NOT guess or invent
- Ask for clarification before proceeding

## Context Window Efficiency

**The timeline reduces context load:**
- Read timeline FIRST (high-level, scannable)
- Only load full outlines if beat mechanisms unclear
- Only load event files when timeline references them
- This preserves context window space for actual writing

---

## Note on Custom Documentation Directories

The following directories contain advisory documentation for manual reference:
- `.github/prompts/` — Template prompts (not auto-enforced by GitHub Copilot)
- `.github/skills/` — Skill definitions (not auto-enforced by GitHub Copilot)

These files are NOT official GitHub Copilot features and do not provide automated validation. The mandatory timeline verification in this file IS enforced through GitHub Copilot's official path-specific instructions feature.
