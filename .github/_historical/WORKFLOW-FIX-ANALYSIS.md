# Workflow Issue Analysis & Fix

**Date:** 2025-12-25  
**Issue:** tasks.md generated without checkbox format despite tasks.prompt.md specification  
**Status:** ✅ RESOLVED

---

## Problem Summary

The episode 2 tasks.md file was generated without the checkbox format (`- [ ]` / `- [X]`) that is specified in `.github/prompts/tasks.prompt.md` and used in episode 1.

**Episode 1 format (correct):**
```markdown
- [X] **T001: Setup Episode Directory Structure** — Create episode directory structure
  - **Files/Directories Affected:** ...
```

**Episode 2 format (incorrect - before fix):**
```markdown
**T001 — Create episode directory**
- **Action:** Create `content/episodes/episode-02-the-wedding-weekend/` directory
- **Command:** `New-Item -ItemType Directory -Path "content/episodes/episode-02-the-wedding-weekend"`
```

---

## Root Cause Analysis

### 1. Workflow Disconnect

The draft flow has multiple entry points for generating tasks:

**Intended Flow (per prompts):**
```
idea.prompt.md → clarify.prompt.md → plan.prompt.md → tasks.prompt.md → implement.prompt.md
```

**What Actually Happened:**
- Episode 2 tasks.md was generated on **2025-01-13** (per file metadata)
- The generation likely bypassed tasks.prompt.md or used a custom/manual approach
- The COMPLETION-REPORT.md shows extensive manual rework and restructuring
- Tasks were written with a narrative/documentation style instead of actionable checkbox format

### 2. Prompt File Not Referenced

The plan.prompt.md does not explicitly instruct to use tasks.prompt.md for the next step:

**Current plan.prompt.md:**
- Generates the plan.md file
- Does not mention "next step is to run tasks.prompt.md"
- Relies on user to know the flow

**Gap:** No explicit handoff between workflow stages

### 3. GitHub Copilot Instructions Scope

**Research Findings (from GitHub docs & VS Code docs):**

1. **Repository-wide instructions** (`.github/copilot-instructions.md`):
   - Apply to all Copilot requests in the repository
   - Automatically included in context
   - High-level guidance only

2. **Path-specific instructions** (`.github/instructions/*.instructions.md`):
   - Apply to files matching glob patterns
   - Use frontmatter to specify `applyTo` patterns
   - More targeted than repository-wide

3. **Prompt files** (VS Code specific):
   - Reusable prompts for common tasks
   - Run explicitly by user
   - Can combine with instructions for consistency

**Current Setup:**
- We have `copilot-instructions.md` (repository-wide)
- We have prompt files in `.github/prompts/`
- **Missing:** Explicit mechanism to ensure prompt files are followed

### 4. User Workflow Assumption

The system assumes users will:
1. Know to use `.github/prompts/*.prompt.md` files
2. Follow them in order
3. Reference them explicitly in requests

**Reality:** Users may:
- Ask general questions like "create tasks for episode 2"
- Expect Copilot to automatically follow prompt patterns
- Not realize prompt files need explicit invocation

---

## Solutions Implemented

### 1. Updated copilot-instructions.md (✅ DONE)

Added explicit checkbox format requirement to section 6:

```markdown
- **CRITICAL: When generating tasks.md, ALWAYS use the checkbox format specified in `.github/prompts/tasks.prompt.md`:**
  - Each task MUST start with `- [ ]` for incomplete or `- [X]` for complete
  - Follow the exact format: `- [ ]` **T###: [Task Name]** — [Brief description]`
  - Include **Files/Directories Affected**, **Action**, **Acceptance Criteria**, and **Dependencies** subsections
  - Never deviate from this format or use alternative task list structures
```

### 2. Fixed Episode 2 tasks.md (✅ DONE)

Converted all 23 tasks to proper checkbox format matching episode 1.

---

## Additional Recommendations

### Short-term (High Priority)

1. **Add Workflow Handoffs to Prompts**
   - Update plan.prompt.md to end with: "Next step: Use `.github/prompts/tasks.prompt.md` to generate tasks.md"
   - Update tasks.prompt.md to end with: "Next step: Use `.github/prompts/implement.prompt.md` to execute tasks"
   - Create explicit chain of custody

2. **Create Path-Specific Instructions**
   - Create `.github/instructions/draft-tasks.instructions.md`
   - Specify `applyTo: "drafts/**/tasks.md"`
   - Include checkbox format requirements
   - This will automatically apply when working on tasks.md files

3. **Add Validation Prompt**
   - Create `.github/prompts/validate-tasks.prompt.md`
   - Checks tasks.md against requirements
   - Ensures checkbox format, IDs, dependencies, etc.

### Medium-term (Process Improvement)

4. **Create Draft Flow Automation**
   - Script or agent that enforces stage sequence
   - Validates each artifact before proceeding
   - Prevents skipping stages

5. **Add Examples to Each Prompt**
   - Show complete example output in prompt
   - Harder to deviate from when shown explicit format

6. **Create Quality Gates**
   - Each stage validates previous stage output
   - Tasks.prompt.md validates plan.md exists and is complete
   - Implement.prompt.md validates tasks.md format

### Long-term (Architectural)

7. **Consider Agent Skills (VS Code Insiders)**
   - Agent Skills are the new open standard for AI workflows
   - Would make draft flow portable across tools
   - Could bundle prompts, scripts, and validation together

8. **Create Draft Flow Dashboard**
   - Visual indicator of current stage
   - Validates artifacts at each step
   - Shows what's complete vs pending

---

## GitHub Copilot Best Practices (Research Summary)

### Key Findings from Official Documentation

1. **Custom Instructions Hierarchy:**
   - Personal instructions (highest priority)
   - Repository instructions (`.github/copilot-instructions.md`)
   - Organization instructions (lowest priority)
   - All are combined and provided to Copilot

2. **Path-Specific Instructions:**
   - Use glob patterns to target specific files
   - Frontmatter required: `applyTo: "glob/pattern/**"`
   - Can exclude agents: `excludeAgent: "code-review"` or `"coding-agent"`

3. **Prompt Files (VS Code):**
   - Standalone reusable prompts
   - Must be invoked explicitly
   - Work best when combined with custom instructions

4. **Agent Skills (Preview in VS Code Insiders):**
   - Open standard ([agentskills.io](https://agentskills.io))
   - Folders containing instructions, scripts, resources
   - Portable across GitHub Copilot CLI, coding agent, VS Code
   - More comprehensive than instructions

5. **Best Practices:**
   - Keep instructions under 2 pages
   - Be specific about build/test/validation steps
   - Document project layout and architecture
   - Include common pitfalls and workarounds
   - Use imperative language ("always run...", "never do...")

### Application to This Project

✅ **Currently Using:**
- Repository-wide instructions (copilot-instructions.md)
- Prompt files in .github/prompts/

🔄 **Should Add:**
- Path-specific instructions for drafts/**/tasks.md
- Path-specific instructions for elements/** files
- Validation prompts for each workflow stage

🔮 **Future Consideration:**
- Migrate to Agent Skills when stable
- Would bundle draft flow into portable skill

---

## Testing & Verification

### Verification Steps

1. ✅ Episode 2 tasks.md now has checkbox format
2. ✅ copilot-instructions.md updated with explicit checkbox requirement
3. ⏳ Need to test: Does Copilot automatically apply checkbox format in future tasks.md generation?

### Test Plan

**Test 1: Generate new tasks.md with general request**
```
User: "Create tasks for episode 3 based on the outline"
Expected: Checkbox format automatically used
```

**Test 2: Generate new tasks.md with explicit prompt reference**
```
User: "Follow .github/prompts/tasks.prompt.md to generate tasks for episode 3"
Expected: Checkbox format used (should already work)
```

**Test 3: Regenerate existing tasks.md**
```
User: "Regenerate tasks.md for episode 2"
Expected: Checkbox format preserved
```

---

## Lessons Learned

1. **Explicit is Better Than Implicit**
   - Don't assume Copilot will find and follow prompt files
   - Include critical format requirements in copilot-instructions.md

2. **Workflow Stages Need Handoffs**
   - Each prompt should point to the next stage
   - Users shouldn't need to memorize workflow order

3. **Validate Early and Often**
   - Each stage should validate previous stage
   - Catches deviations before they propagate

4. **Format Requirements Need Duplication**
   - Critical formats should be in:
     - Prompt file (detailed specification)
     - copilot-instructions.md (quick reference)
     - Path-specific instructions (automatic application)

5. **Manual Edits Create Drift**
   - Episode 2 was heavily manually edited (see COMPLETION-REPORT.md)
   - Manual edits bypassed prompts and created inconsistency
   - Need stronger governance or automation

---

## Conclusion

The tasks.md checkbox issue was caused by:
1. Workflow stage disconnect (prompts not explicitly chained)
2. Manual editing without prompt guidance
3. Copilot not automatically applying prompt file formats

**Fixes Applied:**
- Updated copilot-instructions.md with explicit checkbox requirement
- Fixed episode 2 tasks.md to proper format
- Documented issue for future reference

**Next Steps:**
- Add workflow handoffs to each prompt file
- Create path-specific instructions for tasks.md files
- Test with episode 3 to verify fix

---

## References

- [GitHub Docs: Adding custom instructions](https://docs.github.com/en/copilot/customizing-copilot/adding-custom-instructions-for-github-copilot)
- [VS Code Docs: Copilot customization](https://code.visualstudio.com/docs/copilot/copilot-customization)
- [Agent Skills Open Standard](https://agentskills.io)
- Internal: `drafts/draft-flow.md`
- Internal: `.github/prompts/tasks.prompt.md`
