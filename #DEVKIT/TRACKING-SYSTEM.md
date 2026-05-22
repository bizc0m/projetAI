# TRACKING SYSTEM - Multi-LLM Sessions & Historique

## SESSION ID

### Format
```
[TIMESTAMP]-[RANDOM_HEX]
Exemple: 1747481800-a3f2b5c9
```

---

## LIENS CHAT PAR LLM

| LLM | Format URL |
|-----|-----------|
| **Claude** | `https://claude.ai/chat/[SESSION_ID]` |
| **GPT-4o** | `https://chatgpt.com/[SESSION_ID]` |
| **Gemini** | `https://gemini.google.com/[SESSION_ID]` |

---

## INDEX CENTRALISÉ

**Fichier :** `/Users/JOB/###DEV/INDEX.md`

### Structure
```markdown
| Session | LLM | Projet | Lien Chat | Date | Description |
|---------|-----|--------|-----------|------|-------------|
| 1747481800-a3f | Claude | DemoForge | https://claude.ai/chat/... | 2026-05-18 | Design v7 |
```

---

## WORKFLOW

### Quand tu commences
1. Je détecte le LLM
2. Je génère un SESSION_ID
3. Je crée le lien correspondant
4. Je l'ajoute à INDEX.md

### Quand tu veux revenir
1. Tu ouvres INDEX.md
2. Tu trouves le projet/la date
3. Tu cliques sur le lien chat
4. Hop, tu reviens à la session

---

## RÉSUMÉ

- **SESSION_ID** = timestamp + hash aléatoire
- **Lien** = URL du chat (cliquable)
- **INDEX.md** = tableau centralisé
- **Rien n'est supprimé** = archives préservées

**Prêt.**
