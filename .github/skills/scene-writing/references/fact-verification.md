# Fact Verification Protocol

## Purpose

Prevent contradictions when characters reference prior events, conversations, or established details.

---

## The Problem

When writing dialogue that references prior scenes, it's easy to:
- Invent details that "sound right" but contradict canon
- Misremember specific amounts, times, or statements
- Add narrative flourishes that contradict established facts

**Example violation:**
- Scene 1: Jake says "three or four thousand should do it"
- Scene 3: Jake says "That was more than we discussed" (when bid was $3,000)
- Problem: $3,000 is exactly what they discussed

---

## Pre-Writing Fact Extraction (MANDATORY)

### Step 1: Identify References

Before writing Scene N, ask:
1. What prior events will be mentioned in dialogue?
2. What conversations will characters reference?
3. What amounts, times, or specific details will be stated?
4. Are there any "you said" or "we discussed" moments?

### Step 2: Create Fact Reference Table

For each reference, document:

```markdown
**FACT REFERENCE TABLE**

Reference #1: [Description]
- Will appear as: [planned dialogue or narrative]
- Source: Scene X, lines Y-Z
- Established detail: [exact quote or specific fact]
- Constraint: [what this scene MUST NOT contradict]

Reference #2: [Description]
- Will appear as: [planned dialogue or narrative]
- Source: Scene X, lines Y-Z
- Established detail: [exact quote or specific fact]
- Constraint: [what this scene MUST NOT contradict]
```

**Example:**

```markdown
**FACT REFERENCE TABLE**

Reference #1: Jake comments on auction bid
- Will appear as: Jake's reaction to $3,000 bid
- Source: Scene 1, lines 85-86
- Established detail: Jake said "Whatever it takes. Three or four thousand should do it."
- Constraint: Jake CANNOT say it was more than expected. $3,000 is low end of range.

Reference #2: Doogan mentions golf round with Jake
- Will appear as: "This afternoon" (when Mara asks when he last played)
- Source: Scene 1, entire scene
- Established detail: They played 14th hole at Willow Creek on Sunday afternoon
- Constraint: MUST be consistent with "this afternoon" if gala is Sunday evening
```

### Step 3: Keep Table Visible During Writing

- Have fact reference table open while drafting
- Before writing any line that references prior events, check table
- Verify statement matches established detail

---

## During-Writing Verification

### Red Flag Phrases (Trigger Verification)

When you write ANY of these phrases, STOP and verify:

**Direct references:**
- "like we discussed"
- "like you said"
- "you told me"
- "we agreed"
- "last time"
- "earlier"
- "remember when"

**Comparative statements:**
- "more than expected"
- "less than we thought"
- "different from what"
- "not what we planned"

**Factual claims about prior events:**
- Specific amounts ("three thousand")
- Specific times ("this morning," "yesterday")
- Specific locations ("at the golf course")
- Specific statements ("when you mentioned")

### Verification Process

1. **STOP** - Don't finish the sentence
2. **LOCATE** - Find the prior scene being referenced
3. **READ** - Read the actual passage (not from memory)
4. **VERIFY** - Does your line match the established fact?
5. **ADJUST** - If mismatch, rewrite or cut the reference

---

## Post-Writing Fact Audit (MANDATORY)

After completing scene draft:

### Step 1: Search for Reference Phrases

Scan entire scene for:
- "you said"
- "we discussed"
- "like we talked about"
- "earlier"
- "last time"
- "remember"
- "you mentioned"
- Any statement comparing current scene to prior events

### Step 2: Verify Each One

For each found phrase:
1. Identify what prior event is being referenced
2. Locate source scene and exact lines
3. Confirm reference matches established detail
4. If contradiction found: mark for revision

### Step 3: Document Violations

```markdown
**FACT AUDIT VIOLATIONS**

Line [X]: "[quote from scene]"
- References: Scene Y, lines Z
- Established detail: [what actually happened]
- Problem: [contradiction description]
- Fix: [corrected version]
```

---

## Common Violation Patterns

### Pattern 1: Comparative Statements Without Basis

❌ **Violation:**
```
Jake: "That was more than we discussed."
```

**Why it's wrong:** Implies bid exceeded expectations, but Scene 1 established $3-4k range. $3k is low end.

✅ **Fix options:**
```
Jake: "Three thousand. Right in the middle."
Jake: "You got it for three. That works."
[Jake doesn't comment on amount at all]
```

### Pattern 2: Invented Details in References

❌ **Violation:**
```
Doogan: "Like you said at lunch, she's complicated."
```

**Why it's wrong:** Scene 1 shows they were playing golf, not at lunch.

✅ **Fix:**
```
Doogan: "Like you said at the course, she's complicated."
```

### Pattern 3: Time/Amount Precision Without Source

❌ **Violation:**
```
"Six hours ago, you told me..."
```

**Why it's wrong:** Unless Scene 1 had explicit timestamp, you can't calculate "six hours ago" precisely.

✅ **Fix:**
```
"Earlier today, you told me..."
"This afternoon, you told me..."
```

### Pattern 4: Emotional Tone Mismatch

❌ **Violation:**
```
"You seemed worried when we talked."
```

**Why it's wrong:** If source scene shows character was calm/confident, this contradicts.

✅ **Fix:** Re-read source scene, verify tone, then reference accurately.

---

## Integration with Scene-Writing Workflow

### Add to Pre-Writing Checklist:

- [ ] Reviewed outline beats for Scene N
- [ ] Identified all references to prior events
- [ ] Created Fact Reference Table
- [ ] Located source scenes and line numbers
- [ ] Extracted exact quotes/details
- [ ] Documented constraints for each reference

### Add to During-Writing:

- [ ] Keep Fact Reference Table visible
- [ ] Check table before writing reference phrases
- [ ] Verify each comparative statement
- [ ] Confirm amounts/times/locations match sources

### Add to Post-Writing:

- [ ] Searched scene for all reference phrases
- [ ] Verified each reference against source
- [ ] Documented any violations found
- [ ] Revised contradictions before finalization
- [ ] Re-ran audit until zero violations

---

## Validation Questions

Before finalizing any scene:

1. **Did I reference any prior conversations?**
   - If yes: Did I verify each one against source scene?

2. **Did I use "you said" or "we discussed"?**
   - If yes: Did I read the actual prior dialogue?

3. **Did I mention specific amounts, times, or locations?**
   - If yes: Did I verify these match established details?

4. **Did I make comparative statements ("more than," "less than")?**
   - If yes: Did I verify the baseline being compared?

5. **Did I attribute emotional states to prior scenes?**
   - If yes: Did I re-read source to verify tone?

---

## When to Skip Verification

You can skip this protocol when:
- ✅ Scene has NO references to prior events
- ✅ Scene is chronologically first (nothing to reference)
- ✅ All dialogue is about present moment only

You CANNOT skip when:
- ❌ Characters mention past conversations
- ❌ Narrative references prior events
- ❌ Dialogue includes "you said" or similar phrases
- ❌ Scene includes amounts/times established earlier

---

## Goal

**Zero contradictions of established facts.**

Every reference to prior events must be verified against source scenes before publication.
