# Recommendations for a draft flow
A discovery-first drafting workflow aligned with Stephen King’s creative philosophy.

---
## Agent Skills Integration

**NEW:** The Fiction Kit now uses [Agent Skills](https://agentskills.io) to automate and validate the draft workflow. Skills are self-contained folders with instructions, validation scripts, and bundled resources that AI agents load on-demand.

### Available Skills

- **draft-initialization** (`.github/skills/draft-initialization/`) - Automates idea → clarify → plan → tasks workflow with validation
- **scene-writing** (`.github/skills/scene-writing/`) - Guides prose writing with McDonald rule + Stephen King principles
- **character-management** (`.github/skills/character-management/`) - Validates character consistency against canonical files

**Usage:** Skills are automatically loaded when you use trigger phrases like:
- "Create a new draft for [change]" → loads **draft-initialization**
- "Write scene [number]" → loads **scene-writing**
- "Check character consistency" → loads **character-management**

See [.github/AGENT-SKILLS-RECOMMENDATIONS.md](.github/AGENT-SKILLS-RECOMMENDATIONS.md) for full documentation and [.github/skills/README.md](.github/skills/README.md) for skill details.

---
## 1. Drafting Philosophy

- Stories are fossils; the writer excavates them.
- Characters lead the plot.
- The first draft should be fast, instinctive, and unrestrained.
- Structure is applied later.

---

## 2. Draft Flow Stages

### Stage 0 — POV Constraint Check
**Before drafting any scene, verify:**
- Is the protagonist present for this event?
- If NO: Plan how information will reach them (briefing, interview, document, etc.)
- Does this scene violate the Fletch Rule? (Reader learns when protagonist learns)
- Will off-screen events be delivered indirectly?

### Stage 1 — Spark
- Begin with a "What if?" question.
- Identify the emotional center.
- Identify the character's desire and fear.

### Stage 2 — Discovery Draft
- Write without overthinking.
- Follow the character.
- Allow surprises.
- Avoid editing during drafting.
- **Stay with the protagonist's POV**—if you drift into a scene they can't witness, note it for later conversion to indirect delivery.

### Stage 3 — Cooling Period
- Step away from the draft.
- Let the subconscious process.

### Stage 4 — First Read-Through
- Read as a reader, not a writer.
- Mark confusion, boredom, or excitement.

### Stage 5 — Rewrite Pass
Use the King rewrite algorithm:
- Cut 10–20%.
- Strengthen verbs.
- Remove adverbs.
- Clarify motivations.
- Enhance sensory detail.
- **Verify POV discipline:** Check that all off-screen events are delivered indirectly.
- **Verify information flow:** Reader only knows what Doogan knows.
- Convert any accidental cutaways to reported action, briefings, or documents.

### Stage 6 — Line Edit
- Rhythm.
- Cadence.
- Dialogue.
- Clarity.

---

## 3. Drafting Prompts

- “What is the character afraid of right now?”
- “What sensory detail defines this moment?”
- “What unexpected but honest action might they take?”
- “What is the simplest way to say this?”
