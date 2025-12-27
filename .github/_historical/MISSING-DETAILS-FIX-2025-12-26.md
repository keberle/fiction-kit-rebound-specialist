# Missing Details Prevention System — 2025-12-26

## Problem

Continuity errors occur because I invent details when information is missing from element files, rather than asking the user for clarification.

### Episode 2, Scene 2 Fabrications:

**Invented details NOT in element files:**
1. **Eddie/Hank prior relationship:** "I didn't know you knew a lawyer" / "I know a lot of people"
   - **Outline says:** "man who just met you in a jail hallway" (first meeting)
   - **I invented:** Implied existing relationship
   
2. **How Eddie found Hank:** "Called Hank, woke him up"
   - **Outline says:** Nothing about HOW Eddie found a lawyer at 3 AM
   - **I invented:** Eddie knowing who to call
   
3. **Hank's physical description:** "heavyset, ill-fitting taupe suit, worn black shoes, sweating at 9am"
   - **Outline says:** "parking meter with a law degree" (personality only)
   - **I invented:** Entire physical appearance
   
4. **Hank's experience:** "I've handled cases like this before"
   - **Outline says:** "bottom-tier" lawyer
   - **I invented:** His background/case history

## Root Cause

**When I encounter a gap (detail needed but not documented), I fill it instead of asking.**

This creates two problems:
1. Fabricated details contradict later revelations
2. User has to do rewrites to fix my inventions

## Solution: "Ask Before Inventing" Protocol

### New Mandatory Step

**When ANY detail needed for scene is NOT in element files:**

1. **STOP writing immediately**
2. **Create "❓ MISSING DETAILS - USER INPUT NEEDED" section**
3. **List EVERY missing detail as a question**
4. **Provide context** (what outline says, what's missing)
5. **Offer logical options** when possible
6. **WAIT for user response**
7. **Document user's answers** in appropriate element files after scene completes

### What Counts as "Missing Detail"

**Physical descriptions:**
- Character appearance (height, build, features)
- Clothing (style, brands, colors)
- Objects (car models, tech, possessions)

**Background information:**
- Character history (education, jobs, experiences)
- Relationships (how they met, prior connections)
- Skills/knowledge (what they know, how they learned it)

**Locations:**
- Physical layout (room descriptions)
- Atmosphere (sounds, smells, feel)
- Specific details not in setting.md

**Motivations:**
- Why character does something
- What they're thinking/feeling
- Decision-making process

**Mechanisms:**
- How something happens
- Who tells whom what information
- Procedural details

### Format for Asking

```markdown
## ❓ MISSING DETAILS - USER INPUT NEEDED

Before proceeding with [Scene], I need clarification:

### 1. [Category]: [Brief description]
**Outline says:** [relevant quote from outline]
**Currently missing:** [what's not in element files]
**Question:** [specific question]
**Options (if applicable):** 
- a) [logical possibility 1]
- b) [logical possibility 2]
- c) [other?]

### 2. [Next detail]
...

**Please provide answers, and I'll proceed with accurate details.**
```

## Files Updated

### 1. `.github/prompts/implement.prompt.md`

**Added Step 11: "FLAG MISSING DETAILS"**
- If ANY detail needed is NOT in element files, STOP
- Create missing details section
- List questions with context
- Wait for user response
- DO NOT INVENT

**Updated Context Verification Log:**
- Now includes "❓ MISSING DETAILS - USER INPUT NEEDED" section
- Shows "⚠️ AWAITING USER RESPONSE BEFORE PROCEEDING" when details are missing

### 2. `.github/skills/scene-writing/SKILL.md`

**Added Step 7: "Flag Missing Details"**
- Comprehensive list of what counts as "missing detail"
- Format for asking with examples
- DO NOT / DO lists
- Instructions for documenting user answers after scene completes

### 3. `elements/checklist.md`

**Added Item 14: "Missing Detail Verification"**
- Do I need ANY detail not in files?
- Have I flagged ALL missing details?
- Am I waiting for response instead of inventing?
- **NEVER proceed with scene if details are missing**

## How This Prevents Future Errors

### Old Failure Mode:
1. Outline mentions "Hank Stillman" (name only)
2. I need physical description for scene
3. I invent: "heavyset, taupe suit, sweating"
4. **Result:** Fabricated detail, potential contradiction later

### New Protected Mode:
1. Outline mentions "Hank Stillman" (name only)
2. I need physical description for scene
3. **NEW:** I create missing details question
4. **NEW:** I ask user: "Should I keep generic or specify? Options: a) generic 'man in tired suit', b) specific details you provide"
5. User answers
6. I write scene with user's answer
7. I document in appropriate element file
8. **Result:** No fabrication, no contradiction

## Example: Episode 2, Scene 2 (What Should Have Happened)

**When I reached the point of writing "Hank Stillman arrived":**

### ❓ MISSING DETAILS - USER INPUT NEEDED

#### 1. How Eddie Found Hank
**Outline says:** "man who just met you in a jail hallway" (first meeting)
**Currently missing:** Mechanism for how Eddie found a lawyer at 3 AM
**Question:** How did Eddie locate Hank Stillman?
**Options:**
- a) Bar association referral line (if that exists at 3 AM)
- b) Google search for "criminal lawyer near me"
- c) Called someone else who recommended Hank
- d) Other?

#### 2. Hank's Physical Description
**Outline says:** "parking meter with a law degree" (personality/demeanor)
**Currently missing:** Physical appearance
**Question:** Should Hank have specific physical details?
**Options:**
- a) Keep generic: "man in a suit"
- b) Reinforce "bottom-tier" with tired/cheap appearance
- c) Specific details you provide

#### 3. Hank's Background
**Outline says:** "bottom-tier" lawyer
**Currently missing:** Experience level, case history
**Question:** Has Hank handled murder cases before? Or is this new territory for him?

#### 4. Eddie's Financial Situation
**Outline shows:** Eddie reacts to $15k cost
**Currently missing:** Whether this is actually a strain or just reflexive shock
**Question:** Is $15k a real burden for the business, or do they have it but are just cheap?

**⚠️ AWAITING USER RESPONSE BEFORE PROCEEDING**

---

**Then I would have STOPPED and waited for your answers instead of inventing.**

## Testing the Fix

**Next scene I write, if I need a detail not in files:**

1. Check character files ✅
2. Check notes.md ✅
3. Check outline ✅
4. **[NEW]** Detail still missing → STOP
5. **[NEW]** Create missing details question
6. **[NEW]** Wait for user answer
7. Write scene with user's answer
8. Document in element files

## Why This Will Work

**Before:** Gap → Invent → Continuity Error → Rewrite
**After:** Gap → Ask → User Answers → Correct First Time

**This shifts responsibility for detail creation to the user (where it belongs) and prevents me from making assumptions that contradict your vision.**

## Summary

**What changed:**
- Added "Flag Missing Details" as mandatory pre-writing step
- Updated implement.prompt.md, scene-writing SKILL.md, checklist.md
- Context verification must now flag missing details before proceeding
- Agent STOPS and ASKS instead of inventing

**What this prevents:**
- Fabricated physical descriptions
- Invented relationship histories
- Made-up backgrounds and motivations
- Assumed procedural details
- Unnecessary rewrites

**How to use it:**
When I flag missing details with questions, provide answers. I'll use them to write the scene correctly the first time and document them in the appropriate element files.

---

**This is the second structural fix today: first "verify beat mechanisms," now "ask before inventing."**

**Together, these should dramatically reduce continuity errors.**
