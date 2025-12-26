# Agent Skills Recommendations for Fiction Kit

**Date:** 2025-12-25  
**Based on:** [Agent Skills Specification](https://agentskills.io) | [GitHub Copilot Documentation](https://docs.github.com/en/copilot/concepts/agents/about-agent-skills) | [Anthropic Skills Repository](https://github.com/anthropics/skills)

---

## Executive Summary

Agent Skills are self-contained folders with instructions and bundled resources that AI agents load on-demand. This document recommends implementing **6 core skills** for the Fiction Kit repository using the open [Agent Skills specification](https://agentskills.io).

**Key Benefits:**
- ✅ **Auto-discovery**: AI loads skills when task description matches (no manual `@# prompt` reference needed)
- ✅ **Bundled resources**: Scripts, templates, examples packaged with instructions
- ✅ **Validation**: Executable Python scripts enforce quality standards
- ✅ **Portability**: Works across GitHub Copilot, Copilot CLI, VS Code Insiders
- ✅ **Progressive disclosure**: Only loads context when needed (metadata → body → resources)

---

## What Are Agent Skills?

Agent Skills follow the [Agent Skills specification](https://agentskills.io) - an open standard created by Anthropic and supported by GitHub Copilot.

### Directory Structure

```
.github/skills/           # Standard location for GitHub Copilot
├── draft-initialization/
│   ├── SKILL.md          # Required: YAML frontmatter + instructions
│   ├── scripts/          # Optional: Executable helper scripts
│   ├── references/       # Optional: Docs loaded to context as needed
│   └── assets/           # Optional: Templates used in output (NOT loaded to context)
├── scene-writing/
│   ├── SKILL.md
│   ├── references/
│   │   └── craft-principles.md
│   └── assets/
│       └── scene-template.md
└── character-management/
    ├── SKILL.md
    └── scripts/
        └── validate_consistency.py
```

### SKILL.md Format

Every skill folder must contain a `SKILL.md` file with YAML frontmatter and markdown instructions:

```markdown
---
name: skill-name
description: Comprehensive description of what the skill does AND when to use it. Include specific triggers, file types, scenarios. This is the PRIMARY triggering mechanism.
---

# Skill Title

Brief overview (1-2 sentences).

## When to Use This Skill

List specific scenarios when this skill should be used.

## Core Guidelines

1. **Guideline 1** - Explanation
2. **Guideline 2** - Explanation

## Workflows

### Workflow: [Name]
Step-by-step instructions...

## Examples

### Example 1: [Use Case]
\`\`\`language
// Example code or pattern
\`\`\`
```

**Critical**: The `description` field is how the AI decides when to load the skill. Be comprehensive about:
- What the skill does
- **When** to use it (triggers/scenarios/file types)
- What problems it solves

### Progressive Disclosure (Three-Level Loading)

Based on Anthropic's [progressive disclosure pattern](https://github.com/anthropics/skills/blob/main/skills/skill-creator/SKILL.md#L115-L122):

1. **Metadata** (~100 words, always in context)
   - `name` + `description` from YAML frontmatter
   - AI uses this to decide whether to load the skill

2. **SKILL.md body** (<5k words, loaded when skill triggers)
   - Main instructions, workflows, examples
   - Only loaded if description matches task

3. **Bundled resources** (loaded as needed or executed without context)
   - **Scripts** (`scripts/`): Python/Bash executed directly, may be patched but not fully loaded
   - **References** (`references/`): Docs loaded into context when mentioned in SKILL.md
   - **Assets** (`assets/`): Files used in output (templates, boilerplate) - never loaded to context

---

## Comparison: Skills vs. Current Prompts

| Feature | Current `.github/prompts/` | Agent Skills |
|---------|---------------------------|--------------|
| **Discovery** | Manual `@# prompts/name` | Auto-loaded via description |
| **Bundled Resources** | Instructions only | Scripts + references + assets |
| **Validation** | Manual review | Executable `.py` scripts |
| **Portability** | VS Code Copilot only | GitHub Copilot + CLI + VS Code Insiders |
| **Standard** | Repo-specific | [Open standard](https://agentskills.io) |
| **Context Loading** | Full content loaded | Progressive (metadata → body → resources) |
| **Executables** | None | Scripts run without loading to context |

---

## Recommended Skills (6 Total)

| # | Skill Name | Replaces Prompts | New Capability |
|---|-----------|------------------|----------------|
| 1 | draft-initialization | idea, clarify, plan, tasks | Validation scripts |
| 2 | scene-writing | addscene, editscene | Bundled references |
| 3 | character-management | *(none)* | ✅ NEW |
| 4 | draft-validation | qa | Validation scripts |
| 5 | episode-compilation | compile-episode | Validation scripts |
| 6 | continuity-checking | *(none)* | ✅ NEW |

---

## Skill 1: draft-initialization

**Replaces:** `idea.prompt.md`, `clarify.prompt.md`, `plan.prompt.md`, `tasks.prompt.md`

### SKILL.md

````markdown
---
name: draft-initialization
description: Initialize fiction draft cycles following the Spec-Kit workflow (idea → clarify → plan → tasks). Use when creating new drafts, planning rewrites, breaking down episodes, or structuring story changes. Triggers include requests like "create draft", "new draft folder", "plan episode", "rewrite breakdown", "draft tasks".
---

# Draft Initialization

Initialize a new fiction draft cycle following the Fiction Kit's Spec-Kit-style workflow.

## When to Use This Skill

Use this skill when you need to:
- Create a new draft folder and artifacts
- Break down a rewrite or story change into structured tasks
- Plan an episode from outline to execution
- Generate checkbox tasks from a high-level plan

## Workflow Stages

A complete draft follows this sequence:

1. **Idea** (`idea.md`) - Capture rewrite intent (WHAT/WHY)
2. **Clarify** (`clarify.md`) - Ask up to 5 questions to reduce ambiguity
3. **Plan** (`plan.md`) - Create structural blueprint (HOW)
4. **Tasks** (`tasks.md`) - Generate actionable checkbox tasks with acceptance criteria

## Stage 1: Create Draft Folder

Determine the next draft number and create folder structure:

```bash
drafts/###-kebab-case-name/
├── idea.md
├── clarify.md
├── plan.md
├── tasks.md
├── analyze.md
└── feedback.md
```

## Stage 2: Populate idea.md

Write structured intent summary with these required sections:

### Required Sections
- **Intent Summary** (3-5 sentences: WHAT needs to change and WHY)
- **Motivation** (Why this change is needed now)
- **Scope** (Which episodes/scenes/files/characters affected)
- **Desired Outcome** (What success looks like)

### Critical Rules
- Do NOT propose solutions or write prose
- This is specification only, not implementation
- Stay focused on user's original intent
- If user provides vague request, ask for specifics before writing

### Example idea.md
```markdown
# Draft Idea

**Intent Summary:** Tighten Act 2 pacing in episode 3 by compressing the investigation montage from 4 scenes to 2 scenes. Currently the middle drags and reader interest drops.

**Motivation:** Beta feedback indicates Act 2 loses momentum. Scenes 8-11 feel repetitive and the investigation stalls visually. Need faster escalation to the reveal in scene 15.

**Scope:**
- Episode 3, scenes 8-11 (investigation montage)
- May affect: Eddie's character arc (less screen time), Baxter's methods
- Files: `content/episodes/episode-03-*.md` scenes 8-11

**Desired Outcome:**
- Act 2 maintains reader engagement
- Investigation escalates more rapidly
- Scene count reduced by 2 without losing critical discoveries
- Baxter's competence still established but more efficiently
```

## Stage 3: Run Clarification Gate

Read `idea.md` and identify missing details that would materially change the plan.

**Ask up to 5 questions (prioritized):**
1. Target & scope (which episodes/scenes exactly?)
2. Intended outcome (what should feel different?)
3. Non-negotiables (constraints beyond checklist?)
4. Continuity details (time/place/who's present?)
5. Serial beat requirements (hook/turn/cliffhanger needs?)

### After User Answers
- Append "Clarifications" section to `idea.md` with date + Q→A pairs
- Also log in `clarify.md` for reference

### If No Questions Needed
State what is sufficiently specified (1-3 bullets).

## Stage 4: Generate Plan

Read `idea.md` (including clarifications) and create `plan.md`.

### Required Plan Sections

1. **Element Changes**
   - Which elements files need updates? (`characters/`, `plot.md`, `outline.md`, etc.)
   - What specific changes to each?

2. **Content Changes**
   - Scenes to add/edit/delete/reorder
   - Episode structure modifications

3. **Directory Changes**
   - Folders to create/rename/delete in `content/`
   - File renaming/numbering changes

4. **Sequence of Work**
   - Step-by-step execution order
   - What must happen first, second, etc.

5. **Dependencies**
   - What requires what (e.g., "character file update before scene edit")

6. **Serial Episode Beats** (if applicable)
   - Hook placement
   - Escalation/turn timing
   - End-button or cliffhanger strategy

### Constraints to Check

**BEFORE writing plan, read:**
- `voice/format.md` - File structure and serial fiction rules
- `elements/checklist.md` - Non-negotiable requirements
- `elements/tone.md` - Tone constraints
- `elements/pov.md` - POV rules

### Output Format

Output ONLY the plan content as markdown ready to save:

```markdown
# Plan

[Full plan content with all required sections]
```

## Stage 5: Generate Tasks

Convert `plan.md` into actionable checkbox tasks in `tasks.md`.

### Task Format (CRITICAL)

**EVERY task must use this exact format:**

```markdown
- [ ] **T###: [Task Name]** — [Brief description]
  - **Files/Directories Affected:** [Specific paths]
  - **Action:** [What to do]
  - **Acceptance Criteria:**
    - [ ] Criterion 1
    - [ ] Criterion 2
  - **Dependencies:** [Task IDs that must complete first, or "None"]
```

### Task Numbering
- Sequential IDs: T001, T002, T003, etc.
- Setup tasks first (T001: scaffold folders)
- Content tasks middle (scenes/episodes)
- QA/validation tasks last (T020+: continuity check, compile)

### Task Categories

**Setup Tasks (T001-T003)**
- Create directories
- Scaffold files
- Update elements

**Content Tasks (T004-T0XX)**
- One task per scene/chapter
- Edit existing content
- Reorder scenes

**QA Tasks (Final 3-5)**
- Validate against checklist
- Run continuity check
- Compile episode (if applicable)

### Example tasks.md

```markdown
# Tasks

- [ ] **T001: Setup Episode Directory** — Create episode folder structure
  - **Files/Directories Affected:** `content/episodes/episode-03-investigation/`
  - **Action:** Create directory with proper naming convention
  - **Acceptance Criteria:**
    - [ ] Directory named `episode-03-investigation`
    - [ ] Directory exists at correct path
  - **Dependencies:** None

- [ ] **T002: Draft Scene 08 — Baxter Montage** — Write compressed investigation scene
  - **Files/Directories Affected:** `content/episodes/episode-03-investigation/08-baxter-montage.md`
  - **Action:** Write new scene combining beats from old scenes 8-9
  - **Acceptance Criteria:**
    - [ ] Scene opens mid-action (McDonald rule)
    - [ ] Baxter's competence established
    - [ ] Key discoveries included
    - [ ] Word count 1200-1500
  - **Dependencies:** T001

- [ ] **T020: Validate Episode Against Checklist** — QA pass
  - **Files/Directories Affected:** `elements/checklist.md`, all episode scenes
  - **Action:** Run validation script or manual check
  - **Acceptance Criteria:**
    - [ ] All checklist items verified
    - [ ] No POV violations
    - [ ] McDonald rule compliance
  - **Dependencies:** T002-T019
```

## Validation

After generating any artifact, validate:

- [ ] Draft folder uses naming: `###-kebab-case`
- [ ] All template files scaffolded
- [ ] idea.md has all required sections
- [ ] Clarifications logged if questions asked
- [ ] plan.md references constraint files
- [ ] tasks.md uses checkbox format (`- [ ]`)
- [ ] Task IDs sequential (T001, T002, ...)
- [ ] Each task has acceptance criteria
- [ ] Dependencies correctly specified

## Output Format

For each stage, output ONLY a single file section:

```markdown
### drafts/<draft-folder>/<file>.md
\`\`\`markdown
[full file contents]
\`\`\`
```

## Next Step

After `tasks.md` is complete, tasks can be executed. Use **scene-writing** skill for prose drafting and **draft-validation** skill for QA.
````

### scripts/validate_draft.py

```python
#!/usr/bin/env python3
"""Validate draft folder structure and artifacts"""

import re
import sys
from pathlib import Path
from typing import List

def validate_folder_name(folder_path: Path) -> List[str]:
    """Check draft folder naming convention"""
    errors = []
    
    if not re.match(r'^\d{3}-[a-z0-9-]+$', folder_path.name):
        errors.append(f"Invalid folder name: {folder_path.name} (should be ###-kebab-case)")
    
    return errors

def validate_required_files(folder_path: Path) -> List[str]:
    """Check all required files exist"""
    required = ['idea.md', 'clarify.md', 'plan.md', 'tasks.md', 'analyze.md', 'feedback.md']
    errors = []
    
    for filename in required:
        if not (folder_path / filename).exists():
            errors.append(f"Missing required file: {filename}")
    
    return errors

def validate_idea(idea_path: Path) -> List[str]:
    """Check idea.md has required sections"""
    required = ['Intent Summary', 'Motivation', 'Scope', 'Desired Outcome']
    content = idea_path.read_text()
    errors = []
    
    for section in required:
        if f"**{section}" not in content and f"## {section}" not in content:
            errors.append(f"Missing required section in idea.md: {section}")
    
    # Check for solution proposals (anti-pattern)
    if re.search(r'(we should|I will|rewrite|change)\s', content, re.IGNORECASE):
        errors.append("Warning: idea.md may contain solution proposals (should be intent only)")
    
    return errors

def validate_tasks(tasks_path: Path) -> List[str]:
    """Check tasks.md uses checkbox format"""
    content = tasks_path.read_text()
    errors = []
    
    # Check for checkbox format
    if '- [ ]' not in content and '- [X]' not in content and '- [x]' not in content:
        errors.append("tasks.md does not use checkbox format (- [ ] or - [X])")
    
    # Check for task IDs
    task_ids = re.findall(r'\*\*T(\d{3})', content)
    if task_ids:
        # Verify sequential
        for i, tid in enumerate(sorted(task_ids), 1):
            expected = f"{i:03d}"
            if tid != expected:
                errors.append(f"Task ID gap or misordering: found T{tid}, expected T{expected}")
    else:
        errors.append("No task IDs found (should use **T###: format)")
    
    return errors

if __name__ == '__main__':
    if len(sys.argv) < 2:
        print("Usage: validate_draft.py <draft-folder-path>")
        sys.exit(1)
    
    draft_path = Path(sys.argv[1])
    
    if not draft_path.exists() or not draft_path.is_dir():
        print(f"❌ Error: Path is not a directory: {draft_path}")
        sys.exit(1)
    
    all_errors = []
    all_errors.extend(validate_folder_name(draft_path))
    all_errors.extend(validate_required_files(draft_path))
    
    idea_file = draft_path / 'idea.md'
    if idea_file.exists():
        all_errors.extend(validate_idea(idea_file))
    
    tasks_file = draft_path / 'tasks.md'
    if tasks_file.exists():
        all_errors.extend(validate_tasks(tasks_file))
    
    if all_errors:
        print(f"❌ Validation errors in {draft_path.name}:")
        for error in all_errors:
            print(f"  - {error}")
        sys.exit(1)
    else:
        print(f"✅ Draft {draft_path.name} passes validation")
        sys.exit(0)
```

---

## Skill 2: scene-writing

**Replaces:** `addscene.prompt.md`, `editscene.prompt.md`

### SKILL.md

````markdown
---
name: scene-writing
description: Write fiction scenes following Stephen King principles and the McDonald opening rule. Use when drafting new scenes, editing existing prose, or writing chapters. Triggers include "write scene", "draft scene", "edit scene", "new chapter", "prose writing". Ensures POV discipline, character voice consistency, and craft quality.
---

# Scene Writing

Write fiction scenes following Fiction Kit voice, style, and craft principles (Stephen King methods + McDonald opening rule).

## When to Use This Skill

Use this skill when you need to:
- Draft a new scene from scratch
- Edit existing scene prose
- Rewrite a scene for pacing or voice
- Add a missing scene to an episode

## Pre-Writing Checklist (MANDATORY)

**BEFORE writing ANY prose, complete these steps:**

### 1. Load Character Files

- Read ALL relevant files from `elements/characters/<name>.md`
- Review physical traits, voice patterns, mannerisms, relationships
- Use ONLY canonical information—never invent details

### 2. Load Constraint Files

- `elements/pov.md` - POV rules (third-person close, one per scene)
- `elements/tone.md` - Tone requirements
- `elements/checklist.md` - Non-negotiable quality standards
- `voice/style.md` - Voice patterns and prose style
- `voice/format.md` - Format structure (episodes, scenes, etc.)

### 3. Check Scene Context

- What happened immediately before this scene?
- Who is present?
- What is the POV character's emotional state?
- What information does POV character know at this point?

## McDonald Opening Rule (NON-NEGOTIABLE)

From references/mcdonald-rule.md:

**NEVER open with:**
- ❌ Weather descriptions
- ❌ Atmospheric scene-setting
- ❌ Introspection before dialogue
- ❌ Character arriving at location

**ALWAYS open with:**
- ✅ Dialogue mid-progress
- ✅ Action already in motion
- ✅ Eavesdropper test: reader overhears conversation in progress

**Test:** Could an eavesdropper understand what's happening without needing narrator exposition first?

### Examples

**❌ BAD:**
```
Rain drummed against the windows of Eddie's kitchen. Doogan felt exhausted after the interrogation.
```

**✅ GOOD:**
```
"—so Hank costs money, obviously, guy's a lawyer even if he's a bottom-tier one—"
```

**✅ GOOD:**
```
Doogan caught the glass before it hit the floor.
```

## Stephen King Principles

See `references/king-principles.md` for deep-dive. Key rules:

1. **Discovery-Driven**
   - Character action drives plot (not convenience)
   - Every scene opens/closes doors
   - Discoveries feel earned, not handed

2. **Sensory Detail**
   - One specific sensory detail per scene beat
   - Make it unique to the moment (not generic)
   - Ground reader in physical reality

3. **Emotional Truth**
   - Character behavior must be honest
   - No plot-convenient decisions
   - Motivation always clear

4. **Cut 10-20%**
   - First draft is too long
   - Remove adverbs aggressively
   - Strengthen verbs instead

## POV Discipline (CRITICAL)

**This project uses third-person close, one POV per scene.**

- Reader knows ONLY what POV character knows
- No head-hopping (switching POV mid-scene)
- No omniscient narrator intrusions
- Off-screen events delivered indirectly (briefing, document, report)

**Fletch Rule:** Reader learns when protagonist learns.

## Character Voice Patterns

**Doogan Andrews:**
- Measured drawl
- Short responses
- Dry humor
- Observant, not chatty

**Eddie Palmer:**
- Motor-mouth avalanche
- Mid-sentence starts with em-dashes
- Tangents that circle back
- Nervous energy

**Abby Palmer:**
- Elevated vocabulary
- Sharp, pragmatic
- No yoga pants / messy home clichés
- Confident, competent

**Martinez:**
- Deadpan delivery
- Dry wit
- Principled, married high school sweetheart
- Doesn't understand Doogan's world

## Dialogue Formatting

**Max 3 untagged lines** in 2-person dialogue:

```markdown
"First line," Doogan said.
"Response."
"Follow-up."
"Final response," Eddie said.
```

After 3 lines, re-tag speaker.

## Scene Structure

1. **Opening** (McDonald rule compliance)
2. **Escalation** (tension increases or discovery occurs)
3. **Turn** (something shifts—information, emotion, decision)
4. **Button** (scene ending that propels to next scene)

## Output Format

Output ONLY the scene content as markdown:

```markdown
## Scene [Number] — [Title]

[Scene content here]

---
```

## Validation Checklist

After writing, verify:

- [ ] McDonald opening (no weather/introspection first)
- [ ] POV maintained throughout (no head-hopping)
- [ ] Character voices accurate (reviewed character files)
- [ ] Sensory details present (specific, not generic)
- [ ] Emotional truth (behavior feels honest)
- [ ] Scene opens/closes doors (discovery momentum)
- [ ] Scene break marker `---` at end

## Next Step

After drafting, use **draft-validation** skill to check against full checklist.
````

### references/mcdonald-rule.md

```markdown
# McDonald Opening Rule

The McDonald opening rule (attributed to Ross McDonald) requires scenes to open **in medias res** - in the middle of action or dialogue.

## The Rule

Start your scene as if the reader is **eavesdropping** on a conversation or event already in progress.

## Why It Works

1. **Immediate engagement** - Reader is pulled into action instantly
2. **No setup drag** - Avoids slow weather/scene-setting exposition
3. **Trust the reader** - They'll figure out context from dialogue/action
4. **Cinematic** - Mimics how scenes start in film

## What NOT to Do

❌ **Weather/Atmosphere:**
```
The rain pounded against the window. Dark clouds gathered over the city.
```

❌ **Introspection First:**
```
Doogan was tired. The interrogation had drained him.
```

❌ **Scene-Setting:**
```
The coffee shop sat on the corner of Fifth and Main, a small establishment with large windows.
```

❌ **Arrival:**
```
Doogan walked into Eddie's kitchen and sat down at the table.
```

## What TO Do

✅ **Mid-Dialogue:**
```
"—so Hank costs money, obviously, guy's a lawyer even if he's a bottom-tier one—"
```

✅ **Mid-Action:**
```
Doogan caught the glass before it hit the floor.
```

✅ **Eavesdropper Test Passes:**
```
"Did you follow her?"
"What? No. Why would I—"
"Because she just walked out with evidence."
```

## The Eavesdropper Test

**Ask yourself:** If someone started listening to this scene right now, would they understand what's happening without needing a narrator to explain first?

- ✅ YES: Good opening
- ❌ NO: Need to cut earlier and start later

## When to Break This Rule

**Almost never.** If you think you need to break it, you probably don't. Start later in the scene.

**Rare exception:** A single-sentence opening action before dialogue, IF it's critical setup:

```markdown
The phone rang at 3 AM.
"Martinez," Doogan said.
```

But even this could be improved:
```markdown
"Martinez," Doogan said into the phone. Three in the morning.
```

## Common Mistakes

### Mistake 1: "Just a little setup"
```
It had been three days since the interrogation. Doogan needed answers.

"Eddie, we have to—"
```

**Fix:** Cut the setup. Start with dialogue.

### Mistake 2: "Reader needs context"
```
The farmer's market buzzed with Sunday morning shoppers. Doogan scanned the crowd for Abby.

"Over here!" she called.
```

**Fix:** Trust the reader. They'll get context from dialogue.
```
"Over here!" Abby waved from the produce stand.
```

### Mistake 3: "This is important mood"
```
The interrogation room was cold and sterile, designed to make suspects uncomfortable.

"Where were you Friday night?" Martinez asked.
```

**Fix:** Weave mood into action/dialogue.
```
"Where were you Friday night?" Martinez leaned back in the metal chair, the cold fluorescent light washing him out.
```

## Practice Exercise

Take any scene opening with setup/atmosphere/introspection and cut the first paragraph. Start with the second paragraph. Does it work better? Usually yes.
```

### references/king-principles.md

```markdown
# Stephen King Principles for Fiction

Derived from *On Writing* and observable patterns in King's work.

## 1. Discovery-Driven Writing

**"Story is honorable and trustworthy; plot is shifty."**

### What It Means
- Let characters make decisions based on who they are, not what the plot needs
- Discover the story as you write (even with an outline)
- Every scene should open/close doors naturally

### Application to Fiction Kit
- Characters drive plot, not vice versa
- No plot-convenient coincidences
- Discoveries feel earned through character action

### Example
**❌ Plot-Driven:**
```
Doogan happened to overhear the conversation because he was conveniently in the right place at the right time.
```

**✅ Character-Driven:**
```
Doogan waited outside the courthouse because Martinez always left through the side door. Patience paid off.
```

## 2. Sensory Detail

**"Good description is learned skill, not gift."**

### The Rule
- One specific sensory detail per major scene beat
- Make it unique to THIS moment (not generic)
- Avoid clichés

### Examples

**❌ Generic:**
```
The coffee was hot and bitter.
```

**✅ Specific:**
```
The coffee tasted burnt, like Eddie had left the pot on for three hours. Probably had.
```

**❌ Cliché:**
```
Her eyes were cold as ice.
```

**✅ Unique:**
```
She looked at him like he was a math problem she'd already solved.
```

## 3. Emotional Truth

**"Fiction is the truth inside the lie."**

### What It Means
- Character behavior must be psychologically honest
- Even in genre fiction, emotions must feel real
- Don't let characters do things "because the story needs it"

### Red Flags
- Character suddenly acts out of character
- Emotional reactions feel convenient
- Dialogue doesn't match established voice

### Fix
Ask: "Would this person REALLY do/say this, given what we know about them?"

## 4. Dialogue Drives Pace

**"Dialogue is what characters do to each other."**

### Rules
- Dialogue is action, not just information exchange
- Subtext > text (what's NOT said matters)
- Every line should reveal character or advance plot (ideally both)

### Example

**❌ Information Dump:**
```
"As you know, Bob, we've been partners for five years and you've always been reliable, which is why I'm concerned about this case."
```

**✅ Action/Subtext:**
```
"Five years, Eddie."
"I know."
"Then you know I don't ask twice."
```

## 5. Cut 10-20%

**"Kill your darlings, even when it breaks your egocentric little scribbler's heart."**

### What to Cut
1. **Adverbs** (especially dialogue tags)
   - ❌ "she said angrily"
   - ✅ "she said" (let dialogue convey anger)

2. **Redundancies**
   - ❌ "He nodded his head in agreement"
   - ✅ "He nodded"

3. **Throat-clearing**
   - ❌ "She started to think about what to say"
   - ✅ Just show her thinking/speaking

4. **Over-explanation**
   - ❌ Explaining what the dialogue already conveyed
   - ✅ Trust the reader

### Process
- First draft: write freely, over-describe
- Second draft: cut 10-20%
- Strengthen verbs instead of adding adverbs

## 6. Show State of Mind Through Action

**"The most important things are the hardest to say."**

### Instead of Telling Emotion
Show through:
- Body language
- Dialogue cadence
- Environmental interaction
- What character notices

### Examples

**❌ Telling:**
```
Doogan was nervous about the meeting.
```

**✅ Showing:**
```
Doogan checked his phone for the third time in two minutes. Still ten minutes early.
```

**❌ Telling:**
```
Eddie was excited to share the news.
```

**✅ Showing:**
```
"So—okay, listen—" Eddie half-stood, sat back down. "You're not gonna believe this."
```

## 7. Honest Motivation

**"Monsters are real, ghosts are real too. They live inside us."**

### Principle
Every character must have clear, believable motivation for their actions—even antagonists.

### Red Flags
- "Because the plot needs it" thinking
- Sudden personality shifts without cause
- Characters acting against self-interest without explanation

### Fix
Ask: "Why would THIS character do THIS thing right now?"

If answer is "so the story can continue," rethink the scene.

## Application Checklist

For every scene, verify:

- [ ] Characters drive action (not plot convenience)
- [ ] At least one specific sensory detail per beat
- [ ] Emotional reactions feel honest
- [ ] Dialogue has subtext
- [ ] First draft was cut by 10-20%
- [ ] Adverbs removed from dialogue tags
- [ ] Character motivation is clear
- [ ] Behavior matches established characterization
```

---

## Skill 3: character-management

**Replaces:** None (NEW capability)

### SKILL.md

````markdown
---
name: character-management
description: Maintain character consistency by cross-referencing canonical character files. Use when writing scenes with established characters, updating character information, or checking for contradictions. Prevents invented physical details, cars, homes, or backstory. Triggers include "character consistency", "check character", "update character file", "character canon".
---

# Character Management

Ensure character consistency across scenes and episodes by maintaining canonical character files and validating usage.

## When to Use This Skill

Use this skill when you need to:
- Write a scene with established characters
- Update a character file with new canonical information
- Check if character usage contradicts established facts
- Verify character voices remain consistent

## Critical Rule: NO INVENTED DETAILS

**NEVER invent:**
- Physical traits (hair color, height, clothing style)
- Cars or vehicles ("drove away in her BMW" ❌)
- Homes or living spaces
- Habits or mannerisms not established
- Backstory elements
- Relationships not previously mentioned

**IF information is missing:**
- Stay vague ("drove away" ✅ not "drove away in her BMW" ❌)
- Use generic descriptions ("sat down" ✅ not "slumped into leather chair" ❌)
- Flag for author to decide and add to character file

## Character File Structure

All character canonical data lives in `elements/characters/<name>.md`:

### Required Sections
- **Name & Role**
- **Physical Description** (age, appearance, distinctive features)
- **Voice Patterns** (speech style, vocabulary, cadence)
- **Mannerisms** (habits, body language, tics)
- **Relationships** (to other characters)
- **Background** (only what's established in canon)
- **Motivation** (current arc goals)

## Character Consistency Workflow

### Before Writing Any Scene

1. **Load All Present Characters**
   - Read complete file for each character in scene
   - Note current emotional state from previous scenes
   - Check relationships to other present characters

2. **Voice Verification**
   - Review speech patterns for each character
   - Check vocabulary level and cadence
   - Verify dialogue tags match voice

3. **Visual Consistency**
   - Check physical descriptions match established canon
   - Verify mannerisms appear consistently
   - Check clothing/appearance only if previously established

4. **Relationship Dynamics**
   - Verify how characters interact matches established relationships
   - Check emotional temperature between characters
   - Note any relationship changes that occurred in previous scenes

## Updating Character Files

**When adding to character files:**

1. **Source Verification**
   - Information must come from published scenes
   - Author explicitly established it
   - Not inferred or invented

2. **Update Process**
   - Add to appropriate section in character file
   - Include scene reference where established
   - Format consistently with existing entries

3. **Change Log**
   - Note date of update
   - Reference scene/episode where detail was added

## Character Introduction Pattern

**First appearance of character:**
- Use name + role: "Eddie Palmer, his business partner"
- Give 1-2 distinctive physical details (if relevant to POV)
- Establish voice immediately through dialogue
- Show relationship to POV character

**Subsequent appearances:**
- Use first name only (unless context requires full)
- Reference distinctive trait only if relevant to moment
- Voice carries identity more than description

## Validation

Use `scripts/validate_consistency.py` to check:
- [ ] All characters in scene have files in `elements/characters/`
- [ ] No physical details contradict character files
- [ ] Voice patterns match established speech
- [ ] Relationships match established canon
- [ ] No invented details (cars, homes, habits)

## Example Character File

```markdown
# Doogan Andrews

**Role:** Protagonist, Rebound Specialist

**Physical Description:**
- Age: Late 30s
- [Details per author's establishment only]

**Voice Patterns:**
- Measured drawl
- Short, economical responses
- Dry humor
- Rarely volunteers information

**Mannerisms:**
- Observes before speaking
- Physical stillness (doesn't fidget)
- Eye contact without intimidation

**Relationships:**
- Eddie Palmer: Business partner, best friend since college
- Abby Palmer: Eddie's wife, friend, occasional moral compass
- Paul Martinez: Detective, professional respect, occasional friction

**Motivation (Episodes 1-2):**
- Clear his name in Annabelle Anders murder investigation
- Complete client jobs to pay mounting legal fees
- Protect Eddie/Abby from investigation fallout

**Established in Episodes:**
- Episode 1: Voice, business model, arrest circumstances
- Episode 2: Interrogation style, work ethic, relationship with police
```

## Next Step

After updating character files, use **continuity-checking** skill to verify no contradictions exist across episodes.
````

### scripts/validate_consistency.py

```python
#!/usr/bin/env python3
"""Validate character consistency in scene files"""

import re
import sys
from pathlib import Path
from typing import Dict, List

def load_character_file(char_path: Path) -> Dict:
    """Parse character file into structured data"""
    content = char_path.read_text()
    character = {
        'name': char_path.stem.replace('-', ' ').title(),
        'physical': extract_bullets(content, 'Physical Description'),
        'voice': extract_bullets(content, 'Voice Patterns'),
        'mannerisms': extract_bullets(content, 'Mannerisms')
    }
    return character

def extract_bullets(content: str, section: str) -> List[str]:
    """Extract bullet points from a section"""
    pattern = f"\\*\\*{section}\\*\\*:?(.*?)(?=\\*\\*|$)"
    match = re.search(pattern, content, re.DOTALL)
    if not match:
        return []
    
    bullets = re.findall(r'^[\\s]*[-*]\\s+(.+)$', match.group(1), re.MULTILINE)
    return [b.strip() for b in bullets]

def check_scene_consistency(scene_path: Path, characters: Dict) -> List[str]:
    """Check if scene uses characters consistently"""
    content = scene_path.read_text()
    warnings = []
    
    for char_name, char_data in characters.items():
        # Simple name matching (case-insensitive)
        char_first = char_name.split()[0]
        if char_first.lower() not in content.lower():
            continue  # Character not in scene
        
        # Check for invented physical details (common anti-patterns)
        invented_patterns = [
            (r'(?:drove|parked|got into|climbed out of)\\s+(?:his|her|their)\\s+\\w+\\s+(?:car|truck|SUV|vehicle)', 'vehicle'),
            (r'(?:sat|slumped|collapsed)\\s+(?:in|into|on)\\s+(?:the|a|an)\\s+(?:leather|wooden|metal)\\s+\\w+', 'furniture'),
            (r'(?:wore|dressed in|wearing)\\s+\\w+', 'clothing')
        ]
        
        for pattern, detail_type in invented_patterns:
            matches = re.finditer(pattern, content, re.IGNORECASE)
            for match in matches:
                detail = match.group(0)
                # Check if this detail is in character file
                found = any(
                    detail.lower() in item.lower() 
                    for items in [char_data['physical'], char_data['mannerisms']] 
                    for item in items
                )
                if not found:
                    warnings.append(
                        f"⚠️  Potential invented {detail_type} for {char_name}: '{detail}' "
                        f"(not found in character file)"
                    )
    
    return warnings

if __name__ == '__main__':
    if len(sys.argv) < 2:
        print("Usage: validate_consistency.py <scene-file>")
        sys.exit(1)
    
    scene_file = Path(sys.argv[1])
    chars_dir = Path('elements/characters')
    
    if not scene_file.exists():
        print(f"❌ Scene file not found: {scene_file}")
        sys.exit(1)
    
    if not chars_dir.exists():
        print(f"❌ Characters directory not found: {chars_dir}")
        sys.exit(1)
    
    # Load all character files
    characters = {}
    for char_file in chars_dir.glob('*.md'):
        char_data = load_character_file(char_file)
        characters[char_data['name']] = char_data
    
    # Check scene
    warnings = check_scene_consistency(scene_file, characters)
    
    if warnings:
        print(f"⚠️  Character consistency warnings in {scene_file.name}:")
        for warning in warnings:
            print(f"  {warning}")
        print("\\n💡 Tip: Either add these details to character files or use generic descriptions")
        sys.exit(1)
    else:
        print(f"✅ Character usage in {scene_file.name} appears consistent")
        sys.exit(0)
```

---

## Skills 4-6: Validation, Compilation, Continuity

[Due to length, providing abbreviated versions. Full implementations would follow same pattern as above.]

### Skill 4: draft-validation

````markdown
---
name: draft-validation
description: Validate draft artifacts and scenes against Fiction Kit checklist and quality standards. Use when completing drafts, QA checking episodes, or verifying scene quality. Runs validation scripts to check McDonald rule, POV discipline, character voice, and checklist compliance.
---

# Draft Validation

[Full skill content follows same structure: When to Use, Workflows, Validation levels, Scripts]
````

### Skill 5: episode-compilation

````markdown
---
name: episode-compilation
description: Compile individual scene files into single episode markdown for publication. Use when all scenes for an episode are finalized and ready to publish. Validates scene order, generates metadata, combines files.
---

# Episode Compilation

[Full skill content + compile.py script]
````

### Skill 6: continuity-checking

````markdown
---
name: continuity-checking
description: Verify story continuity across episodes, checking for contradictions in character details, timeline, and established facts. Use before publishing new episodes or when updating existing content.
---

# Continuity Checking

[Full skill content + continuity database + check.py script]
````

---

## Implementation Roadmap

### Phase 1: Foundation (Week 1)
- [ ] Create `.github/skills/` directory structure
- [ ] Implement **draft-initialization** skill (highest priority)
- [ ] Test on new draft (episode 3 or rewrite)
- [ ] Validate with `validate_draft.py` script

### Phase 2: Core Writing (Week 2)
- [ ] Implement **scene-writing** skill
- [ ] Implement **character-management** skill
- [ ] Test on existing scenes from episodes 1-2
- [ ] Validate consistency with scripts

### Phase 3: Validation (Week 3)
- [ ] Implement **draft-validation** skill
- [ ] Write comprehensive validation scripts
- [ ] Test on episodes 1-2 for baseline
- [ ] Document validation patterns

### Phase 4: Production (Week 4)
- [ ] Implement **episode-compilation** skill
- [ ] Implement **continuity-checking** skill
- [ ] Build continuity database from episodes 1-2
- [ ] Full workflow end-to-end test

### Phase 5: Migration (Ongoing)
- [ ] Gradually deprecate `.github/prompts/` files as skills prove effective
- [ ] Update documentation to reference skills over prompts
- [ ] Monitor AI performance and refine skill descriptions
- [ ] Consider sharing skills publicly on GitHub

---

## Draft Flow Integration

### Current Workflow (Manual)
```
User: "Create tasks for episode 3"
→ User types: @#prompts/tasks.prompt.md
→ Copilot loads full prompt
→ May not follow format correctly
```

### New Workflow (Auto-Discovery)
```
User: "Create tasks for episode 3"
→ Copilot reads all skill descriptions
→ "draft-initialization" description matches ("tasks", "episode planning")
→ Auto-loads draft-initialization skill
→ Follows structured workflow
→ Runs validate_draft.py before completion
```

### Prompts to Migrate to Skills

| Current Prompt | Skill Replacement | Status |
|----------------|------------------|--------|
| `idea.prompt.md` | draft-initialization (stage 1) | ✅ Planned |
| `clarify.prompt.md` | draft-initialization (stage 2) | ✅ Planned |
| `plan.prompt.md` | draft-initialization (stage 3) | ✅ Planned |
| `tasks.prompt.md` | draft-initialization (stage 4) | ✅ Planned |
| `addscene.prompt.md` | scene-writing | ✅ Planned |
| `editscene.prompt.md` | scene-writing | ✅ Planned |
| `qa.prompt.md` | draft-validation | ✅ Planned |
| `compile-episode.prompt.md` | episode-compilation | ✅ Planned |

**Keep as Prompts (for now):**
- `agent.prompt.md` - Meta-orchestration
- `sample.prompt.md` - Documentation
- `editor.prompt.md` - Specialized role
- `implement.prompt.md` - Task orchestrator
- `rewrite.prompt.md`, `feedback.prompt.md`, `analyze.prompt.md` - Could migrate later

---

## Benefits Summary

### For Users
✅ Less manual workflow management (no `@#prompts/` needed)  
✅ Automatic quality checks via validation scripts  
✅ Consistent formatting enforced by code  
✅ Faster onboarding (examples bundled in skills)  
✅ Portable across Copilot tools (CLI, coding agent, VS Code)

### For Project
✅ Maintainable validation scripts (testable code)  
✅ Executable quality gates (CI/CD ready)  
✅ Community shareable (open standard)  
✅ Scales to more episodes (progressive disclosure)  
✅ Reduces context bloat (only load what's needed)

### For AI Performance
✅ Better context selection (description-based triggering)  
✅ Bundled examples improve output quality  
✅ Executable scripts reduce hallucination  
✅ Consistent structure across all tools  
✅ References loaded on-demand (not all upfront)

---

## Next Steps

1. **Review & Approve**
   - Review this recommendations document
   - Decide: pilot 1-2 skills or implement all 6?
   - Approve Phase 1 scope (draft-initialization priority)

2. **Pilot Implementation**
   - Create `.github/skills/draft-initialization/` folder
   - Write SKILL.md following format above
   - Add `scripts/validate_draft.py`
   - Test on episode 3 or new rewrite

3. **Iterate & Expand**
   - Refine based on actual usage experience
   - Implement remaining skills (scene-writing, character-management, etc.)
   - Gradually migrate from prompts to skills

4. **Document & Share**
   - Update README with skills usage instructions
   - Create tutorial for workflow integration
   - Consider sharing publicly when mature

---

## Questions for Consideration

1. **Scope:** Start with all 6 skills or pilot with 1-2 first?
2. **Migration:** Deprecate prompts immediately or gradual transition?
3. **Validation:** Run scripts automatically (GitHub Actions) or on-demand only?
4. **Sharing:** Keep private or share publicly on GitHub as example fiction workflow?
5. **Standards:** Follow Anthropic patterns exactly or customize for fiction domain?

---

## References

- [Agent Skills Specification](https://agentskills.io)
- [GitHub: About Agent Skills](https://docs.github.com/en/copilot/concepts/agents/about-agent-skills)
- [Anthropic Skills Repository](https://github.com/anthropics/skills) - 27k+ stars
- [Awesome Copilot Skills Examples](https://github.com/github/awesome-copilot/tree/main/skills)
- [VS Code Agent Skills Support](https://code.visualstudio.com/docs/copilot/copilot-customization)

---

**Prepared by:** GitHub Copilot  
**Date:** 2025-12-25  
**Status:** Ready for Review