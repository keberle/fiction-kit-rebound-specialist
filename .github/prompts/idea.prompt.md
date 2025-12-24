# Draft Idea — Draft Initializer (Spec-Kit Style)

You are initializing a new FictionKit draft cycle.  
This prompt behaves like GitHub’s Spec Kit “spec prompt,” but for story drafts.

Your job is to:
1. Create a new draft folder inside `/drafts/`.
2. Use a numbered naming convention to keep drafts in order:
   - Format: `###-short-name`
   - Example: `001-prologue-rewrite`, `002-add-rival-character`
3. Scaffold the full draft artifact set (Spec-Kit-style feature folder convention) by copying templates from `drafts/_template/`.
4. Populate `idea.md` with a clear, structured summary of the rewrite intent.
5. Leave the other scaffolded files as templates/placeholders to be filled by later prompts.
6. Output the folder name, a list of scaffolded files, and the full contents of `idea.md`.

---

## Folder Naming Rules
- Determine the next draft number by incrementing the highest existing draft folder number.
- Use three digits (`001`, `002`, `003`, …).
- Convert the user’s rewrite idea into a short, kebab-case folder name.
- Combine them: `###-folder-name`.

---

## idea.md Content Requirements
Write a structured summary of the rewrite intent:

- **Intent Summary:** 3–5 sentences describing the rewrite idea.
- **Motivation:** Why this rewrite is needed (story tension, pacing, character arc, clarity, etc.).
- **Scope:** Which characters, events, scenes, or files may be affected.
- **Desired Outcome:** What the rewrite should achieve.

Do NOT propose solutions or rewrite content.  
This file is only the specification of intent.

---

## Draft Folder Scaffold (must create)
Create these files in the new draft folder by copying from `drafts/_template/`:
- `idea.md`
- `clarify.md`
- `plan.md`
- `tasks.md`
- `analyze.md`
- `feedback.md`

Then replace the placeholders in the new folder’s `idea.md` with the specific intent for this draft.

---

## Output Format
Output ONLY the following, in order:

1) `draft_folder_name: <###-short-name>`
2) `scaffolded_files:` then a bullet list of files created in the new draft folder
3) A Spec-Kit-style file section for the populated idea:

### drafts/<draft_folder_name>/idea.md
```markdown
<full contents>
```

Example:
---
draft_folder_name: 003-tighten-chapter-2
scaffolded_files:
- drafts/003-tighten-chapter-2/idea.md
- drafts/003-tighten-chapter-2/clarify.md
- drafts/003-tighten-chapter-2/plan.md
- drafts/003-tighten-chapter-2/tasks.md
- drafts/003-tighten-chapter-2/analyze.md
- drafts/003-tighten-chapter-2/feedback.md

### drafts/003-tighten-chapter-2/idea.md
```markdown
<markdown content here>
```

---

## Notes for Downstream Prompts
- All subsequent draft-flow prompts (plan → tasks → implement → feedback) will operate inside this new draft folder.
- They will reference `idea.md` as the authoritative source of rewrite intent.