# Continuity Error Prevention Fix — 2025-12-26

## Problem Statement

Continuity errors keep occurring despite comprehensive prompts and skills. Specifically: **beat mechanisms** (HOW and WHY things happen) are not being verified before writing scenes.

### Example Failures

**Episode 2, Scene 2 Error:**
- **Outline said:** "Eddie is there, Hank is there"
- **What I wrote:** "Abby got a call from someone at the station"
- **What I should have asked:** "HOW does Eddie know Doogan was arrested?"
- **Correct answer (from notes.md):** Doogan used his one phone call to call Eddie

**Root Cause:**
The outline beat said WHO was present but not HOW they knew to be there. I loaded all the files but didn't systematically verify the MECHANISM for each beat.

---

## What Was Wrong with the Old Process

### Old Checklist (Insufficient):
1. ✅ Load character files
2. ✅ Load voice files
3. ✅ Load prior scenes
4. ✅ Create continuity notes
5. ❌ **MISSING:** Verify HOW each outline beat happens

### The Gap:
- Beats like "Character X is there" were taken at face value
- The MECHANISM (phone call, prior arrangement, procedure) was not verified
- When mechanism wasn't explicit in outline, I invented one
- This created continuity errors that required rewrites

---

## New Process: Beat Mechanism Verification

### New Pre-Writing Step (Mandatory)

**After loading all files, BEFORE writing:**

**For EACH outline beat, ask and verify:**

1. **"HOW does this happen?"**
   - If beat says "Character X arrives" → HOW do they know to come?
   - If beat says "Character knows Y" → HOW did they learn it?
   - If beat says "Object appears" → WHERE did it come from?

2. **Check these sources for mechanisms:**
   - `notes.md` - Established procedures, information flow
   - Prior scenes - Was mechanism shown earlier?
   - Character files - Does background explain this?
   - Common sense - Is there an obvious implied mechanism?

3. **Document the verified mechanism:**
   ```
   Outline Beat: "Eddie is there, Hank is there"
   ❓ Question: HOW does Eddie know to come?
   ✅ Verified: notes.md → "one phone call" police procedure
   ✅ Mechanism: Doogan called Eddie at 3 AM
   ```

4. **If mechanism is unclear:**
   - ❌ DO NOT INVENT
   - ✅ FLAG IT as "UNVERIFIED BEAT"
   - ✅ Ask user for clarification
   - ✅ Wait for answer before proceeding

---

## Files Updated

### 1. `.github/prompts/implement.prompt.md`

**Added Step 10: "VERIFY BEAT MECHANISMS"**

```markdown
10. **VERIFY BEAT MECHANISMS** (NEW - CRITICAL):
    - For EACH outline beat, ask: "HOW does this happen?"
    - If beat says "Character X is there" → WHY are they there? HOW do they know to come?
    - If beat says "Character knows Y" → HOW did they learn it? WHEN? FROM WHOM?
    - Check notes.md for established mechanisms (phone calls, procedures, information flow)
    - If mechanism is unclear, FLAG IT before writing (don't invent)
    - Document the mechanism in your continuity notes
```

**Updated Context Verification Log Format:**

Now includes:
```
**BEAT MECHANISM VERIFICATION (CRITICAL):**
Outline Beat → Verified Mechanism
- "Eddie is there, Hank is there" → WHY? Doogan used one phone call (notes.md: police procedure)
- "Hank's rules: don't leave town" → HOW does Hank know case details? He's the attorney (standard lawyer briefing)

❓ UNVERIFIED BEATS (flag these):
- None (or list any beats where mechanism is unclear)
```

### 2. `.github/skills/scene-writing/SKILL.md`

**Added Step 6: "Verify Beat Mechanisms"**

Includes:
- The "HOW?" and "WHY?" Questions checklist
- Sources to check (notes.md, prior scenes, character files, common sense)
- What to do if mechanism is unclear (flag it, don't invent)
- Example verification with real beat from Episode 2

### 3. `elements/checklist.md`

**Added Item 13: Beat Mechanism Verification**

```markdown
13. ✓ **[NEW] BEAT MECHANISM VERIFICATION:**
    - For EACH outline beat, have I verified HOW/WHY it happens?
    - If beat says "Character X is there" → Have I verified HOW they know to come?
    - If beat says "Character knows Y" → Have I verified the information source?
    - Have I checked notes.md for established mechanisms (procedures, phone calls, etc.)?
    - Have I documented the mechanism in my continuity notes?
    - If mechanism is unclear, have I FLAGGED IT instead of inventing?
```

---

## How This Prevents Future Errors

### Old Failure Mode:
1. Outline says: "Eddie is there, Hank is there"
2. I write: Eddie shows up (but don't verify HOW he knows)
3. I invent: "Abby got a call from someone"
4. **Result:** Continuity error, requires rewrite

### New Protected Mode:
1. Outline says: "Eddie is there, Hank is there"
2. **NEW STEP:** I ask: "HOW does Eddie know to come?"
3. I check notes.md → find "one phone call" police procedure
4. I document: "Doogan called Eddie (verified: notes.md)"
5. I write: Eddie references receiving the phone call
6. **Result:** No continuity error, no rewrite needed

---

## Testing the Fix

**Next time I write a scene, I must:**

1. Load all files (character, element, voice) ✅ *Already doing this*
2. Read prior content for continuity ✅ *Already doing this*
3. **[NEW]** For each outline beat, verify HOW/WHY it happens
4. **[NEW]** Document verified mechanisms in continuity notes
5. **[NEW]** Flag any unclear mechanisms before writing
6. Write scene using verified mechanisms ✅ *This is where error occurred*
7. Validate with continuity-checking skill ✅ *Already doing this*

---

## Why This Will Work

**The problem wasn't too much information** — all the information was there in notes.md and the outline. 

**The problem was not asking the right question:** "HOW does this beat happen?"

By making this question **mandatory** and **systematic**, we catch the gap between:
- **"Eddie is there"** (what the outline says)
- **"Eddie is there BECAUSE Doogan called him"** (what the scene must show)

This is a **process fix**, not an information fix. The safeguard is now in the workflow.

---

## Summary

**What changed:**
- Added "Verify Beat Mechanisms" as mandatory pre-writing step
- Updated implement.prompt.md, scene-writing SKILL.md, checklist.md
- Context verification log now requires beat mechanism documentation

**What this prevents:**
- Inventing HOW/WHY things happen when outline doesn't specify
- Continuity errors from unclear information flow
- Character knowledge violations
- Unnecessary rewrites

**How to use it:**
Every outline beat gets a "HOW?" question. Verify the mechanism. Document it. If unclear, flag it. Don't invent.

---

**This is a structural fix that makes continuity verification systematic instead of optional.**
