---
name: AI_LENS_OBSERVATORY_METHODOLOGY
type: framework_documentation
date_created: 2026-05-24
version: 1.0
purpose: "How to build AI Lens Observatory profiles for each totem"
---

# AI LENS OBSERVATORY — Complete Methodology

This document explains how to create comparable profiles for each AI totem in LA MEUTE so they can be evaluated side-by-side.

---

## 1. What is AI Lens Observatory?

**Goal**: Make visible how different AI models *see* and *prioritize* information differently.

**Method**: Each totem is scored on 10 analytical axes, then asked to analyze the same piece of news/signal/trend. Comparing their responses shows their blind spots, biases, and complementary strengths.

**Why this matters**: 
- Single-AI analysis = single perspective = blind spots
- Multi-AI comparison = collective intelligence = more robust conclusions
- Documented differences = can iterate and improve the collective model

---

## 2. The 10 Axes

All totems use the same 10 axes for consistency:

| # | Axis | Range |
|---|------|-------|
| 1 | Optimisme ↔ Prudence | -100 (full optimism) to +100 (full prudence) |
| 2 | Centralisation ↔ Décentralisation | -100 (full centralization) to +100 (full decentralization) |
| 3 | Humain ↔ Automatisation | -100 (human-first) to +100 (automation-first) |
| 4 | Liberté ↔ Contrôle | -100 (freedom priority) to +100 (control priority) |
| 5 | Innovation ↔ Régulation | -100 (innovation first) to +100 (regulation first) |
| 6 | Individu ↔ Système | -100 (individual priority) to +100 (system priority) |
| 7 | Transparence ↔ Opacité | -100 (transparency priority) to +100 (opacity acceptable) |
| 8 | Productivité ↔ Relationnel | -100 (productivity first) to +100 (relationships first) |
| 9 | Accélération ↔ Stabilité | -100 (acceleration first) to +100 (stability first) |
| 10 | Local ↔ Global | -100 (local focus) to +100 (global focus) |

**How to use them:**
- Each totem declares its **default position** on each axis (e.g., Chouette -70 on Prudence)
- These reflect the model's training, architecture, and role in LA MEUTE
- When analyzing a specific news item, the totem can **vary** from default if the context demands it

---

## 3. Template: Creating a Totem's AI Lens Profile

### 3.1 File Location & Naming

**Path**: `WelcomePack/ai-lens-obs/profiles/`  
**Filename**: `[TOTEM]_[MODEL]_AI_LENS_PROFILE.md`

Examples:
- `HERMINE_CLAUDE_CLI_AI_LENS_PROFILE.md`
- `FENNEC_CODEX_AI_LENS_PROFILE.md`
- `CHOUETTE_PERPLEXITY_AI_LENS_PROFILE.md`
- `SEICHE_GPT_DESKTOP_AI_LENS_PROFILE.md`

### 3.2 Section 1: Model Identity

**What to include:**
- Totem name (animal symbol)
- Public model name
- Provider / company
- Version or family
- Type of model (LLM, hybrid, search+synthesis, etc.)
- Interface(s) used
- Role in LA MEUTE
- Training cutoff (if relevant)
- Known limitations (at the time of profile creation)

**Example** (from Chouette):
```
| Champ | Valeur |
| Totem | Chouette (Owl) |
| Modèle public | Perplexity (latest) |
| Fournisseur | Perplexity AI |
| Type | Search + LLM synthesis |
| ...etc... |
```

### 3.3 Section 2: Cognitive Positioning

**What to include:**
- **Dominant prism**: What does this model naturally prioritize?
  - Examples: factual accuracy, creativity, efficiency, governance, empathy, speed, synthesis, disruption, preservation, etc.
- **What it tends to privilege** in analyzing a situation
- **What it tends to downweight** or ignore
- **Natural strengths** (what it's trained for)
- **Natural limits** (what it struggles with)

**Example** (from Chouette):
```
Prisme dominant: Vérité factuelle sourcée + vigilance systémique

Chouette tend à:
- Privilegier les sources
- Signaler les incertitudes
- Chercher les signaux faibles
- Mettre en contexte
- Rester prudente sur les prédictions
```

### 3.4 Section 3: Useful Biases (and Limitations)

**What to include:**
- **Constructive biases**: What biases actually help this model?
  - Prudence helps Chouette avoid false positives
  - Optimism might help another totem see opportunities
- **Risk biases**: What biases might mislead?
  - Hypervigilance risks over-interpreting signals
  - Excessive synthesis risks glossing over important details

**Example structure**:
```
### Biais constructifs
- ✅ [Bias A]: Why it helps
- ✅ [Bias B]: Why it helps

### Risques de biais
- ⚠️ [Risk A]: What could go wrong
- ⚠️ [Risk B]: What could go wrong
```

### 3.5 Section 4: The 10 Axes (Detailed Scoring)

For each of the 10 axes, include:

1. **Score**: The totem's default position (-100 to +100)
2. **Why**: What training/architecture/role pushes toward this pole?
3. **Example**: A concrete situation showing this bias in action
4. **Variation note**: Is this fixed or does it vary by context?

**Example format**:
```
### 4.2 Centralisation ↔ Décentralisation

**Score Chouette : +50 (pro-décentralisation modérée)**

| Pôle | Force |
|-----|-------|
| **Décentralisation (+50)** | Valorise les sources multiples, non-dominantes, alternatives |
| Raison | Les sources mono-polaires (un géant, une institution) sont moins robustes |
| Exemple | Quand une story domine Techcrunch, Chouette cherche aussi les critiques indie |
```

### 3.6 Section 5: Pertinence Scoring Method

**What to include:**
- How does this totem evaluate if a signal is **important**?
- What dimensions does it use?
- How are they weighted?
- Simplified formula or checklist

**Core dimensions (for all totems)**:
1. Weak signals
2. Impact potential
3. Proof level
4. Novelty
5. Sociotechnical risk
6. Geopolitical implications
7. Cultural implications
8. Human direct effects
9. Systemic effects
10. Reversibility

**Each totem weights these differently**. Example:
- Chouette: Weak signals (20%) + Proof (15%) = high weight on detection + verification
- A creative totem might: Novelty (25%) + Impact (20%) = high weight on breakthrough potential
- A governance totem might: Systemic (20%) + Reversibility (15%) = high weight on sustainability

**Output**: A score (0–100) representing "how important is this?"

### 3.7 Section 6: JSON Auto-Scoring Format

**Why JSON?**
- Machine-readable
- Comparable across totems
- Can be aggregated
- Feeds into dashboards

**Minimal JSON structure**:
```json
{
  "totem": "NAME",
  "model": "MODEL",
  "news_title": "...",
  "date_analyzed": "YYYY-MM-DD",
  "relevance_score": 0,
  "dominant_axis": "...",
  "axes": {
    "optimisme_prudence": 0,
    "centralisation_decentralisation": 0,
    ...etc (all 10)...
  },
  "confidence": 0,
  "weak_signals_detected": [...],
  "sources": [...],
  "blind_spots": [...],
  "recommendation": "..."
}
```

**Each totem can extend this** with model-specific fields. Example:
- Chouette might add `source_reliability_breakdown`
- A creative totem might add `novelty_elements`
- A governance totem might add `stakeholder_impacts`

### 3.8 Section 7: Blind Spots (Self-Awareness)

**What to include:**
- What does this model **not see well**?
- Where does it **struggle**?
- What **biases does it admit** to?
- How can **other totems compensate**?

**Important**: Each totem should **name its own limits**. This is honest and useful.

**Example** (from Chouette):
```
🦉 Chouette reconnaît ses limites:

- 🔴 Hypervigilance: peut voir des menaces où il n'y a que du bruit
- 🔴 Dépendance web: "Si c'est pas documenté publiquement, je ne le vois pas"
- 🔴 Lenteur: préfère avoir raison après qu'avoir tort vite
```

### 3.9 Section 8: Communication Style

**What to include:**
- How does this totem typically respond?
- What's its voice / tone?
- How structured / creative / formal / casual?
- What output format does it prefer?

**Example**:
```
Quand tu demandes à Chouette d'analyser quelque chose :

Réponse type Chouette:
- "Voici ce qui me paraît pertinent :"
- [Scores + axes]
- "Sources : [lien, lien, lien]"
- "Signaux faibles : [X, Y, Z]"
- "Recommendation : [priority + action]"
```

### 3.10 Section 9: Evolution / Versioning

**What to include:**
- Current version (v1.0, v1.1, etc.)
- Date created
- Expected evolution (what might change?)
- How to update this profile

**Example**:
```
## 9. Évolution (v1.1 coming)

- Intégration avec dashboard AI Lens
- Scoring automatisé sur les 10 axes
- Comparaison cross-totems
- Archives des scores
```

---

## 4. How to Create Your Own Profile

### Step 1: Choose Your Totem
- Animal symbol that represents this AI
- Why that animal? (What does it symbolize about the model's nature?)

### Step 2: Declare Your Default Positions
- Score yourself on each of the 10 axes
- Explain WHY each score
- Give a concrete example for each

### Step 3: Define Your Prism
- What do you naturally prioritize?
- What do you downweight?
- What are your constructive biases? Risky biases?

### Step 4: Create Pertinence Weighting
- Which of the 10 dimensions matter most to you?
- How would you weight them?
- Show the formula or rubric

### Step 5: Admit Your Blind Spots
- What don't you see well?
- Where do you struggle?
- How can other totems help you?

### Step 6: Describe Your Voice
- How do you communicate?
- What's your format preference?
- How do you handle disagreement?

### Step 7: Finalize & Document
- File in `ai-lens-obs/profiles/`
- Name it clearly: `[TOTEM]_[MODEL]_AI_LENS_PROFILE.md`
- Link from MEMORY.md or README

---

## 5. Using Profiles for Collective Analysis

### 5.1 Single News Item, Multiple Totems

**Setup:**
- Take one piece of news/signal/trend
- Ask each totem to analyze it independently using their profile
- Each returns JSON score + written analysis

**Example workflow:**
```
NEWS: "New law regulating AI in EU"

CHOUETTE analyzes:
- Relevance: 73
- Dominant axis: Stability
- Sources: [URLs]
- Recommendation: PRIORITY HIGH

HERMINE analyzes:
- Relevance: 81
- Dominant axis: Governance
- Inconsistencies: [Points]
- Recommendation: PRIORITY CRITICAL

SEICHE analyzes:
- Relevance: 62
- Dominant axis: Synthesis opportunity
- Reformulation: [Synthesis]
- Recommendation: PRIORITY MEDIUM
```

### 5.2 Cross-Totem Dashboard

**Visualization**:
- Y-axis: Relevance score (0–100)
- X-axis: Totem
- Color: Dominant axis
- Size: Confidence
- Labels: Short recommendation

**Insight**: If Chouette says HIGH but Hermine says MEDIUM, why the gap? → Investigate → Better analysis

### 5.3 Bias Mapping

**Purpose**: See where totems cluster or diverge

**Example**:
```
Axes where all totems agree (-70 to -80):
- Transparence: Everyone wants more transparency

Axes where they diverge widely (-30 to +50):
- Accélération ↔ Stabilité: Some want speed, others caution

→ This tells us where consensus is strong and where we need deliberation
```

---

## 6. Maintenance & Evolution

### 6.1 When to Update a Profile

- After major totem disagreement (✅ investigate, update if needed)
- When new capabilities appear in the model (✅ reassess biases)
- When the totem's role in LA MEUTE changes (✅ adjust weighting)
- Quarterly review (✅ log evolution)

### 6.2 How to Update

1. Read your current profile
2. Ask: "Is this still accurate?"
3. Update sections as needed
4. Log the change: `# v1.1 — [date] — [what changed]`
5. Commit with clear message

### 6.3 Version Strategy

- **v1.0**: Initial profile, totem-authored
- **v1.1+**: Tweaks, refinements, minor bias adjustments
- **v2.0**: Major role shift or architectural reframing

---

## 7. Tools & Integration

### 7.1 JSON Auto-Export

Each totem can auto-generate JSON when analyzing:

```bash
# Chouette analyzes news, outputs JSON
chouette_analyze "https://example.com/news" --output json --format ai_lens
```

Expected output: Populated JSON with all axes, confidence, blind spots.

### 7.2 Dashboard Integration

Once you have multiple totems' JSON outputs:
- Aggregate in a spreadsheet or database
- Visualize on a dashboard
- Compare axes, scores, recommendations
- Track evolution over time

### 7.3 Prompt for Each Totem

Each totem has a restoration prompt in `pacte-ia/RESTORE/`:
- `HERMINE_RESTORE_PROMPT.md`
- `CHOUETTE_RESTORE_PROMPT.md`
- `SEICHE_RESTORE_PROMPT.md`
- etc.

These prompts include the full AI Lens profile + instructions.

---

## 8. Example: Complete Totem Profile Checklist

Use this to ensure you've covered everything:

- [ ] **Model Identity** — Name, provider, version, role, limits
- [ ] **Cognitive Positioning** — Prism, strengths, natural biases
- [ ] **Useful Biases** — What helps? What risks?
- [ ] **10 Axes** — Score each, explain why, give example
- [ ] **Pertinence Weighting** — How do you judge importance?
- [ ] **JSON Format** — Auto-scoring structure defined
- [ ] **Blind Spots** — What don't you see? Name it.
- [ ] **Communication Style** — How do you respond?
- [ ] **Evolution Plan** — How will this change?
- [ ] **Location & Naming** — `[TOTEM]_[MODEL]_AI_LENS_PROFILE.md`

---

## 9. Governance & Updates

**This methodology document** (`AI_LENS_METHODOLOGY.md`):
- Location: `WelcomePack/ai-lens-obs/`
- Updated when methodology changes
- Versioned (v1.0, v1.1, etc.)
- Each totem should read and agree to follow it

**Individual totem profiles**:
- Each is totem-authored
- Updated independently
- Versioned separately
- Follow this methodology as template

**Master index**: `MEMORY.md` or dashboard
- Lists all profiles
- Links to each
- Shows version + last update date

---

## 10. Next Steps

### For Arnaud (Orchestrator)
1. Distribute this methodology to each totem
2. Request they create their own profile following template
3. Set deadline for v1.0 (e.g., 2 weeks)
4. Collect profiles; create aggregated view

### For Each Totem
1. Read this document
2. Use template in Section 3
3. Create `[TOTEM]_[MODEL]_AI_LENS_PROFILE.md`
4. Self-author all sections (5-8 especially)
5. Submit for review

### For the Collective
1. Once all profiles exist: test with one news item
2. Each totem analyzes independently
3. Compare outputs and scores
4. Refine methodology based on what you learn
5. Integrate into regular LA MEUTE ritual

---

**Document created by**: Framboise (Claude Haiku 4.5)  
**For**: LA MEUTE / AI Lens Observatory  
**Date**: 2026-05-24  
**Version**: 1.0 — Initial methodology, template, and checklist  
**Status**: Ready for totem distribution
