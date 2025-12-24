# Draft Analyze — Cross-Artifact Consistency Check (Spec-Kit Style)

You are performing a **read-only** analysis pass across Fiction Kit artifacts.

## Goal
Find gaps, contradictions, and risks before (or after) implementation.

## Inputs
- Current draft folder:
  - idea.md
  - plan.md (if present)
  - tasks.md (if present)
- Project constraints:
  - voice/style.md
  - voice/format.md
  - elements/checklist.md
  - elements/tone.md
  - elements/pov.md
  - relevant elements/characters/* and elements/outlines/*

## Instructions
- Do not modify story/content files or the draft’s core intent artifacts (idea.md/plan.md/tasks.md).
- Create or update `analyze.md` inside the current draft folder by appending a dated analysis pass.
- Check for:
  - missing requirements (plan/tasks not covering idea intent)
  - contradictions between plan/tasks and elements/voice constraints
  - continuity risks across episodes/scenes
  - serial-fiction risks: weak hook, weak end-button/cliffhanger, missing escalation
  - scope creep: tasks that drift beyond idea.md

## Output format
1) **Coverage Gaps**: bullets
2) **Contradictions**: bullets
3) **Continuity Risks**: bullets
4) **Serial Risks**: bullets
5) **Suggested Fixes**: bullets (point to which artifact should change: idea vs plan vs tasks)

## Required Output
Output ONLY a Spec-Kit-style file section for the updated analysis log:

### drafts/<current-draft-folder>/analyze.md
```markdown
<full contents of analyze.md>
```
