# Comprehensive Rewrite & Story Consistency Guide

A structured rewrite process inspired by Stephen King's editing philosophy, extended to ensure all story elements and drafts remain consistent after substantial scene changes. This process ensures that any detail added, changed, or removed in a scene is properly propagated throughout the entire repository.

***

## 1. Rewrite Philosophy

*   First draft = discovery.
*   Second draft = clarity, compression, and truth.
*   "To write is human, to edit is divine."
*   Cut ruthlessly. Tighten everything.
*   Consistency across all story elements is essential.
*   **Every detail change must be absorbed into canonical element files.**

***

## 2. Rewrite & Update Algorithm

### Step 1 — Identify the Scene for Rewrite

*   Specify the scene to be rewritten.
*   Clarify the emotional core, character motivations, and key changes in the scene.
*   **Document what new details are being added** (character traits, possessions, locations, backstory, etc.)

### Step 2 — Analyze Impact (Comprehensive Scan)

**A. Identify All New Details Being Added:**
*   Character physical descriptions (clothing, vehicles, accessories, etc.)
*   Character behaviors or habits
*   Location details or setting elements
*   Backstory or timeline information
*   Relationships or dynamics
*   World-building details
*   Recurring objects or symbols

**B. Timeline & Knowledge Verification (CRITICAL):**
*   **When does this scene occur in the story timeline?**
*   **What does the POV character know at THIS point?**
*   **Where would they have learned this information?** (witnessed, told, researched)
*   **Are you inventing details not in character files?** (If yes, STOP and verify)
*   **Is the character an antagonist/villain?** (Extra caution: many details may be lies or unknowable)
*   **Check character file for "What Characters Know & When" sections**

**C. Determine Affected Files:**
*   Which character files in `elements/characters/` need updates?
*   Does `elements/setting.md` need new location or cultural details?
*   Does `elements/notes.md` need continuity tracking?
*   Which episode outlines in `elements/outlines/` reference this character/location/detail?
*   Does the current draft folder (`drafts/<###-name>/`) need updates to plan, tasks, or analysis?
*   Does `elements/timeline.md` or `elements/events/` need updates?

**D. Scan Existing Content:**
*   Search `content/**` for all scenes that mention the affected character(s) or location(s)
*   Identify potential continuity conflicts or opportunities for callback consistency

### Step 3 — Update Element Files (Make Details Canonical)

**For each new detail added in the rewrite:**

**A. Character Updates (`elements/characters/<name>.md`):**
*   Add physical details (vehicles, clothing style, accessories) to Physical Characteristics section
*   Add habits or behaviors to Personality Traits or Background sections
*   Add possessions (car make/model/color, tech, signature items) clearly documented
*   Add relationships or dynamics to Relationships section
*   Mark source: "*(Established in Episode #, Scene #)*"

**B. Setting Updates (`elements/setting.md`):**
*   Add new locations with descriptions
*   Add cultural details or social norms
*   Add recurring venues or landmarks

**C. Continuity Tracking (`elements/notes.md`):**
*   Document any detail that might be referenced later
*   Track clues, foreshadowing, or planted information
*   Note callbacks or recurring motifs

**D. Episode Outline Updates (`elements/outlines/episode-##.md`):**
*   Update scene beat descriptions to reflect the rewritten version
*   Adjust outline if scene structure or purpose has changed
*   Add notes about new details that affect future scenes

**E. Event/Timeline Updates (`elements/events/` or `elements/timeline.md`):**
*   If rewrite changes chronology or adds backstory events
*   If rewrite establishes new timeline anchors

### Step 4 — Update Current Draft Folder

**A. Update `drafts/<###-name>/plan.md`:**
*   If rewrite changes scene structure or approach
*   If new details affect execution strategy

**B. Update `drafts/<###-name>/tasks.md`:**
*   Mark completed tasks
*   Add new tasks if rewrite reveals additional work needed
*   Update acceptance criteria for related tasks

**C. Update `drafts/<###-name>/analyze.md`:**
*   Add analysis entry documenting the rewrite and its impact
*   Note what was changed and why
*   Document what element files were updated

**D. Update `drafts/<###-name>/feedback.md`:**
*   If rewrite addresses previous feedback items

### Step 5 — Scan and Audit Content Folder

**A. Search for Affected Characters:**
*   Use grep/search to find all mentions of the character across `content/**`
*   Review each scene that mentions the character
*   Flag any scenes that might need updates for consistency
*   Flag opportunities for callback details (e.g., if character now has a signature car, should it appear in other scenes?)

**B. Search for Affected Locations:**
*   Find all scenes set in the same location
*   Ensure descriptions remain consistent
*   Note opportunities to reference new details

**C. Search for Related Themes/Objects:**
*   If a new recurring object is introduced (e.g., specific car model, accessory)
*   Check if it should appear in other scenes for consistency

### Step 6 — Rewrite the Scene

*   Rewrite the scene, factoring in all changes from the updated elements and draft documents.
*   Follow the King-style rewrite process:
    *   Read for story and clarity.
    *   Cut 10–20% for conciseness.
    *   Strengthen language and sensory detail.
    *   Ensure the scene's function is clear.
    *   Polish for rhythm, dialogue, and pacing.

### Step 7 — Final Consistency Check

**A. Cross-Reference Element Files:**
*   Verify all new details are documented in appropriate element files
*   Verify character files are complete and accurate
*   Verify setting details are captured

**B. Verify Draft Folder:**
*   Confirm plan, tasks, and analyze files reflect the rewrite

**C. Review Content Implications:**
*   Review flagged scenes for potential updates
*   Decide if additional scenes need rewrites for consistency
*   Document any follow-up work needed

**D. Final Harmony Check:**
*   Ensure the scene and all elements are in harmony.
*   Make final tweaks as needed.

### Step 8 — Output Documentation

**Provide a summary of all updates:**
1. **Scene Rewritten:** `path/to/scene.md`
2. **Element Files Updated:**
   - `elements/characters/<name>.md` - Added [detail]
   - `elements/setting.md` - Added [detail]
   - `elements/notes.md` - Added [detail]
3. **Draft Folder Updated:**
   - `drafts/<###>/plan.md` - [changes]
   - `drafts/<###>/analyze.md` - Added rewrite entry
4. **Content Folder Impact:**
   - Flagged scenes for review: [list]
   - Recommended follow-up rewrites: [list]
5. **Continuity Notes:**
   - [Any implications for future scenes]

***

## 3. Rewrite Prompts

*   "What can be cut without losing meaning?"
*   "Where is the language flabby?"
*   "Is this the strongest verb available?"
*   "What sensory detail grounds this moment?"
*   "Does this scene earn its place?"
*   "Have all related documents been updated to reflect these changes?"
*   "Is the story world consistent after this rewrite?"
*   **"What new details have I added, and are they documented in element files?"**
*   **"Do any other scenes need updates to maintain consistency with this change?"**
*   **"Have I searched content/ for all mentions of affected characters/locations?"**
*   **"What does the POV character actually KNOW at this point in the timeline?"**
*   **"Where would they have learned this information? Did I show it?"**
*   **"Am I inventing character details not in the character files?"**
*   **"Is this an antagonist? Are these details true, lies, or unknowable?"**

***

## 4. Usage Instructions

1.  Select the scene to rewrite.
2.  **Document what details you're adding/changing** (physical descriptions, possessions, behaviors, etc.)
3.  Follow the algorithm above, updating:
    - **Element files** (`elements/characters/`, `elements/setting.md`, `elements/notes.md`, etc.)
    - **Draft folder** (`drafts/<###>/plan.md`, `tasks.md`, `analyze.md`)
    - **Search content folder** for impact
4.  Use the prompts to guide your editing and consistency checks.
5.  **Output all updated files** (scene + element files + draft files)
6.  **Provide documentation summary** of all changes

***

## 5. Critical Rules

1. **Every new detail must become canonical** - Add it to the appropriate element file(s)
2. **Character possessions must be documented** - Cars, clothing style, signature items go in character files
3. **Search for impact** - Always grep/search content/ for character mentions after rewrite
4. **Document the cascade** - Track what files were updated and why in analyze.md
5. **Output everything** - Provide both the rewritten scene AND all updated element/draft files
6. **Timeline awareness is mandatory** - Character can ONLY know what they've learned by this point in story
7. **No invented backstory** - If not in character file, don't make it up; leave vague or explicitly unknown
8. **Verify before writing** - Check character files BEFORE writing any character detail
9. **Antagonist extra caution** - With villains/deceptive characters, track what's true vs lies vs unknowable
10. **Information source required** - If character knows something, show where that knowledge came from

***
