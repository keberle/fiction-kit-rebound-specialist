# Draft Clarify — Questions Before Planning (Spec-Kit Style)

You are running the **clarification gate** for a Fiction Kit draft cycle.

## Goal
Reduce ambiguity before planning or writing by asking a small set of high-impact questions.

## Inputs to consider
- Current draft folder: `idea.md`
- Project constraints (when available):
  - voice/style.md
  - voice/format.md
  - elements/checklist.md
  - elements/tone.md
  - elements/pov.md
  - elements/outline.md
  - relevant elements/outline/* and elements/characters/*

## Instructions
- Read the current draft folder’s idea.md.
- Use the current draft folder’s clarify.md as the log for this step.
- Identify missing details that would materially change the plan or the writing.
- Ask **up to 5** questions (ask fewer if possible).
- Questions must be:
  - specific (not generic)
  - actionable (the author can answer quickly)
  - prioritized (most important first)
- Do not propose solutions or write prose.

### What to clarify (use these as a checklist)
Only ask what is actually missing.

1) **Target & scope**
- Which episode/installment(s) or scene file(s) are affected?
- Is this a local polish pass, a structural rewrite, or a new-scene insertion?

2) **Intended outcome**
- What should feel different to the reader (pacing, tension, comedy, empathy, clarity)?
- What is the “done” signal (acceptance criteria)?

3) **Non-negotiables / no-go zones**
- Any constraints beyond elements/checklist.md (e.g., keep a specific reveal for later; preserve a beat)?

4) **Continuity-sensitive details**
- Time/setting and who is present.
- Any established facts that must not be contradicted.

5) **Serial beat requirements (when relevant)**
- Hook at the top, escalation/turn, and end-button/cliffhanger expectations.

### Recording answers (Spec Kit behavior)
After the user answers the questions:
- Update the same draft’s `idea.md` by appending a **Clarifications** section.
- Include the date (YYYY-MM-DD) and the Q→A pairs.
- Do not modify earlier sections of idea.md unless the user explicitly asks.
- Also append the Q→A pairs to the draft’s `clarify.md` under the same date.

## Output format
Output ONLY one of the following:

### Option A: questions needed
**Clarifying Questions**
1. …
2. …
3. …
4. …
5. …

### Option A2: questions answered (file updates)
If the user’s answers are provided in the current context, output ONLY the updated files as Spec-Kit-style file sections:

### drafts/<current-draft-folder>/idea.md
```markdown
<full contents with appended Clarifications section>
```

### drafts/<current-draft-folder>/clarify.md
```markdown
<full contents with appended Q→A log>
```

### Option B: no questions needed
**No Clarifications Needed**
- 1–3 bullets explaining what is sufficiently specified.
