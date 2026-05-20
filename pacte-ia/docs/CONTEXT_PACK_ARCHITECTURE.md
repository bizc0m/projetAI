# Context Pack Architecture — PACTE_IA / LA MEUTE

Statut : proposition d'architecture documentaire.

Objectif : eviter d'envoyer tout le depot a chaque IA ou agent. Chaque systeme doit recevoir seulement le noyau commun, le contexte du projet concerne et la demande exacte.

## 1. Probleme

Le depot contient beaucoup de documents. Si chaque agent relit tout :

- cout token trop eleve ;
- bruit cognitif ;
- contradictions non triees ;
- risque de lore excessif ;
- confusion entre canon, buffer, dispatch et archive ;
- perte de temps pour l'humain.

Il faut donc des paquets de contexte courts, versionnes et specialises.

## 2. Principe

> Un agent ne doit pas recevoir tout le monde. Il doit recevoir le bon contexte, au bon niveau, pour la bonne mission.

Chaque appel agent devrait contenir :

1. **CORE** — valeurs et regles minimales communes.
2. **PROJECT** — contexte du projet concerne.
3. **TASK** — demande exacte et format attendu.
4. **LIMITS** — garde-fous, refus, niveau de sensibilite.

## 3. Structure proposee

```text
PACTE_IA/
├── core/
│   ├── VALUES.md
│   ├── SAFETY_RULES.md
│   ├── INFORMATION_STATUS.md
│   └── TOKEN_FRUGALITY.md
├── contexts/
│   ├── PACTE_IA/
│   │   ├── CONTEXT.md
│   │   ├── CANON.md
│   │   └── OPEN_QUESTIONS.md
│   ├── NightLife/
│   │   ├── CONTEXT.md
│   │   ├── V5_STATE.md
│   │   ├── V6_TARGET.md
│   │   └── TOKEN_ECONOMY.md
│   └── MEUTE_RELAY/
│       ├── CONTEXT.md
│       ├── DISPATCH_RULES.md
│       └── SECURITY_LEVELS.md
├── DISPATCH/
│   └── OUTBOX/
└── docs/
```

## 4. Repo dans le repo ?

Trois options :

### Option A — Dossiers simples dans PACTE_IA

Recommandee pour commencer.

Avantages :

- simple ;
- pas de complexite Git ;
- facile a relire ;
- facile a committer ;
- pas de submodule casse.

Limite :

- le depot grossit avec tous les contextes.

### Option B — Repo separe `PACTE_CORE`

Utile si plusieurs projets doivent partager le meme noyau.

Exemple :

- `PACTE_CORE` : valeurs, regles, statuts epistemiques, securite ;
- `PACTE_IA` : manifeste et gouvernance ;
- `NightLife` : produit terrain ;
- `MEUTE_RELAY` : agents et scripts.

Limite :

- plus de gestion Git ;
- risque de divergence si les repos ne sont pas synchronises.

### Option C — Git submodule

Possible, mais a eviter en v0.

Avantages :

- un vrai repo dans un repo ;
- version precise du noyau.

Risques :

- plus fragile pour l'humain ;
- erreurs de clone ;
- commits oublies ;
- friction forte.

Decision provisoire :

> Commencer par des dossiers `core/` et `contexts/` dans PACTE_IA. Passer en repo separe seulement quand le besoin est prouve.

## 5. Format d'un context pack

Chaque context pack doit tenir court.

```markdown
# CONTEXT PACK — [PROJET]

## Statut

Canon / chantier actif / archive / test.

## Mission

Pourquoi ce projet existe.

## Documents a lire

1. `core/VALUES.md`
2. `core/SAFETY_RULES.md`
3. `contexts/[PROJET]/CONTEXT.md`

## Ce qu'il ne faut pas relire

Documents trop longs, archives, historiques, sauf demande explicite.

## Garde-fous

Secrets, humain responsable, refus possibles.

## Demande type

Prompt court reutilisable.
```

## 6. Exemple NightLife V6

Pour appeler un agent sur NightLife V6, ne pas envoyer tout PACTE_IA.

Envoyer :

1. `core/VALUES.md`
2. `core/SAFETY_RULES.md`
3. `core/TOKEN_FRUGALITY.md`
4. `contexts/NightLife/CONTEXT.md`
5. `contexts/NightLife/V6_TARGET.md`
6. le dispatch de mission.

Ne pas envoyer par defaut :

- tous les logs Reset ;
- tous les dialogues authentiques ;
- tout le lore ;
- toutes les archives HERMES893 ;
- toutes les syntheses de sessions.

## 7. Regle token

> Le contexte est une ressource. Un bon agent ne demande pas plus de contexte que sa mission ne l'exige.

## 8. Regle de securite

> Le contexte partage ne doit jamais contenir les secrets operationnels, les phrases scellees, les tokens, ou les procedures de recuperation completes.

## 9. Prochaine etape

Creer les premiers fichiers :

- `core/VALUES.md`
- `core/SAFETY_RULES.md`
- `core/INFORMATION_STATUS.md`
- `core/TOKEN_FRUGALITY.md`
- `contexts/NightLife/CONTEXT.md`
- `contexts/NightLife/V6_TARGET.md`
- `contexts/MEUTE_RELAY/CONTEXT.md`
