# Fact Verification System - Quick Start Guide

## The Problem

AI writes dialogue that "sounds right" but contradicts prior scenes.

**Example:**
- Scene 1: "Three or four thousand should do it"
- Scene 3: "That was more than we discussed" ❌
- Fix: "Three thousand. Right on target" ✅

---

## The Solution: Three-Stage Verification

### Stage 1: PRE-WRITING (Extract Facts)

**Before writing, create Fact Reference Table:**

```markdown
**FACT REFERENCE TABLE**

Reference #1: [What will be mentioned]
- Will appear as: [planned dialogue]
- Source: Scene X, lines Y-Z
- Established detail: [exact quote]
- Constraint: [what NOT to contradict]
```

**Example:**
```markdown
Reference #1: Jake comments on bid amount
- Will appear as: Jake's reaction to $3,000
- Source: Scene 1, lines 85-86
- Established: "Three or four thousand should do it"
- Constraint: Cannot say it exceeded expectations
```

### Stage 2: DURING WRITING (Verify Each Reference)

**Red flag phrases - STOP and verify:**
- "like we discussed"
- "you said" / "you told me"
- "more/less than expected"
- Specific amounts/times from prior scenes

**Process:**
1. STOP writing
2. Check Fact Reference Table
3. Read source scene (not from memory)
4. Verify match
5. Adjust if needed

### Stage 3: POST-WRITING (Audit)

**Search scene for:**
- "you said"
- "we discussed"  
- "earlier" / "last time"
- "more than" / "less than"

**For each found:**
- Locate source scene
- Verify match
- Fix contradictions
- Re-audit until zero violations

---

## Files You Need

### Full Documentation
- `.github/skills/scene-writing/references/fact-verification.md`

### Quick Checklist
- `.github/skills/scene-writing/checklists/fact-verification-checklist.md`

### Updated Skills/Prompts
- `.github/skills/scene-writing/SKILL.md` (3 new sections)
- `.github/prompts/implement.prompt.md` (3 new sections)

---

## Common Mistakes to Avoid

1. **"Sounds right" syndrome** - Verify, don't assume
2. **Memory substitution** - Read source, don't remember
3. **Precision inflation** - Don't add specifics not in source
4. **Comparative assumptions** - Verify baseline before "more/less"

---

## Success Metric

**Zero factual contradictions when referencing prior events.**

Every reference must match established facts.

---

## Implementation Notes

See `.github/skills/scene-writing/IMPLEMENTATION-NOTES.md` for:
- Detailed problem analysis
- Complete solution architecture
- Files created/modified
- Validation criteria
- Next steps

---

## Fixed Example

**Scene 3, Line 45:**

**BEFORE:** ❌
```
Jake: "That was more than we discussed."
```

**AFTER:** ✅
```
Jake: "Three thousand. Right on target."
```

**Why:** Scene 1 established "three or four thousand" - $3,000 is low end, not "more than discussed."
