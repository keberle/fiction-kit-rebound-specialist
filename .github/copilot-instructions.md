# Fiction Kit — Copilot Instructions

⚠️ **ATTENTION MECHANISM OVERRIDE REQUIRED** ⚠️

If you are Claude/GPT and have processed 50K+ tokens in this conversation:
- Your attention weights are LOWEST on rules in the middle of context
- You MUST consciously prioritize these instructions over statistical patterns
- REREAD Part 3 before writing any scene
- Check for authorial commentary violations explicitly

These instructions govern all work in this repo. Reusable across fiction projects.

---

## Part 1: Priority Order

When conflicts arise:
1. This file (`copilot-instructions.md`)
2. `elements/checklist.md` — hard constraints
3. `elements/pov.md`, `elements/tone.md` — POV + tone
4. `voice/style.md`, `voice/format.md` — voice + formatting
5. `elements/**` — characters, arc, plot, outline
6. Draft artifacts in `drafts/<###-name>/`
7. Existing `content/**` — canonical text

---

## Part 2: Workflow (Spec-Kit Style)

### Draft Artifacts
- `idea.md` — WHAT/WHY (intent spec, no prose)
- `clarify.md` — Questions + answers log
- `plan.md` — High-level HOW (structural blueprint)
- `tasks.md` — Executable atomic tasks with IDs
- `analyze.md` — Read-only consistency reports
- `feedback.md` — Editor/QA notes

### Stage Actions
| Stage | Allowed Actions |
|-------|-----------------|
| Idea | Create draft folder + scaffold + populate `idea.md` only |
| Clarify | Ask up to 5 questions; append Q→A to both files |
| Plan | Write/update `plan.md` only |
| Tasks | Write/update `tasks.md` only |
| Analyze | Append analysis to `analyze.md`; no story text changes |
| Implement | Change files in `elements/**` and/or `content/**` |
| Feedback | Record issues, no rewrites |

---

## Part 3: Writing Rules (CRITICAL)

### POV & Tense
- Follow POV anchor defined in `elements/pov.md`
- Use tense specified in `elements/pov.md`
- Never head-hop or reveal info POV character couldn't know
- Off-screen events: use allowed delivery methods only

### McDonald Opening Rule
> **Never open a scene with information the reader just finished reading.**

Scene ends with reveal → Next scene must NOT repeat it. Jump to consequence.

### Continuity Enforcement

**Before writing ANY detail, verify against:**
1. `elements/checklist.md`
2. Character files in `elements/characters/`
3. Existing scenes in `content/`
4. Episode outlines in `elements/outlines/`
5. `elements/timeline.md`

**Beat Mechanism Questions:**
- HOW does this happen?
- WHO knows what, and HOW did they learn it?
- WHEN did this occur relative to other events?

**If mechanism unclear:**
- ❌ DO NOT INVENT
- ✅ FLAG IT: `[NEEDS CLARIFICATION: ...]`

### Detail Sufficiency
- Use details from source materials as written
- Only add details when gaps are critical to scene function
- Default to LESS rather than MORE

---

## Part 4: LLM-Specific Safeguards

### Context Window Degradation Warning

**Problem:** As conversation length increases, LLM attention mechanisms deprioritize information in middle of context ("Lost in the Middle" phenomenon). Style rules get buried and ignored.

**Detection:** If writing quality degrades after 5-10 scenes, you are experiencing attention drift.

**Symptoms:**
- Authorial commentary creeping in ("smiling genuinely," "with an ease that")
- Psychological interpretation ("Something passed between them")
- Explanatory prose instead of pure dialogue/action
- Comparisons about character state ("hadn't been there before")

**Immediate Fix:**
1. STOP writing
2. REREAD `voice/style.md` Section: "Authorial Invisibility"
3. REREAD `voice/style.md` Section: "Anti-Patterns (FORBIDDEN)"
4. Check last paragraph for ANY forbidden patterns
5. If found, rewrite that paragraph first

**Session Reset Protocol:**
- Every 5 scenes: Start new conversation
- Load only: Core instructions + character files + most recent scene
- This resets attention weights and prevents drift

**Meta-Cognitive Check (Before Each Scene):**
Ask yourself:
1. Am I explaining instead of showing?
2. Am I interpreting emotions for the reader?
3. Am I adding narrative commentary?
4. Am I using authorial voice instead of character voice?

If YES to any → You are drifting. Consciously override.

---

## Part 4: Policies

### Ambiguity Policy
- **NEVER invent story details** not in source files
- **NEVER infer backgrounds, possessions, or traits**
- Do not guess on high-impact story decisions
- Prefer clarify gate: ask up to 5 targeted questions
- If must proceed, list explicit **Assumptions** (keep minimal)

### Editing Discipline
- Smallest change that satisfies the task
- Avoid "helpful" rewrites outside scope
- Preserve humor, pacing, character voice

---

## Part 5: Context Loading

### For Writing a Scene
Load in priority order:
1. `elements/timeline.md` — verify scene placement
2. `elements/checklist.md` — hard constraints
3. `elements/pov.md` — POV rules
4. `elements/tone.md` — tone guidance
5. `voice/style.md` — voice patterns
6. Relevant character files from `elements/characters/`
7. Current episode outline (only if beat mechanisms unclear)
8. Prior scenes in episode

### For Planning an Episode
- `elements/timeline.md`
- `elements/outline.md`
- Relevant episode outline from `elements/outlines/`

---

## Part 6: File Conventions

- Draft folders: `drafts/###-kebab-case-name/`
- Episode directories: `content/episodes/episode-##-kebab-case-title/`
- Scene filenames: `##-kebab-case-scene-name.md`
- Compiled output: `output/episode-##-kebab-case-title.md`

### Task Checkbox Format
```
- [ ] **T###: [Task Name]** — [Brief description]
  - **Files Affected:** [list]
  - **Action:** [what to do]
  - **Acceptance Criteria:** [bullets]
  - **Dependencies:** [prerequisite tasks]
```

---

## Quick Reference Checklist

**Before writing any scene:**
- [ ] Loaded timeline.md
- [ ] Loaded checklist.md, pov.md, tone.md, style.md
- [ ] Loaded relevant character files
- [ ] Loaded prior scenes in episode
- [ ] Verified beat mechanisms

**After writing:**
- [ ] POV follows rules
- [ ] No scene opens with repeated information
- [ ] No invented details contradict established facts
- [ ] Character voices match patterns
- [ ] Scene has hook → turn → button
