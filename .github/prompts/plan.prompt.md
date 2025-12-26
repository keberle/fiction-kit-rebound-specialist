# Draft Plan — Structural Blueprint

You are generating the structural plan for this draft cycle.

Your job is to translate the rewrite intent in idea.md into a clear, actionable plan that covers:
1. Changes to **elements** (characters, tone, world, themes, episode flow, etc.)
2. Changes to **content** (chapters, episodes, scenes, or other format-defined units)
3. Changes to **structure** (ordering, pacing, escalation, POV distribution)
4. Changes to **directories or files** inside /content based on the format.md structure

---

## Instructions

- Read idea.md from the current draft folder.
- Read voice/format.md to respect the serial-fiction file structure and formatting constraints.
- Read elements/checklist.md, elements/tone.md, and elements/pov.md for non-negotiables.
- Identify all elements that must change:
  - Characters (motivation, arc, relationships)
  - Tone or voice adjustments
  - Episode/chapter flow
  - Worldbuilding or setting details
  - Themes or motifs
- Identify all content changes:
  - Scenes to rewrite, remove, expand, or add
  - Chapters/episodes to restructure
  - New files or directories required
  - Files or directories to rename or delete
- Respect the voice/format.md structure (serial fiction, novel, screenplay, etc.)
- Provide a high-level plan, not line edits.

## File Output
- Create or update `plan.md` inside the current draft folder.
- Output ONLY a Spec-Kit-style file section for the updated plan:

### drafts/<current-draft-folder>/plan.md
```markdown
<full contents of plan.md>
```

### Clarification Gate (Spec-Kit style)
- If idea.md is missing critical details needed to plan safely, output an **Open Questions** section (max 5 questions) and make minimal assumptions.
- Mark each assumption explicitly under **Assumptions**.

---

## Output Format

- **Element Changes:**  
  List structural changes to characters, tone, world, themes, etc.

- **Content Changes:**  
  List changes to chapters/episodes/scenes, including file-level operations.

- **Directory Changes:**  
  Describe new folders, renamed folders, or removed folders inside /content.

- **Sequence of Work:**  
  A step-by-step order for how these changes should be executed.

- **Dependencies:**  
  What must happen before other steps can proceed.

- **Serial Episode Beats (if applicable):**
  For each affected episode/installment, note: hook, escalation/turn, and end-button (hook or cliffhanger) requirements.

- **Open Questions:**
  Up to 5 high-impact clarifying questions.

- **Assumptions:**
  A bullet list of any assumptions made to complete the plan.
---

## Next Step in Workflow

After completing plan.md, the next step is to generate actionable tasks:

**Use `.github/prompts/tasks.prompt.md` to convert this plan into specific, executable tasks with checkbox tracking.**
