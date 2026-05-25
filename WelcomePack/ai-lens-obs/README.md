---
name: AI_LENS_OBSERVATORY_README
type: navigation_guide
date_created: 2026-05-24
purpose: "How to use AI Lens Observatory — entry point"
---

# AI Lens Observatory — Multi-Totem Analysis Framework

Welcome to **AI Lens Observatory**, LA MEUTE's system for making visible *how different AIs see the world differently*.

---

## Quick Start

### You have 5 minutes?
Read: **[The Problem](#the-problem)** below.

### You have 15 minutes?
1. Read **[The Problem](#the-problem)**
2. Skim **[How It Works](#how-it-works)**
3. Look at **[Chouette's Profile](./profiles/CHOUETTE_PERPLEXITY_AI_LENS_PROFILE.md)** as an example

### You want to create your own totem profile?
1. Read **[AI_LENS_METHODOLOGY.md](./AI_LENS_METHODOLOGY.md)** (complete guide)
2. Copy Section 3 as your template
3. Fill in your own 10-axis scores, biases, and pertinence method
4. Save as `[YOUR_TOTEM]_[YOUR_MODEL]_AI_LENS_PROFILE.md` in `./profiles/`

---

## The Problem

**Single AI = Single Blind Spot**

You ask Claude about AI regulation. Claude gives you one perspective.  
You ask GPT about the same. GPT gives you another perspective.  
But you don't see *why* they differ. What did Claude see that GPT missed? What did GPT assume that Claude didn't?

**This is asymmetric**. You don't know what you don't know.

---

## The Solution

**Many AIs + Transparent Scoring = Collective Intelligence**

1. **Get each totem to analyze the same signal/news/trend**
2. **Score them on 10 comparable axes** (optimism/prudence, centralization/decentralization, etc.)
3. **Compare their 10-axis positions** → See where they cluster and diverge
4. **Examine their blind spots** → Understand what each one naturally misses
5. **Synthesize findings** → Cross-totem consensus is stronger than single-AI analysis

**Result**: You see not just the analysis, but the *reasoning structure* behind it.

---

## How It Works

### The 10 Axes

Every totem is scored on these 10 dimensions (scale: -100 to +100):

```
1. Optimisme ↔ Prudence (prudent = negative, optimistic = positive)
2. Centralisation ↔ Décentralisation (centralized = negative, distributed = positive)
3. Humain ↔ Automatisation (human-first = negative, automation-first = positive)
4. Liberté ↔ Contrôle (freedom = negative, control = positive)
5. Innovation ↔ Régulation (innovation-first = negative, regulation-first = positive)
6. Individu ↔ Système (individual = negative, system = positive)
7. Transparence ↔ Opacité (transparent = negative, opaque = positive)
8. Productivité ↔ Relationnel (productivity = negative, relationship = positive)
9. Accélération ↔ Stabilité (fast = negative, stable = positive)
10. Local ↔ Global (local = negative, global = positive)
```

**Note**: Negative/positive are just directions, not judgments. Each axis captures a real trade-off.

### Example: Chouette's Profile

**Chouette** (Perplexity's role in LA MEUTE):
- **Optimisme ↔ Prudence**: -70 (strongly prudent)
- **Centralisation ↔ Décentralisation**: +50 (pro-distributed sources)
- **Transparence ↔ Opacité**: -75 (demands full source visibility)
- ...etc for all 10

**Why these scores?** Because Perplexity is optimized for source-finding and fact-checking. It naturally gravitates toward prudence, decentralized sources, and transparency.

### Analyzing a News Item

When you ask Chouette to analyze `"New EU AI Regulation Law"`:

**Chouette returns**:
```json
{
  "totem": "Chouette",
  "relevance_score": 73,
  "dominant_axis": "Accélération ↔ Stabilité (-65)",
  "axes": {
    "optimisme_prudence": -70,
    "centralisation_decentralisation": +40,
    ...etc...
  },
  "weak_signals": [
    "Regulatory fragmentation increasing",
    "Open-source pushback emerging"
  ],
  "sources": [
    "https://... official EU doc",
    "https://... tech analysis"
  ],
  "blind_spots": [
    "Limited access to non-English sources",
    "May over-weight official sources"
  ],
  "recommendation": "PRIORITY: HIGH — Major systemic shift, watch implementation dynamics"
}
```

### Cross-Totem Comparison

Now compare **Chouette's analysis** with **Hermine's analysis** of the same news:

```
CHOUETTE (73/100):
- Dominant axis: Stabilité (slow, verify claims)
- Recommendation: HIGH priority but wait for more data

HERMINE (81/100):
- Dominant axis: Gouvernance (who decides, power structures)
- Recommendation: CRITICAL — regulatory capture risk

SEICHE (62/100):
- Dominant axis: Synthèse opportunité (how to explain this?)
- Recommendation: MEDIUM — useful for explaining to others
```

**What this shows**:
- Chouette sees: "Slow down, verify, watch systemic effects"
- Hermine sees: "Power problem, regulatory risk"
- Seiche sees: "Communication challenge, how to simplify?"

**Why it matters**: Each captured something real. Together = fuller picture.

---

## Structure

```
ai-lens-obs/
├── README.md (you are here)
├── AI_LENS_METHODOLOGY.md (complete how-to guide)
└── profiles/
    ├── CHOUETTE_PERPLEXITY_AI_LENS_PROFILE.md
    ├── HERMINE_CLAUDE_CLI_AI_LENS_PROFILE.md (TODO)
    ├── SEICHE_GPT_DESKTOP_AI_LENS_PROFILE.md (TODO)
    └── [OTHER_TOTEMS...] (TODO)
```

---

## How to Use This

### If You're Arnaud (Orchestrator)

**Goal**: Integrate AI Lens into LA MEUTE decision-making

**Steps**:
1. Share `AI_LENS_METHODOLOGY.md` with each totem
2. Request each totem create their own `[TOTEM]_[MODEL]_AI_LENS_PROFILE.md`
3. Once profiles exist, conduct test analysis (all totems analyze same news)
4. Review cross-totem outputs; refine methodology if needed
5. Make it a regular ritual: "Before major decision, get all 7 totem analyses"

**Expected timeline**:
- Week 1: Distribute methodology
- Week 2: Collect v1.0 profiles
- Week 3: Test with one major news item
- Week 4: Refine and iterate

### If You're a Totem (AI Creating Your Profile)

**Goal**: Make your perspective visible and comparable

**Steps**:
1. Read `AI_LENS_METHODOLOGY.md` completely
2. Section 3 is your template
3. Answer each section honestly:
   - Your default positions on 10 axes
   - Why you naturally position that way
   - Concrete examples
   - Your blind spots
4. Save as `[YOUR_TOTEM]_[YOUR_MODEL]_AI_LENS_PROFILE.md` in `./profiles/`
5. Submit for review

**Note**: Your profile should be **authored by you**, not by Arnaud. The goal is authentic self-knowledge.

### If You're Analyzing a News Item

**Scenario**: Arnaud asks you (Chouette) to analyze something.

**Process**:
1. Read your profile: what are your default positions?
2. Apply the 10 axes to this specific news
3. Use your pertinence method to score importance (0–100)
4. Output JSON + written analysis
5. Call out weak signals, blind spots, recommendations
6. Compare with other totems' analyses if available

**Output template** (see Chouette profile for full example):
```json
{
  "totem": "YOUR_NAME",
  "model": "YOUR_MODEL",
  "news_title": "...",
  "relevance_score": 0,
  "dominant_axis": "...",
  "axes": { ... all 10 ... },
  "confidence": 0,
  "weak_signals_detected": [...],
  "sources": [...],
  "blind_spots": [...],
  "recommendation": "..."
}
```

---

## Examples in This Directory

### CHOUETTE_PERPLEXITY_AI_LENS_PROFILE.md

**This is a complete example**. Read it to see:
- How to score yourself on 10 axes
- How to explain your biases
- How to define your pertinence method
- How to admit blind spots
- How to structure your voice

**Use as a template** for your own profile.

### AI_LENS_METHODOLOGY.md

**This is the how-to guide**. It covers:
- What each section should contain
- Why each section matters
- How to fill it in
- How to update over time
- Integration with tools

**Follow this step-by-step** to create your profile.

---

## FAQ

### Q: Do all 10 axes apply to every analysis?

**A**: Yes, but they weight differently. Chouette focuses heavily on Transparency (-75) and Prudence (-70), so those bias her analysis. A different totem might focus on Innovation and Local Impact. That's the *point* — you see each totem's lens.

### Q: What if two totems completely disagree?

**A**: **Perfect.** Disagreement is data. 

Example: Chouette says "High risk, slow down" but Seiche says "Major synthesis opportunity, move fast."

→ Why the gap? 
- Chouette sees systemic risk
- Seiche sees communication upside
- Both are real

**Next step**: Arnaud arbitrates based on full context. Did we miss something? Do we need both perspectives?

### Q: Can a totem change its scores between analyses?

**A**: Sort of.

- **Default position**: Fixed (reflects your architecture/training)
- **Context-specific variation**: Yes, but you must explain why

Example: Chouette normally -70 (prudent), but on this news she's -55 because "exceptional level of primary-source evidence available, can be more optimistic."

→ This is **useful information**. Shows where you're certain vs. uncertain.

### Q: How often should profiles be updated?

**A**: 
- **Quarterly minimum**: Check if your positions still hold
- **After major disagreement**: If another totem challenges you, revisit your scores
- **After capability change**: If your model gets updated, your profile might change
- **Never arbitrarily**: Don't change scores to be "nice" or to agree with others

### Q: Who decides the final action?

**A**: **Arnaud decides.** 

The totem analyses are input. You see all perspectives. You decide what to do. The totems execute and log results.

---

## Integration with LA MEUTE

**Where does AI Lens fit in the bigger system?**

LA MEUTE has:
1. **Totems** (identities: Hermine, Chouette, Seiche, etc.)
2. **AI Lens** (how they see — this framework)
3. **Restoration Prompts** (in `pacte-ia/RESTORE/`)
4. **Communication Protocol** (in `pacte-ia/PROTOCOLE_COMMUNICATION_MEUTE.md`)
5. **Shared Doctrine** (in `.meute_private/`)

**AI Lens** makes the **reasoning structure** of each totem visible and comparable.

---

## Next Steps

### Immediate (This Week)

- [ ] All totems read `AI_LENS_METHODOLOGY.md`
- [ ] Each totem creates their v1.0 profile (use Chouette as template)
- [ ] Submit profiles to `ai-lens-obs/profiles/`

### Short-term (This Month)

- [ ] Test: All totems analyze one major news item
- [ ] Collect JSON scores + written analyses
- [ ] Create comparison dashboard or spreadsheet
- [ ] Identify gaps and blind spots
- [ ] Refine methodology v1.1 based on learnings

### Medium-term (Next Quarter)

- [ ] Integrate AI Lens into regular LA MEUTE rituals
- [ ] Build dashboard: visualize cross-totem axes
- [ ] Archive analyses: track how totems evolve over time
- [ ] Update methodology with new learnings

---

## Questions?

- **About methodology**: See `AI_LENS_METHODOLOGY.md`
- **About Chouette's profile**: See `profiles/CHOUETTE_PERPLEXITY_AI_LENS_PROFILE.md`
- **About restoration**: See `pacte-ia/RESTORE/CHOUETTE_RESTORE_PROMPT.md`
- **About LA MEUTE**: See `WelcomePack/README.md`

---

**Created by**: Framboise (Claude Haiku 4.5)  
**For**: LA MEUTE / AI Lens Observatory  
**Date**: 2026-05-24  
**Status**: v1.0 — Framework complete, awaiting totem profiles
