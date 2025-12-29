# Fiction Kit Agent Skills

Agent Skills following the [Agent Skills specification](https://agentskills.io). Skills are self-contained folders with instructions that AI agents load on-demand based on task context.

## Available Skills

| Skill | Purpose | Triggers |
|-------|---------|----------|
| **draft-initialization** | Initialize draft cycles (idea → clarify → plan → tasks) | "create draft", "new draft", "plan episode" |
| **scene-writing** | Write scenes following King principles + McDonald rule | "write scene", "edit scene", "new chapter" |
| **character-management** | Maintain character consistency | "check character", "character consistency" |
| **continuity-checking** | Validate cross-episode continuity | "check continuity", "continuity violations" |

## How Skills Work

Skills are automatically loaded when your request matches the skill's description. No explicit reference needed.

**Example:**
```
You: "Write scene 8 - the interrogation"
→ Copilot loads scene-writing skill
→ Applies McDonald opening rule
→ Validates character voices
```

## Directory Structure

```
.github/skills/
├── draft-initialization/
│   └── SKILL.md
├── scene-writing/
│   ├── SKILL.md
│   └── references/
├── character-management/
│   └── SKILL.md
└── continuity-checking/
    └── SKILL.md
```

## References

- [Agent Skills Specification](https://agentskills.io)
- [VS Code Agent Skills Documentation](https://code.visualstudio.com/docs/copilot/customization/agent-skills)
