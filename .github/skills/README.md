# Fiction Kit Agent Skills

This directory contains Agent Skills following the [Agent Skills specification](https://agentskills.io). Skills are self-contained folders with instructions, validation scripts, and bundled resources that AI agents load on-demand.

## Available Skills

### 1. draft-initialization
**Purpose:** Initialize fiction draft cycles following Spec-Kit workflow (idea → clarify → plan → tasks)

**Triggers:** "create draft", "new draft folder", "plan episode", "draft tasks"

**Includes:**
- SKILL.md with structured workflow instructions
- `scripts/validate_draft.py` - Validates folder structure, task format, required sections

**Replaces:** `idea.prompt.md`, `clarify.prompt.md`, `plan.prompt.md`, `tasks.prompt.md`

### 2. scene-writing
**Purpose:** Write fiction scenes following Stephen King principles and McDonald opening rule

**Triggers:** "write scene", "draft scene", "edit scene", "new chapter"

**Includes:**
- SKILL.md with pre-writing checklist and validation rules
- `references/mcdonald-rule.md` - In medias res opening principles
- `references/king-principles.md` - Discovery-driven writing, sensory detail, emotional truth

**Replaces:** `addscene.prompt.md`, `editscene.prompt.md`

### 3. character-management
**Purpose:** Maintain character consistency by cross-referencing canonical character files

**Triggers:** "character consistency", "check character", "update character file"

**Includes:**
- SKILL.md with consistency workflow
- `scripts/validate_consistency.py` - Validates character usage against canonical files

**New Capability:** Prevents invented details (cars, homes, physical traits not in character files)

## How to Use

Agent Skills are automatically loaded by GitHub Copilot when your request matches the skill's description. You don't need to explicitly reference them.

**Example workflows:**

```
You: "Create a new draft for tightening Act 2 pacing in episode 3"
→ Copilot loads draft-initialization skill
→ Follows idea → clarify → plan → tasks sequence
→ Validates with validate_draft.py
```

```
You: "Write scene 8 - the interrogation"
→ Copilot loads scene-writing skill
→ Checks McDonald rule compliance
→ Applies Stephen King principles
→ Validates character voices
```

```
You: "Check if this scene uses Doogan consistently"
→ Copilot loads character-management skill
→ Runs validate_consistency.py
→ Reports any invented details or contradictions
```

## Validation Scripts

All skills include validation scripts that can be run independently:

```bash
# Validate draft structure
python .github/skills/draft-initialization/scripts/validate_draft.py drafts/003-name/

# Validate character consistency in a scene
python .github/skills/character-management/scripts/validate_consistency.py content/episodes/episode-01-*/01-scene.md
```

## Directory Structure

```
.github/skills/
├── draft-initialization/
│   ├── SKILL.md              # Main instructions (YAML frontmatter + markdown)
│   └── scripts/
│       └── validate_draft.py # Validation script
├── scene-writing/
│   ├── SKILL.md
│   └── references/           # Documentation loaded to context as needed
│       ├── mcdonald-rule.md
│       └── king-principles.md
└── character-management/
    ├── SKILL.md
    └── scripts/
        └── validate_consistency.py
```

## Future Skills (Planned)

- **draft-validation** - Comprehensive QA validation against checklist
- **episode-compilation** - Compile individual scenes into episode markdown
- **continuity-checking** - Cross-episode continuity validation with database

## References

- [Agent Skills Specification](https://agentskills.io)
- [GitHub Copilot Agent Skills Documentation](https://docs.github.com/en/copilot/concepts/agents/about-agent-skills)
- [Implementation Recommendations](.github/AGENT-SKILLS-RECOMMENDATIONS.md)
