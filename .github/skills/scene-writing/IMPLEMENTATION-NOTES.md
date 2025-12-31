# Fact Verification System - Implementation Summary

**Created:** December 30, 2025  
**Purpose:** Prevent contradictions when characters reference prior events

---

## The Problem We're Solving

**Pattern identified:**
When writing dialogue that references prior scenes, AI tends to:
1. Invent details that "sound right" without verifying
2. Misremember specific amounts, times, or statements
3. Create contradictions by writing authentic-sounding but factually wrong dialogue

**Real example from Episode 3:**
- **Scene 1:** Jake says "three or four thousand should do it"
- **Scene 3 (WRONG):** Jake says "That was more than we discussed"
- **Reality:** $3,000 is exactly what they discussed (low end of range)
- **Problem:** Dialogue sounded natural but contradicted established fact

**Root causes:**
- Working memory gaps during scene writing
- "Sounds right" overrides fact-checking
- No systematic verification of referenced facts
- Post-writing audits didn't catch factual contradictions

---

## The Solution

Added **three-stage fact verification protocol:**

### 1. **PRE-WRITING: Extract Referenced Facts** (NEW)

Before writing Scene N:
- Review outline for what prior events will be mentioned
- Create **Fact Reference Table** documenting:
  - What will be referenced
  - Source scene + line numbers
  - Exact quotes or details
  - Constraints (what NOT to contradict)
- Keep table visible during writing

**Files updated:**
- `.github/skills/scene-writing/SKILL.md` - Added Step 5 in Pre-Writing Checklist
- `.github/prompts/implement.prompt.md` - Added Step 11 in orchestrator checklist

### 2. **DURING WRITING: Verify Each Reference** (NEW)

**Red flag phrases** that trigger verification:
- "like we discussed", "you said", "you told me"
- "more/less than expected", "different from what you said"
- Specific amounts, times, places from prior scenes
- Attributed quotes or paraphrases

**Process:**
1. STOP writing when red flag phrase appears
2. Check Fact Reference Table
3. Locate source scene
4. Read actual passage (not from memory)
5. Verify match
6. Adjust if mismatch

**Files updated:**
- `.github/skills/scene-writing/SKILL.md` - Added Section 0 in During-Writing Rules

### 3. **POST-WRITING: Fact Verification Audit** (NEW)

After completing draft:
- Search scene for all reference phrases
- Verify each one against source scenes
- Document violations
- Fix contradictions
- Re-run until zero violations

**Files updated:**
- `.github/skills/scene-writing/SKILL.md` - Added Section 1 in Post-Writing Self-Assessment
- `.github/prompts/implement.prompt.md` - Added POST-WRITING FACT VERIFICATION AUDIT section

---

## New Files Created

### 1. **Fact Verification Protocol**
**File:** `.github/skills/scene-writing/references/fact-verification.md`

**Contents:**
- Full protocol explanation
- Pre-writing fact extraction process
- During-writing verification rules
- Post-writing audit procedure
- Common violation patterns
- Before/after examples
- Integration with scene-writing workflow

### 2. **Fact Verification Checklist**
**File:** `.github/skills/scene-writing/checklists/fact-verification-checklist.md`

**Contents:**
- Quick reference checklist format
- Pre-writing checklist (identify references, create table)
- During-writing checklist (red flag phrases)
- Post-writing checklist (search and verify)
- Violation documentation format
- When to use / when to skip

---

## Updates to Existing Files

### implement.prompt.md

**Changes:**
1. Added Step 11 to Pre-Writing checklist: "EXTRACT REFERENCED FACTS"
2. Added FACT REFERENCE TABLE section to Context Verification Log
3. Added POST-WRITING FACT VERIFICATION AUDIT section (before self-contradiction audit)

**Impact:**
- Orchestrator must now extract facts before invoking scene-writing skill
- Orchestrator must run fact audit after scene-writing skill completes
- Blocks progression until facts verified

### scene-writing SKILL.md

**Changes:**
1. Added Step 5 to Pre-Writing Checklist: "Extract Referenced Facts (MANDATORY - NEW)"
2. Added Section 0 to During-Writing Rules: "Fact Verification (BLOCKING - NEW)"
3. Added Section 1 to Post-Writing Self-Assessment: "Fact Verification Audit (MANDATORY - NEW)"

**Impact:**
- Skill enforces fact extraction before writing
- Skill requires verification during writing for red flag phrases
- Skill requires post-writing audit before completion

---

## How It Prevents the Problem

**The Episode 3 Scene 3 case:**

**With new system:**

### Pre-Writing:
```markdown
**FACT REFERENCE TABLE**

Reference #1: Jake comments on auction bid
- Will appear as: Jake's reaction to $3,000 bid
- Source: Scene 1, lines 85-86
- Established detail: Jake said "Whatever it takes. Three or four thousand should do it."
- Constraint: Jake CANNOT say it was more than expected. $3,000 is low end of range.
```

### During Writing:
- Writer types: `Jake: "That was more than—"`
- RED FLAG: "more than expected"
- STOP
- Check table: "Jake CANNOT say it was more than expected"
- ADJUST: `Jake: "Three thousand. Right on target."`

### Post-Writing:
- Search for "more than"
- Find: Line 45: Jake says "Three thousand. Right on target."
- Verify: Source Scene 1, line 85-86: "three or four thousand"
- Result: ✅ PASS - $3,000 is low end, "right on target" is accurate

---

## Validation

**Zero tolerance for factual contradictions.**

Every reference to prior events must:
1. Be identified pre-writing
2. Be verified during writing
3. Be audited post-writing

If any stage fails, scene is not complete.

---

## Next Steps

1. **Test system** on next scene requiring prior event references
2. **Monitor effectiveness** - track whether contradictions still occur
3. **Refine** red flag phrase list based on real usage
4. **Consider automation** - script to auto-detect reference phrases and flag them

---

## Files Modified Summary

**New files created:**
- `.github/skills/scene-writing/references/fact-verification.md`
- `.github/skills/scene-writing/checklists/fact-verification-checklist.md`

**Existing files updated:**
- `.github/skills/scene-writing/SKILL.md` (3 sections added)
- `.github/prompts/implement.prompt.md` (3 sections added)

**Content fixed:**
- `content/episodes/episode-03-the-professional-golfer/03-welcome-gala-auction.md` (Line 45: "That was more than we discussed" → "Three thousand. Right on target.")

---

## Success Criteria

System is successful if:
- ✅ Zero factual contradictions when characters reference prior events
- ✅ Fact Reference Table created before every scene with references
- ✅ Red flag phrases trigger verification during writing
- ✅ Post-writing audits catch any missed contradictions
- ✅ Contradictions fixed before scene marked complete

**Goal:** Every reference to prior events matches established facts.
