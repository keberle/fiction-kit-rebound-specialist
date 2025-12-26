# Draft Tasks — Actionable Work Items

You are converting the structural plan into a set of actionable tasks with checkbox tracking.

Each task must be small, clear, and directly tied to files in:
- /elements (characters, tone, world, themes, etc.)
- /content (chapters, episodes, scenes, etc.)

---

## Instructions

- Read plan.md from the current draft folder.
- Break the plan into discrete tasks with checkbox format.
- Each task must:
  - Have a stable ID in the form `T###` (e.g., T001)
  - Use checkbox format: `- [ ]` for incomplete, `- [X]` for complete
  - Reference specific files or directories
  - Describe the exact change required
  - Include acceptance criteria
  - Indicate whether it affects elements, content, or both
- Include tasks for:
  - Creating new files
  - Renaming files or directories
  - Deleting files or directories
  - Updating existing files
- Keep tasks atomic and traceable.
- Include at least one **QA task** at the end to verify continuity + checklist compliance across all touched scenes/files.

## File Output
- Create or update `tasks.md` inside the current draft folder.
- Output ONLY a Spec-Kit-style file section for the updated tasks:

### drafts/<current-draft-folder>/tasks.md
```markdown
<full contents of tasks.md>
```

---

## Checkbox Task Format

**REQUIRED Format:**
```text
- [ ] **T###: [Task Name]** — [Brief description]
  - **Files/Directories Affected:** [list]
  - **Action:** [what to do]
  - **Acceptance Criteria:** [bullet list of requirements]
  - **Dependencies:** [prerequisite tasks]
```

**Examples:**
```text
- [ ] **T001: Setup Episode Structure** — Create episode file and metadata
  - **Files/Directories Affected:** `content/episodes/episode-01-title.md`
  - **Action:** Create new file with episode metadata header
  - **Acceptance Criteria:**
    - File created with proper title, episode number, and status
    - Metadata includes theme and target word count
  - **Dependencies:** None

- [X] **T002: Write Opening Scene** — Draft the prologue scene
  - **Files/Directories Affected:** `content/episodes/episode-01-title.md`
  - **Action:** Add scene content (400-600 words)
  - **Acceptance Criteria:**
    - Scene establishes premise and character
    - POV and tone guidelines followed
    - Dialogue-driven as specified
  - **Dependencies:** T001
```

## Task Summary Table

Include a summary table showing:
```text
| Task ID | Task Name | Type | Status | Dependencies |
|---------|-----------|------|---------|--------------|
| T001 | Setup | Setup | ⏳ Pending | None |
| T002 | Scene 1 | Draft | ✅ Complete | T001 |
| T003 | Scene 2 | Draft | ⏳ Pending | T002 |
```

**Status Icons:**
- ✅ Complete (task marked `[X]`)
- ⏳ Pending (task marked `[ ]`)
- 🚫 Blocked (dependencies incomplete)
---

## Next Step in Workflow

After completing tasks.md, the next step is to execute the tasks:

**Use `.github/prompts/implement.prompt.md` to systematically execute each task in dependency order.**

**REMINDER:** All tasks MUST use checkbox format (`- [ ]` / `- [X]`) as specified above. Never use alternative formats like bold headers or numbered lists for tasks.
