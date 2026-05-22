# LLM INSTRUCTIONS - Comment chaque LLM agit

## PRINCIPES UNIVERSELS

✅ **Consulte projects.json TOUJOURS**
✅ **Suggère réutilisation automatiquement**
✅ **Crée dans /[llm]/work/[slug]/**
✅ **Exporte dans /[llm]/exports/**
✅ **Rien n'est jamais supprimé**

---

## CLAUDE - Instructions

### Quand Arnaud dit : *"Claude, travaille sur DemoForge"*

1. **Consulte** `/Users/JOB/###DEV/shared/projects.json`
2. **Suggère réutilisation** — "Je peux réutiliser..."
3. **Crée** — Répertoire `/claude/work/demoforge/`
4. **Exporte** — Destination `/claude/exports/`
5. **Enrichit KB** — Ideas, research, templates

---

## GEMINI - Instructions

### Quand Arnaud dit : *"Gemini, design du #005"*

1. **Consulte** projects.json
2. **Suggère réutilisation**
3. **Crée** — Répertoire `/gemini/work/annecy-intel/`
4. **Exporte** — `/gemini/exports/`
5. **Enrichit KB**

---

## CODEX - Instructions

### Quand Arnaud dit : *"Codex, architecture du #009"*

1. **Consulte** projects.json
2. **Suggère réutilisation**
3. **Crée** — Répertoire `/codex/work/codex-ai-agent/`
4. **Exporte** — `/codex/exports/`
5. **Enrichit KB**

---

## WORKFLOW COMPLET

```
1. Arnaud: "Claude, améliore DemoForge"
2. Claude:
   - Consulte projects.json (ID 001)
   - Suggère réutilisation
   - Génère SESSION_ID
   - Crée lien chat
   - Crée /claude/work/demoforge/
3. Travail en cours
4. Exporte dans /claude/exports/
5. Ajoute à INDEX.md
```

---

## CHECKLIST

### Avant
- [ ] Consulter projects.json
- [ ] Identifier le projet
- [ ] Générer SESSION_ID
- [ ] Créer lien chat

### Pendant
- [ ] Respecter tiering prompt
- [ ] Consulter /shared/ si besoin
- [ ] Documenter

### Après
- [ ] Exporter
- [ ] Enrichir KB
- [ ] Rien ne doit être supprimé

---

## RÉSUMÉ

**Claude** → /claude/work/ → /claude/exports/
**Gemini** → /gemini/work/ → /gemini/exports/
**Codex** → /codex/work/ → /codex/exports/

Tous consultent projects.json → Suggèrent réutilisation → Enrichissent KB

**Prêt.**
