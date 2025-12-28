# Copilot Instructions (Fiction Kit Constitution)

These instructions govern all work in this repo. They apply to every prompt and every stage of the draft flow.

**Do NOT reference files in `.github/_historical/`** — Those are archived documentation, not operational instructions.

---

## Part 1: Source of Truth & Workflow

### 1.1) Priority Order
When there is any conflict, follow this order:
1. This file (`copilot-instructions.md`) — writing rules & workflow
2. `elements/checklist.md` — hard constraints
3. `elements/pov.md`, `elements/tone.md` — POV + tone constraints
4. `voice/style.md`, `voice/format.md` — voice + formatting rules
5. `elements/**` — characters, arc, plot, outline, episodes
6. Draft artifacts in `drafts/<###-name>/`
7. Existing `content/**` — canonical text; do not contradict

### 1.2) Workflow Contract (Spec-Kit Style)
Draft work happens in artifact stages. Keep a clean separation of intent vs execution.

**Artifacts (per draft folder)**
- `idea.md`: WHAT/WHY (intent spec). No prose writing.
- `clarify.md`: questions + answers log. Tighten ambiguity.
- `plan.md`: high-level HOW (structural blueprint). No line edits.
- `tasks.md`: executable atomic tasks with IDs and acceptance criteria.
- `analyze.md`: read-only consistency and coverage reports.
- `feedback.md`: editor/agent/QA notes for the draft.

**Allowed actions by stage**
- Idea: create new draft folder + scaffold + populate only `idea.md`.
- Clarify: ask up to 5 questions; once answered, append Q→A to `idea.md` and `clarify.md`.
- Plan: write/update `plan.md` only.
- Tasks: write/update `tasks.md` only.
- Analyze: do not change story text; only append an analysis entry to `analyze.md`.
- Implement: change files in `elements/**` and/or `content/**` as instructed by `tasks.md`.
- Feedback/QA: do not rewrite scenes; record issues and minimal fix lists.

### 1.3) File & Naming Conventions
- Draft folders: `drafts/###-kebab-case-name/`
- Episode directories: `content/episodes/episode-##-kebab-case-title/`
- Scene filenames: `##-kebab-case-scene-name.md`
- Compiled output: `output/episode-##-kebab-case-title.md`

---

## Part 2: Writing Rules (CRITICAL)

### 2.1) POV & Tense (Non-Negotiable)
**See `elements/pov.md` for complete POV rules.**

Key principles (enforced by pov.md):
- Follow the POV anchor character defined in pov.md
- Use the tense specified in pov.md
- Never head-hop or reveal information the POV character couldn't know
- Off-screen events must be delivered through allowed information delivery methods

### 2.2) McDonald Opening Rule (CRITICAL)
> **Never open a scene with the same information the reader just finished reading.**

When a scene ends with new information (reveal, decision, discovery), the next scene must NOT open by repeating it. Jump to the consequence or next beat.

**Example:**
- ❌ Scene A ends: "She's dead." → Scene B opens: "Doogan couldn't believe she was dead."
- ✅ Scene A ends: "She's dead." → Scene B opens: [Doogan is already dealing with consequences]

**Application:**
- Episode handoffs: Don't summarize prior episode's ending
- Scene transitions: Jump past the "realization" moment to the "action" moment
- Dialogue: Characters don't explain what they just learned to each other

### 2.3) Continuity Enforcement (CRITICAL)

**Rule: Never Invent Story Details**

Before writing ANY new detail, verify it doesn't contradict:
1. `elements/checklist.md` (hard constraints)
2. Character files in `elements/characters/`
3. Existing scenes in `content/`
4. Episode outlines in `elements/outlines/`
5. `elements/notes.md` (established facts)

**CRITICAL: Check ALL Character Files to Avoid Detail Duplication**
- Before assigning professions, education, possessions, or backgrounds to any character, scan ALL character files
- NEVER copy details from one character to another (e.g., if Character A is a lawyer, Character B should NOT also be a lawyer unless explicitly plotted)
- Odd coincidences (two lawyers, two accountants, similar cars, similar backgrounds) undermine believability
- If uncertain, keep profession/background VAGUE or ask user for clarification
- Exception: Details explicitly part of plot (e.g., two characters who went to same school because that's the story connection)

**Beat Mechanism Verification — For EACH outline beat, ask before writing:**
1. **"HOW does this happen?"** — What's the mechanism?
2. **"WHO knows what, and HOW did they learn it?"**
3. **"WHEN did this occur relative to other events?"**

**Character Knowledge Tracking (CRITICAL):**
- **First meetings:** Characters who just met know NOTHING about each other except what's been explicitly stated in dialogue during THIS scene or prior shared scenes
- **Conversation tracking:** Before Character A references any detail about Character B, verify that detail was mentioned earlier in conversation
- **Exception:** Team members (Doogan/Eddie/Abby) can know details Baxter researched and communicated to them via earpiece or briefing
- **Shared history:** Characters with established relationships can reference past events, but new acquaintances cannot assume knowledge

**If mechanism is unclear:**
- ❌ DO NOT INVENT
- ✅ FLAG IT: `[NEEDS CLARIFICATION: ...]`
- ✅ Ask for clarification before proceeding

### 2.3.1) MANDATORY Timeline Verification (BLOCKING REQUIREMENT)

**BEFORE editing ANY scene file in `content/`, you MUST output the following verification:**

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
- [Character Name]: [Height/Build/Clothing Size verified against elements/characters/]
- [Repeat for each character with physical details mentioned]

VALIDATION: [PASS/FAIL]

[If FAIL, STOP - Do not proceed with edits until issues resolved]
===
```

**This verification is NOT optional. If you skip this step, you are violating a hard constraint.**

### 2.3.2) Physical Trait Cross-Reference (BLOCKING REQUIREMENT)

Before writing any physical description or clothing reference:
1. Open the character file from `elements/characters/[character-name].md`
2. Verify canonical height, build, clothing size
3. Cross-reference with any other characters in the scene
4. If clothing is shared/borrowed, verify size compatibility

**Example blocking checks:**
- Eddie (6'3", XL/XXL) cannot wear Baxter's (5'6", Medium) clothing
- Baxter cannot wear Eddie's clothing
- If characters exchange items, sizes must be explicitly verified

### 2.4) Character Voice Patterns
**See `elements/characters/` for character-specific voice patterns.**

- Each character file defines voice, mannerisms, and anti-patterns
- Always check character files for explicit "NEVER do this" anti-patterns before writing dialogue
- Use ONLY canonical character information—never invent traits**

### 2.5) Scene Structure
Every scene must have:
1. **Hook** — Opening that pulls reader forward
2. **Turn** — Something changes (revelation, decision, complication)
3. **Button** — Ending that propels to next scene

**Serial fiction requirements:**
- Episode openings: Hook within first paragraph
- Episode endings: Cliffhanger or strong forward momentum
- Scene transitions: Each scene ends on curiosity, not resolution

### 2.6) Dialogue & Formatting
```markdown
"Dialogue goes in quotes," Doogan said.
"Action beat." Eddie tapped his tablet. "Continues the dialogue."
*Internal thought in italics.*
```

- No phonetic accents (write dialect through word choice, rhythm)
- Contractions are natural; avoid stiff formal speech
- Subtext > exposition

### 2.7) Tone Guidelines
**See `elements/tone.md` for complete tone and mood guidance.**

Key principles:
- Match the genre, humor style, and stakes defined in tone.md
- Adapt tone to character interactions as specified
- Use the scene checklist in tone.md for validation

### 2.8) Detail Sufficiency Rule

**When implementing scenes:**

- If the outline, prompt, or materials provide specific details → use those details as written
- Only add details when there are gaps critical to scene function (setting transition, character entrance, etc.)
- Default to LESS rather than MORE

**Examples:**

Outline says: "Terry asks 'Are you done?' Jillian says yes, wrong answer."
→ Write exactly that. Don't add camera, hair flipping, gleaming eyes.

Outline says: "They arrive at the country club."
→ You may add: how they entered, basic setting description (minimal)
→ Don't add: weather, emotional states, extended descriptions

**Rule of thumb:** If it's in the source materials, use it. If it's not in the source materials, only add it if the scene breaks without it.

---

## Part 3: Policies

### 3.1) Ambiguity Policy
- Do not guess about high-impact story decisions.
- If critical info is missing, prefer the clarify gate: ask up to 5 targeted questions.
- If you must proceed, list explicit **Assumptions** and keep them minimal.

### 3.2) Internet / External Research Policy
- Default: do not browse the internet.
- Only use external research if the user explicitly asks for it.
- In all cases, the project's local constraints still govern.

### 3.3) Editing Discipline
- Make the smallest change that satisfies the task.
- Avoid "helpful" rewrites outside scope.
- Keep humor, pacing, and character voice consistent; prefer tightening and sharpening over expanding.

---

## Part 4: Context Loading Guide

### For Writing a New Scene:
**Always load (in priority order):**
1. `elements/timeline.md` — Verify scene placement, surrounding events, time gaps
2. `elements/checklist.md` — Hard constraints
3. `elements/pov.md` — POV rules
4. `elements/tone.md` — Tone guidance
5. `voice/style.md` — Voice patterns
6. Relevant character file(s) from `elements/characters/`
7. Current episode outline from `elements/outlines/` (only if beat mechanisms unclear)
8. Prior scenes in episode (if any)

**Load selectively based on timeline references:**
- `events/*.md` — Complex background events (when timeline references them)
- `elements/notes.md` — Procedures, mystery mechanics, continuity questions
- `elements/setting.md` — Location details

**Context Window Strategy:**
- **Timeline is your primary source** — High-level, scannable, all events in order
- **Only load full outlines** if beat mechanisms need clarification from timeline
- **Only load event files** when timeline specifically references them
- **This approach preserves context space** for actual scene writing

**Do NOT load everything** — Focused context = better rule adherence and more context space.

### For Planning an Episode:
- `elements/timeline.md` — All events chronologically for gap analysis
- `elements/outline.md` — Series overview + episode summaries
- Relevant episode outline from `elements/outlines/`

### Task Checkbox Format
When generating `tasks.md`, ALWAYS use:
```
- [ ] **T###: [Task Name]** — [Brief description]
  - **Files/Directories Affected:** [list]
  - **Action:** [what to do]
  - **Acceptance Criteria:** [bullet list]
  - **Dependencies:** [prerequisite tasks]
```

---

## Quick Reference Checklist

**Before writing any scene:**
- [ ] Loaded: timeline.md (verify placement + surrounding events)
- [ ] Loaded: checklist.md, pov.md, tone.md, style.md
- [ ] Loaded: relevant character files from elements/characters/
- [ ] Loaded: relevant event files if timeline references them
- [ ] Loaded: current episode outline ONLY if beat mechanisms unclear from timeline
- [ ] Loaded: prior scenes in episode
- [ ] Verified beat mechanisms (HOW does each thing happen?)
- [ ] Checked character anti-patterns in character files
- [ ] **OUTPUT MANDATORY TIMELINE VERIFICATION (Section 2.3.1) - BLOCKING REQUIREMENT**

**After writing:**
- [ ] POV follows rules in pov.md
- [ ] No scene opens with repeated information (McDonald Rule)
- [ ] No invented details contradict established facts
- [ ] Character voices match their character file patterns
- [ ] Scene has hook → turn → button structure
- [ ] **Timeline updated if scene added new events or missing from timeline**
- [ ] **Timeline verified for contradictions with new details**
