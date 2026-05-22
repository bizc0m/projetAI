# KB STRUCTURE - Base de Connaissances Centralisée

## STRUCTURE

```
/Users/JOB/###DEV/shared/
├── projects.json
├── projects/
├── research/
├── ideas/
├── knowledge-base/
└── templates/
```

---

## PROJETS REGISTRY

**Fichier :** `/Users/JOB/###DEV/shared/projects.json`

### Format
```json
{
  "projects": [
    {
      "id": "001",
      "name": "DemoForge",
      "slug": "demoforge",
      "status": "active",
      "reuse_potential": ["urgence-glou"]
    }
  ]
}
```

---

## DOSSIERS

### research/
- Notes de recherche
- Findings documentées
- Benchmarks

### ideas/
- Idées brutes
- Concepts à explorer
- Futures features

### knowledge-base/
- Documentation générale
- Best practices
- Architectures

### templates/
- Code réutilisable
- Design patterns
- Snippets

---

## CONSULTATION PAR LLM

### Quand un LLM démarre
1. Consulte projects.json
2. Regarde reuse_potential
3. Lit research/
4. Consulte ideas/
5. Cherche templates/

---

## RÉSUMÉ

- **projects.json** = Registry central
- **research/** = Findings
- **ideas/** = Concepts
- **knowledge-base/** = Docs
- **templates/** = Code/design réutilisable

**Prêt.**
