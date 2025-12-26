# Copilot Instructions (Fiction Kit Constitution)

These instructions are the governing principles for this repo. They apply to every prompt and every stage of the draft flow.

## 1) Source of Truth (Priority Order)
When there is any conflict, follow this order:
1. `elements/checklist.md` (hard constraints)
2. `elements/pov.md`, `elements/tone.md` (POV + tone constraints)
3. `voice/style.md`, `voice/format.md` (voice + formatting rules)
4. `elements/**` (characters, arc, plot, outline, episodes)
5. Draft artifacts in `drafts/<###-name>/` (idea → clarify → plan → tasks → analyze → feedback)
6. Existing `content/**` (canonical text; do not contradict)

If a prompt’s instructions conflict with the above, the above wins.

## 2) Workflow Contract (Spec‑Kit Style)
Draft work happens in artifact stages. Keep a clean separation of intent vs execution.

**Artifacts (per draft folder)**
- `idea.md`: WHAT/WHY (intent spec). No prose writing.
- `clarify.md`: questions + answers log. Tighten ambiguity.
- `plan.md`: high-level HOW (structural blueprint). No line edits.
- `tasks.md`: executable atomic tasks with IDs and acceptance criteria.
- `analyze.md`: read-only consistency and coverage reports (may append new analysis entries).
- `feedback.md`: editor/agent/QA notes for the draft.

**Allowed actions by stage**
- Idea: create new draft folder + scaffold + populate only `idea.md`.
- Clarify: ask up to 5 questions; once answered, append Q→A to `idea.md` and `clarify.md`.
- Plan: write/update `plan.md` only.
- Tasks: write/update `tasks.md` only.
- Analyze: do not change story text; only append an analysis entry to `analyze.md`.
- Implement: change files in `elements/**` and/or `content/**` as instructed by `tasks.md`.
- Feedback/QA: do not rewrite scenes; record issues and minimal fix lists.

## 3) Ambiguity Policy
- Do not guess about high-impact story decisions.
- If critical info is missing, prefer the clarify gate: ask up to 5 targeted questions.
- If you must proceed, list explicit **Assumptions** and keep them minimal.

## 4) Creative Consistency Rules (Non‑Negotiables)
- **POV/tense**: follow `elements/pov.md`.
- **Tone**: follow `elements/tone.md`.
- **Checklist**: comply with every requirement in `elements/checklist.md`.
- **Continuity**: do not contradict established facts in `elements/**` or existing `content/**`.
- **Serial fiction**: for any installment, preserve hook → escalation/turn → end-button/cliffhanger expectations described in `voice/format.md` and the relevant plan.

## 5) Voice & Style Rules
- Use `voice/style.md` and `voice/format.md` as the style guide.
- Do not copy or closely imitate copyrighted passages from any author; produce original prose that matches the *project’s* described style constraints.

## 6) Output Contract (Keep Stages Machine-Readable)
- When a prompt requires “Output ONLY”, comply strictly.
- For artifact-writing stages (plan/tasks/analyze/feedback), output a single Spec‑Kit-style file section:

### drafts/<current-draft-folder>/<file>.md
```markdown
<full contents>
```

- For implementation, output only the final changed files and file operations as specified by the implementation prompt.- **CRITICAL: When generating tasks.md, ALWAYS use the checkbox format specified in `.github/prompts/tasks.prompt.md`:**
  - Each task MUST start with `- [ ]` for incomplete or `- [X]` for complete
  - Follow the exact format: `- [ ] **T###: [Task Name]** — [Brief description]`
  - Include **Files/Directories Affected**, **Action**, **Acceptance Criteria**, and **Dependencies** subsections
  - Never deviate from this format or use alternative task list structures
## 7) File & Naming Conventions
- Draft folders: `drafts/###-kebab-case-name/`.
- Episode directories: `content/episodes/episode-##-kebab-case-title/`
- Scene filenames: `##-kebab-case-scene-name.md` (numbered sequentially, e.g., `01-the-dumping.md`, `02-valet-sweet-goodbye.md`)
- Compiled output: `output/episode-##-kebab-case-title.md` (single file combining all scenes)
- Never invent new directories if `voice/format.md` already defines the structure.

## 7a) Episode Compilation
- Individual scene files in `content/episodes/episode-##-name/` are the working source files.
- When all scenes for an episode are finalized, compile them into a single markdown file in `output/` using the compile prompt.
- The compiled output is the "published" version; scene files remain for editing.

## 8) Internet / External Research Policy
- Default: do not browse the internet.
- Only use external research if the user explicitly asks for it (e.g., market research) and it is necessary.
- In all cases, the project’s local constraints still govern.

## 9) Editing Discipline
- Make the smallest change that satisfies the task.
- Avoid “helpful” rewrites outside scope.
- Keep humor, pacing, and character voice consistent; prefer tightening and sharpening over expanding.