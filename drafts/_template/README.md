# Draft Folder Template (Fiction Kit)

This folder defines the standard per-draft artifact layout.

Each new draft cycle should create a folder under `drafts/###-short-name/` containing:

- `idea.md` — the intent/spec for the draft (WHAT/WHY)
- `clarify.md` — clarification Q&A log (tightens intent before planning)
- `plan.md` — structural blueprint (HOW at a high level)
- `tasks.md` — executable task breakdown (atomic, traceable)
- `analyze.md` — read-only analysis reports (coverage/consistency checks)
- `feedback.md` — editorial/agent/QA feedback captured for this draft

These mirror GitHub Spec Kit’s “feature folder” convention, adapted for fiction.
---

## LLM Session Management

### Context Window Degradation

**Problem:** LLM quality degrades after 5-10 scenes due to attention mechanism limitations ("Lost in the Middle" phenomenon).

**Solution:** Session reset protocol every 5 scenes.

### Session Reset Checklist

Perform session reset when:
- [ ] 5 scenes completed since last reset
- [ ] Writing quality shows authorial commentary creep
- [ ] LLM adding psychological interpretation
- [ ] Explanatory prose replacing pure dialogue

**Reset Procedure:**
1. Save current conversation
2. Start fresh conversation with Copilot
3. Load minimal context:
   - `.github/copilot-instructions.md`
   - `voice/style.md` (focus on Anti-Patterns section)
   - `elements/pov.md`
   - `elements/checklist.md`
   - Character files for current scene only
   - Most recent completed scene only
4. Include this meta-prompt:

```markdown
# Session Reset — Fresh Context

You are continuing Episode X after completing Scene Y.

CRITICAL AWARENESS:
- Previous session accumulated 100K+ tokens causing attention drift
- This is a FRESH START with compressed context
- Style rules are now at TOP of context (high attention)
- You MUST maintain Gregory McDonald authorial invisibility

BEFORE writing each paragraph:
1. Check for authorial commentary
2. Check for psychological interpretation
3. Check for explanatory prose

If found → DELETE and rewrite as pure dialogue/action.

Proceed with Scene [X] requirements...
```

### Quality Monitoring

Track degradation symptoms in `analyze.md`:
- Scene number where drift detected
- Specific anti-patterns found
- Whether session reset resolved issue

This data helps optimize reset frequency.