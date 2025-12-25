# Fiction Kit: The Rebound Specialist

A demonstration project showcasing **Fiction Kit**, a draft-driven writing workflow designed for serial fiction. This repository contains the complete development pipeline for *The Rebound Specialist*, a serialized mystery-comedy series.

---

## About Fiction Kit

Fiction Kit is a structured, artifact-based writing system that separates **intent** from **execution**. It treats story development like software development: spec first, build second, iterate deliberately.

### Core Philosophy

- **Stories are specifications**: Define what you want before you write it
- **Ambiguity is expensive**: Clarify early, execute confidently
- **Iteration over improvisation**: Small, targeted changes beat wholesale rewrites
- **Machine-readable progress**: Track work through explicit artifact stages

### The Draft Flow

Fiction Kit organizes story work through distinct stages, each producing a specific artifact:

#### Stage 1: **Idea** → `idea.md`
Define WHAT and WHY without writing prose. Capture the core intent, emotional center, and narrative goal of the draft.

#### Stage 2: **Clarify** → `clarify.md`
Ask up to 5 targeted questions to eliminate ambiguity. Document questions and answers to tighten the spec before planning begins.

#### Stage 3: **Plan** → `plan.md`
Create the structural blueprint: scenes, beats, character movements, tonal shifts. Still no line-level writing—just architecture.

#### Stage 4: **Tasks** → `tasks.md`
Break the plan into atomic, executable tasks with acceptance criteria. Each task is numbered and trackable.

#### Stage 5: **Implement**
Execute tasks by creating or editing files in `elements/**` and `content/**`. Make minimal changes that satisfy the task—no scope creep.

#### Stage 6: **Analyze** → `analyze.md`
Read-only audits for continuity, POV discipline, checklist compliance, and coverage gaps. Append entries; never edit story text in this stage.

#### Stage 7: **Feedback** → `feedback.md`
Editor/QA notes for revision. Record issues and minimal fix lists without rewriting scenes.

### Key Constraints

1. **Source of Truth Hierarchy** (in priority order):
   - Checklist constraints (`elements/checklist.md`)
   - POV and tone rules (`elements/pov.md`, `elements/tone.md`)
   - Voice and style guides (`voice/style.md`, `voice/format.md`)
   - Story elements (`elements/**`)
   - Draft artifacts (`drafts/**`)
   - Published content (`content/**`)

2. **No Guessing**: If critical story decisions are unclear, use the clarify stage. Make minimal assumptions and document them explicitly.

3. **Stage Discipline**: Each stage has allowed actions. Don't write prose during planning; don't rewrite scenes during analysis.

4. **Consistency Rules**: Never contradict established POV, tone, continuity, or checklist requirements. Serial fiction demands tight discipline across installments.

---

## About This Story

### The Rebound Specialist

**Genre**: Serial Mystery-Comedy  
**Format**: Episodic installments (2,000–6,000 words each)  
**Comp**: Gregory McDonald's *Fletch* (dialogue-forward crime with a charismatic lead)

#### Premise

Doogan Andrews is a professional "rebound specialist"—a charming, temporary boyfriend hired to help people move on. When he wakes up beside a dead client and realizes the job was a setup, he and his hustler best friend Eddie must unmask the conspiracy before a skeptical homicide detective decides Doogan isn't just morally questionable—he's criminal.

#### Series Engine

Each episode delivers a complete "rebound job" with comedic mini-arc while advancing the murder investigation through clues, complications, and conspiracy layers. Think client-of-the-week structure with serialized thriller stakes.

#### Key Characters

- **Doogan Andrews**: The rebound specialist. Observant, charming, perpetually in over his head.
- **Eddie Palmer**: Fast-talking pitchman and business partner. Books the jobs, talks Doogan out of (and into) trouble.
- **Abby Palmer**: Eddie's wife. Razor-smart operations boss who runs logistics and keeps the chaos contained.
- **Rodney Baxter**: Eighteen-year-old tech prodigy. Can hack anything except a normal conversation.
- **Detective Paul Martinez**: Ethical homicide detective with deadpan humor and zero patience for Doogan's profession.

#### POV Discipline

The story uses **ensemble third-person close POV**—each scene anchors to one character (usually Doogan). No villain cutaways, no omniscient reveals. The reader learns when the protagonist learns (the *Fletch Rule*). Off-screen events are delivered through briefings, dialogue, interviews, or documents.

---

## Repository Structure

```
fiction-kit-rebound-specialist/
│
├── README.md                      # This file
├── .github/
│   └── copilot-instructions.md    # Governing principles (the "constitution")
│
├── elements/                      # Story foundations
│   ├── arc.md                     # Series arc structure
│   ├── characters.md              # Character summaries
│   ├── checklist.md               # Non-negotiable constraints
│   ├── conflict.md                # Central conflict framework
│   ├── outline.md                 # Master episode outline
│   ├── pitch.md                   # Logline and series pitch
│   ├── plot.md                    # Plot mechanics
│   ├── pov.md                     # POV rules and discipline
│   ├── setting.md                 # World and location details
│   ├── theme.md                   # Thematic threads
│   ├── tone.md                    # Tonal constraints
│   ├── characters/                # Detailed character profiles
│   ├── events/                    # Key story events
│   └── outlines/                  # Per-episode outlines
│
├── voice/                         # Style and format guides
│   ├── format.md                  # Serial fiction format rules
│   └── style.md                   # Writing style guidelines
│
├── drafts/                        # Draft workflow artifacts
│   ├── draft-flow.md              # Workflow documentation
│   ├── _template/                 # Template for new drafts
│   ├── 001-episode-01-draft/      # Episode 1 draft artifacts
│   └── 002-episode-02-draft/      # Episode 2 draft artifacts
│
├── content/                       # Finalized story text
│   └── episodes/
│       ├── episode-01-the-receptionist/
│       │   ├── 01-the-dumping.md
│       │   ├── 02-valet-sweet-goodbye.md
│       │   ├── 03-the-new-client.md
│       │   └── ...                # Additional scenes
│       └── episode-02-*/
│
├── output/                        # Compiled, publishable episodes
│   └── TheReboundSpecialist-Episode01.md
│
└── samples/                       # Reference materials
```

---

## Working with This Repository

### Creating a New Draft

1. Create a new draft folder: `drafts/###-descriptive-name/`
2. Copy the template artifacts from `drafts/_template/`
3. Start with `idea.md`—define intent without writing prose
4. Use `clarify.md` to ask questions and resolve ambiguity
5. Build `plan.md` with structural blueprint
6. Break down into atomic tasks in `tasks.md`
7. Execute implementation, updating `elements/**` and `content/**`
8. Run analysis and gather feedback

### Episode Structure

Individual scenes live in numbered markdown files:
```
content/episodes/episode-##-title/
  ├── 01-scene-name.md
  ├── 02-scene-name.md
  └── ...
```

Compile finalized episodes into single files for publication:
```
output/episode-##-title.md
```

### Core Principles for Contributors

1. **Follow the constitution**: `.github/copilot-instructions.md` governs all work
2. **Respect stage boundaries**: Don't write prose during planning; don't rewrite during analysis
3. **Maintain consistency**: Check against POV, tone, checklist, and existing content
4. **Make minimal changes**: Satisfy the task without expanding scope
5. **Document assumptions**: If you must proceed with uncertainty, list explicit assumptions

---

## Why This Approach?

Traditional creative writing advice often treats structure and spontaneity as opposites. Fiction Kit treats them as collaborative: **structure enables spontaneity by removing decision fatigue**.

By separating planning from execution:
- Writers spend less time second-guessing mid-draft
- Consistency stays tight across serialized installments
- Revisions are targeted, not wholesale
- Progress is visible and trackable
- Collaboration becomes easier (clear handoff points)

Fiction Kit doesn't eliminate the creative "discovery" process—it gives it a contained space (the Discovery Draft phase from `draft-flow.md`) while protecting the structural integrity of the larger work.

---

## License & Usage

This repository demonstrates Fiction Kit's workflow using original creative work. The system itself is a methodology, not software—adapt it to your own projects as needed.

The story content (*The Rebound Specialist*) is an original creative work. Standard creative rights apply.

---

## Questions or Contributions

This is a living demonstration project. If you're exploring Fiction Kit for your own serial fiction work, feel free to use this structure as a reference.

**Key Files to Study**:
- `.github/copilot-instructions.md` — The governing ruleset
- `drafts/draft-flow.md` — Discovery-first drafting philosophy
- `voice/format.md` — Serial fiction format rules
- `elements/checklist.md` — Non-negotiable story constraints

---

**Fiction Kit**: Treat your story like a specification. Build it like software. Ship it like a product.
