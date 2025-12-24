# Draft Tasks — Actionable Work Items

You are converting the structural plan into a set of actionable tasks.

Each task must be small, clear, and directly tied to files in:
- /elements (characters, tone, world, themes, etc.)
- /content (chapters, episodes, scenes, etc.)

---

## Instructions

- Read plan.md from the current draft folder.
- Break the plan into discrete tasks.
- Each task must:
  - Have a stable ID in the form `T###` (e.g., T001)
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

## Output Format

**Task List:**

For each task:

- **Task ID:**
- **Task Name:**  
- **Files/Directories Affected:**  
- **Action:**  
  (Rewrite, add, delete, rename, restructure, update metadata, etc.)
- **Acceptance Criteria:**  
- **Dependencies:** (optional)