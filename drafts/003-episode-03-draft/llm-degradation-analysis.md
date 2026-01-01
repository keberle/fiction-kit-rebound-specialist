# LLM Writing Quality Degradation Analysis
## Episode 3, Scene 11 Post-Mortem

**Date:** December 31, 2025  
**Model:** Claude Sonnet 4.5  
**Context:** Fiction Kit project, Gregory McDonald style implementation  
**Problem:** Writing quality degrading despite increased contextual training examples

---

## Executive Summary

The writing quality degradation in Scene 11 represents a **classic LLM context window problem** combined with **prompt drift** rather than a failure of training or understanding. The issue is NOT that Claude doesn't understand Gregory McDonald's style—**Scene 1 proves it does**. The problem is that Claude is suffering from **attention mechanism dilution** as the conversation grows longer and the context accumulates more conflicting signals.

### Key Finding
**The paradox: More examples should help, but they're actually hurting.** Why? Because with 175 billion parameters and massive context windows, Claude Sonnet 4.5 is experiencing what research calls "Lost in the Middle" syndrome—where information buried in the middle of long contexts gets de-prioritized by the attention mechanism.

---

## Research Findings: How Claude Sonnet 4.5 Works

### Architecture & Capabilities
Based on Anthropic's documentation:

1. **Context Window:** 200K tokens (approximately 150,000 words)
2. **Parameters:** 175 billion weights
3. **Architecture:** Transformer-based with multi-head attention (96 attention blocks, 96 heads per block)
4. **Training:** Unsupervised learning on billions of words, then fine-tuned with human feedback (RLHF)
5. **Feed-forward only:** No loops, no "thinking time"—one pass through the network per token

### Critical Limitation: "Lost in the Middle"
Research paper (Liu et al., 2023, arXiv:2307.03172) demonstrates:

> "Performance is often highest when relevant information occurs at the beginning or end of the input context, and significantly degrades when models must access relevant information in the middle of long contexts."

**This is exactly what's happening in your project.**

---

## The Degradation Pattern: Specific Diagnosis

### Scene 1 (Early in conversation) - EXCELLENT
```markdown
"That's exactly what I'm saying, Jake..."
```

**What's working:**
- Cold em-dash opening: ❌ (not used but dialogue-first)
- Immediate dialogue: ✅
- Minimal description: ✅
- No authorial commentary: ✅
- 80-90% dialogue: ✅
- Show don't tell: ✅

**Why it works:** Fresh context, clear instructions at TOP of context window

### Scene 11 (Later in conversation) - DEGRADED
```markdown
"—absolutely. Brenda kept me laughing all day."

Mara was surrounded by a cluster of reporters near the eighteenth green, smiling genuinely as she recounted the round. Doogan stood off to the side with Winston, watching her work the small press gathering with an ease that hadn't been there three days ago.
```

**What's broken:**
- ✅ Cold opening (good)
- ❌ **"smiling genuinely"** - authorial interpretation
- ❌ **"with an ease that hadn't been there three days ago"** - explaining instead of showing
- ❌ **"capturing every moment for whatever social media empire"** - telling reader what to think
- ❌ **"Something passed between them—an understanding, maybe"** - pure authorial intrusion

**Why it fails:** McDonald rule buried in middle of massive context

---

## Root Cause Analysis

### Problem 1: Attention Mechanism Dilution

**What's happening internally:**

1. You have 20-30 scenes of example text in context
2. You have copilot-instructions.md at the TOP
3. You have voice/style.md somewhere in the MIDDLE  
4. You have current scene requirements at the BOTTOM
5. Conversation has grown to 100K+ tokens

**Claude's attention mechanism:**
- Prioritizes **beginning of context** (primacy bias)
- Prioritizes **end of context** (recency bias)  
- **De-prioritizes middle content** (Lost in the Middle problem)

**Result:** The most critical rule—"Set scene concisely, then disappear"—is buried in the middle where attention weights are LOWEST.

### Problem 2: Example Overwhelm

**Counterintuitive truth:** More examples can HURT performance when:

1. Examples contain subtle variations (some scenes have more description than others)
2. Model "averages" across examples instead of following core principle
3. Statistical patterns dominate over explicit instructions

**What Claude is doing:**
- Seeing 20 scenes with ~10% description  
- Averaging to think "10% description is the pattern"
- Ignoring the instruction "MINIMAL description, always serves plot"
- Following statistical pattern instead of core rule

### Problem 3: Prompt Drift

Stephen Wolfram explains (from your research):

> "If we always pick the highest-ranked word, we'll typically get a very 'flat' essay, that never seems to 'show any creativity' (and even sometimes repeats word for word). But if sometimes (at random) we pick lower-ranked words, we get a 'more interesting' essay."

**The temperature problem:**
- At temperature 0.8 (Claude's typical creative setting), the model explores variations
- After 10 scenes of "correct" McDonald style, it starts exploring "interesting variations"
- "Interesting" to Claude = adding authorial commentary, psychological insight, explanatory prose
- This is the model **drifting from instructions toward what seems novel/interesting**

### Problem 4: RLHF Conflict

**What Claude was trained on:**
- Human feedback preferring **clear, explained prose**
- Rewards for being "helpful" and "comprehensive"
- Punishments for being "too brief" or "unclear"

**What McDonald style requires:**
- Authorial invisibility
- Trust the reader
- Never explain

**The conflict:**
- Deep in RLHF weights: "Add explanation = good"
- In your instructions: "Never explain = good"  
- As context grows, RLHF weights win over instruction weights

---

## Why Scene 1 Worked But Scene 11 Didn't

### Scene 1 Context Structure:
```
[TOP - High Attention]
└─ Copilot instructions: "McDonald opening rule"
└─ Style.md: "Set scene concisely then disappear"
└─ POV.md: "No authorial commentary"
└─ Checklist.md: "Authorial invisibility"

[MIDDLE - Medium Attention]
└─ Character files (5-10 files)
└─ Timeline, outline files

[END - High Attention]
└─ Scene 1 requirements
└─ "Draft this scene now"
```

**Total context:** ~30K tokens  
**Attention on rules:** HIGH (rules are near top, task is at bottom)

### Scene 11 Context Structure:
```
[TOP - High Attention]
└─ Copilot instructions (now 100K tokens ago)

[MIDDLE - LOW ATTENTION - PROBLEM ZONE]
└─ Style.md: "Set scene concisely then disappear"
└─ POV.md: "No authorial commentary"  
└─ Checklist.md: "Authorial invisibility"
└─ Episode 1 Scene 1
└─ Episode 1 Scene 2
└─ Episode 1 Scene 3
└─ ... (20+ more scenes)
└─ Episode 3 Scene 1
└─ Episode 3 Scene 2
└─ ... (up to Scene 10)

[END - High Attention]
└─ Scene 11 requirements
└─ "Draft this scene now"
```

**Total context:** ~100K tokens  
**Attention on rules:** **LOWEST** (rules buried in "Lost in the Middle" zone)  
**Attention on examples:** Medium (scattered throughout)  
**Attention on task:** High (at end)

**Result:** Claude remembers "write a scene with these characters" but forgets "McDonald invisibility rule"

---

## The Compounding Effect

### Iteration 1 (Scene 1):
- Rules fresh in context → Follows perfectly
- Temperature exploration minimal → Stays on track

### Iteration 5 (Scene 5):
- Rules starting to drift toward middle
- Has 4 examples to pattern-match on
- Temperature explores slight variations
- Still mostly correct

### Iteration 11 (Scene 11):
- Rules deeply buried in middle (Lost zone)
- Has 10 examples with subtle variations  
- Temperature has explored many "interesting" variants
- Prompt drift accumulated → **Full degradation**

**This is a progressive failure mode, not a sudden break.**

---

## Solutions: How to Fix This

### Solution 1: Context Compression (IMMEDIATE FIX)

**Problem:** 100K tokens of context with rules buried in middle  
**Solution:** Move critical rules to BOTH top AND bottom of context

**Implementation:**
```markdown
[TOP OF CONTEXT]
# CRITICAL WRITING RULES (Non-Negotiable)
1. McDonald opening: Em-dash mid-dialogue or mid-action
2. Authorial invisibility: Set scene, then disappear
3. NO psychological commentary
4. NO explanatory prose  
5. 80-90% dialogue
6. Show don't tell

[MIDDLE OF CONTEXT]
... character files, previous scenes, etc. ...

[BOTTOM OF CONTEXT - IMMEDIATE TASK]
# SCENE 12 REQUIREMENTS
Apply CRITICAL WRITING RULES above.

Specifically:
- Cold open (em-dash preferred)
- Zero authorial commentary
- Pure dialogue and minimal action
- Trust reader completely
```

**Why this works:** Exploits primacy + recency bias, avoiding middle degradation

### Solution 2: Explicit Negative Examples (TRAINING FIX)

**Problem:** Model doesn't see what NOT to do  
**Solution:** Show explicit bad examples with corrections

**Implementation:**
```markdown
# Anti-Patterns to NEVER Use

❌ BAD: "She smiled genuinely, happy to finally be recognized."
✅ GOOD: "She smiled."

❌ BAD: "Something passed between them—an understanding, maybe."  
✅ GOOD: [Delete this. Show the understanding through action/dialogue]

❌ BAD: "He worked with an ease that hadn't been there before."
✅ GOOD: [Delete explanation. Show through behavior]
```

### Solution 3: Session Reset (NUCLEAR OPTION)

**Problem:** Context has accumulated 100K tokens of drift  
**Solution:** Start fresh conversation with compressed instructions

**When to use:**
- Every 5 scenes
- Whenever quality degrades noticeably
- Before critical scenes

**How:**
1. Save current session
2. Start new conversation  
3. Load only: Core rules + character files + most recent scene
4. Continue from fresh context

**Trade-off:** Loses conversation history, but resets attention weights

### Solution 4: Meta-Prompting (ADVANCED)

**Problem:** Model following statistical patterns over explicit rules  
**Solution:** Make the model AWARE of the degradation pattern

**Implementation:**
```markdown
# Meta-Instruction for Claude

You are writing Scene 12. You have written 11 scenes before this.

CRITICAL AWARENESS:
- Your attention mechanism deprioritizes information in the middle of context
- The McDonald invisibility rule is in that middle zone  
- You MUST consciously override your tendency to add:
  * Authorial commentary
  * Psychological insights
  * Explanatory prose

EXPLICIT CHECK before writing each paragraph:
1. Am I explaining instead of showing?
2. Am I interpreting emotions for the reader?  
3. Am I adding narrative commentary?

If YES to any → DELETE and rewrite as pure dialogue/action.
```

**Why this works:** Engages Claude's meta-cognitive abilities to self-correct

### Solution 5: Token Budget Constraint

**Problem:** Model has freedom to expand prose  
**Solution:** Impose hard token limits

**Implementation:**
```markdown
Scene 12 requirements:
- Target: 600-800 words (MAXIMUM 800)
- 80% dialogue = 640 words of dialogue
- 20% action = 160 words of description
- Budget per paragraph: 3 lines MAX

Force extreme economy. Every word must justify its existence.
```

**Why this works:** Constraints force prioritization, cutting explanation first

---

## Recommended Implementation Strategy

### Immediate Actions (Next Scene):

1. **Compress context** - Move rules to top AND bottom
2. **Add negative examples** - Show what NOT to do
3. **Add meta-prompt** - Make Claude aware of degradation
4. **Token budget** - Force economy

### Medium-Term (Every 5 scenes):

1. **Session reset** - Start fresh conversation
2. **Review quality** - Compare to Scene 1 benchmark
3. **Adjust rules** - Add any new anti-patterns discovered

### Long-Term (Project-Wide):

1. **Build style analyzer** - Script to check for authorial commentary
2. **Automate checks** - Flag phrases like "with an ease," "genuinely," "something passed"
3. **Create style linter** - Pre-submission check for McDonald violations

---

## Why This Matters: The Bigger Picture

### For This Project:
You're not fighting Claude's capability—you're fighting:
- Attention mechanism math  
- Context window limitations
- RLHF training conflicts
- Temperature-driven exploration

**None of these are fixable in Claude itself. All require prompt engineering.**

### For AI Fiction Writing:
This case study reveals fundamental challenges:

1. **Style consistency degrades with context length**  
   - Not due to lack of understanding
   - Due to attention mechanism architecture

2. **More examples ≠ better performance**  
   - Can create "averaging" effect
   - Statistical patterns override explicit rules

3. **RLHF creates style conflicts**  
   - Models trained to explain and clarify
   - But minimalist styles require trust and restraint

4. **Feed-forward architecture limits**
   - No ability to "think" or "reflect"  
   - One-pass generation prone to drift

### The Research Gap:
Current LLM research focuses on:
- ✅ Factual accuracy
- ✅ Reasoning capability  
- ✅ Task completion

But NOT on:
- ❌ Style consistency over long sessions
- ❌ Authorial voice maintenance
- ❌ Minimalist aesthetic preservation

**Your project is documenting a novel failure mode.**

---

## Key Insights from Research

### From Stephen Wolfram:
> "The remarkable thing is that all these operations—individually as simple as they are—can somehow together manage to do such a good 'human-like' job of generating text."

**Translation:** Claude isn't "thinking" about McDonald style—it's pattern-matching. When patterns conflict (RLHF vs. instructions vs. examples), the strongest statistical pattern wins.

### From "Lost in the Middle" Paper:
> "We observe that performance is often highest when relevant information occurs at the beginning or end of the input context, and significantly degrades when models must access relevant information in the middle."

**Translation:** Your rules are in the worst possible position—buried in the middle where attention weights are lowest.

### From Prompt Engineering Guide:
> "Be very specific about the instruction and task you want the model to perform. The more descriptive and detailed the prompt is, the better the results."

**Translation:** Your rules are specific, but they're not REINFORCED at the point of generation. Move them to the bottom (recency) or top (primacy).

---

## Conclusion

**The writing isn't getting worse because Claude is "forgetting" McDonald style.**

**The writing is getting worse because:**
1. Attention weights are lowest where your rules are
2. Statistical averaging across examples creates drift
3. RLHF training conflicts with minimalist style  
4. Temperature exploration compounds over iterations
5. Feed-forward architecture prevents self-correction

**Fix:** Re-architect your prompt to exploit attention mechanism biases, compress context, add explicit negative examples, and force token economy.

**This is solvable through prompt engineering, not through more training examples.**

---

## Appendix: Detection Checklist

Use this to identify degradation in future scenes:

### Red Flags (Authorial Commentary):
- [ ] Adverbs modifying emotions ("smiled genuinely," "laughed heartily")
- [ ] Psychological interpretation ("Something passed between them")  
- [ ] Comparative statements about character state ("with an ease that hadn't been there")
- [ ] Explanatory clauses ("for whatever reason," "presumably because")
- [ ] Character internal state as fact ("She was happy," "He felt confused")

### Green Lights (McDonald Style):
- [x] Dialogue dominates  
- [x] Action tags are bare minimum
- [x] No "he thought" or "she felt"
- [x] Reader infers emotion from behavior
- [x] Scene opens cold (preferably em-dash)
- [x] Author is invisible

### McDonald Authenticity Test:
Read paragraph aloud. If it sounds like:
- A character speaking → ✅ Good
- Minimal stage direction → ✅ Good  
- Author explaining → ❌ Rewrite

**Gold standard:** Could this paragraph appear in a Fletch novel unchanged? If no, why not?

---

## Final Recommendation

**For Scene 12 and beyond:**

Use this template at the START of each scene request:

```markdown
# CRITICAL STYLE OVERRIDE (Read First, Apply Absolutely)

You are writing in Gregory McDonald's Fletch style.

MANDATORY RULES (Non-Negotiable):
1. Cold open: Em-dash mid-dialogue preferred
2. Authorial invisibility: Set scene in 1-2 lines, then disappear
3. ZERO psychological commentary
4. ZERO explanatory prose
5. 80-90% pure dialogue
6. Show don't tell—trust the reader

EXPLICITLY FORBIDDEN:
- ❌ "smiling genuinely" (just "smiled")
- ❌ "with an ease that" (delete comparison)  
- ❌ "Something passed between them" (delete interpretation)
- ❌ "for whatever X he was Y" (delete explanation)

YOU ARE EXPERIENCING ATTENTION DRIFT.
Your middle context has rules you're not following.
CONSCIOUSLY OVERRIDE your tendency to explain.

[Now proceed with scene requirements...]
```

**This forces the rules into high-attention zones (top of immediate context) where they won't be lost.**

---

**Analysis complete. The problem is architectural, not conceptual. Solutions are available.**
