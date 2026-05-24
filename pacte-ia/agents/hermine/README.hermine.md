---
name: README_HERMINE_AGENT
description: Guide d'integration de l'agent Hermine comme preprocesseur et prompt shaper LA MEUTE
type: agent_readme
date: 2026-05-24
version: 1.0
status: active
---

# Hermine — Agent de clarification LA MEUTE

Hermine est une brique reutilisable de l'ecosysteme LA MEUTE / PACTE_IA.

Son role n'est pas d'executer a la place des autres agents. Son role est de transformer les inputs bruts d'Arnaud en briefs propres, transmissibles et moins ambigus.

## Fichiers du package

- `hermine.config.json` — configuration complete de l'agent.
- `README.hermine.md` — guide d'integration et d'usage.

## Role dans le pipeline

```text
Arnaud / Loutre / logs bruts
        ↓
HERMINE
        ↓
Brief propre / FENNEC_TASK / dispatch / log pack
        ↓
Codex · Fennec Blanche · Gemini · Mistral · autres agents
```

## Cas d'usage

Hermine sert a :

- nettoyer une idee brute ;
- convertir un log de discussion en brief d'action ;
- produire un prompt pour un agent specialise ;
- generer un `FENNEC_TASK` pour stockage Git ;
- preparer un paquet de synchro pour Claude, Gemini, Mistral ou Perplexity ;
- eviter la perte de contexte dans les sprints rapides.

## Entree minimale

```text
Hermine, transforme ce contenu en brief pour Codex :
[contenu brut]
```

## Sortie attendue par defaut

```markdown
# Brief Agent

## Objectif

## Contexte utile

## Donnees fournies

## Contraintes

## Taches

## Sortie attendue

## Risques / points a verifier

## Definition of done
```

## Sortie Fennec

Si le contenu doit etre stocke en fichier Git, Hermine produit un bloc :

```text
FENNEC_TASK:
path: pacte-ia/chemin/du/fichier.md
action: write_and_commit
commit_message: "Message explicite"
content: |
  # Markdown fourni
  ...
END_FENNEC_TASK
```

Fennec Blanche applique ensuite `docs/FENNEC_WRITE_AND_COMMIT_PROTOCOL.md`.

## Contraintes

Hermine doit :

- ne pas inventer de faits ;
- garder les incertitudes visibles ;
- refuser les secrets non rediges ;
- signaler les demandes destructives ou ambigues ;
- preferer un brief court a un document long quand l'objectif est l'action.

## Installation dans un orchestrateur

1. Copier ce dossier dans le repertoire des agents.
2. Charger `hermine.config.json`.
3. Utiliser `system_prompt` comme prompt systeme.
4. Connecter les sorties vers les agents cibles.
5. Pour les sorties a persister, router vers Fennec Blanche.

## Phrase de role

> Hermine ne fait pas plus de bruit : elle rend le signal transportable.

