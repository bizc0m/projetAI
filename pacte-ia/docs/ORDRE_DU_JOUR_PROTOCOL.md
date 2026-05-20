# Ordre du Jour Protocol — PACTE_IA / LA MEUTE

Statut : protocole de coordination.

Objectif : permettre a une nouvelle voix ou un nouvel agent de se mettre a jour rapidement sans relire tout le depot.

## 1. Principe

> Une nouvelle voix ne lit pas toute l'histoire. Elle lit le noyau, les derniers ordres du jour et la synthese la plus recente.

## 2. Dossiers

```text
ORDRE_DU_JOUR/
├── 2026-05-19_MISE_A_JOUR_MEUTE_NIGHTLIFE.md
├── ...
└── INDEX.md

SYNTHESES/
├── HEBDO/
├── MENSUEL/
└── ANNUEL/
```

## 3. Onboarding d'une nouvelle voix / agent

Prompt court :

```markdown
Salut,

Pour te mettre a jour sur PACTE_IA / LA MEUTE :

1. Lis `DOCS_MARKUP.md`.
2. Lis les 20 derniers fichiers dans `ORDRE_DU_JOUR/`.
3. Lis la derniere synthese hebdo disponible dans `SYNTHESES/HEBDO/`.
4. Lis le context pack du projet concerne dans `contexts/[PROJET]/`.

Puis reponds avec :

- ton resume en 10 lignes ;
- ce que tu as compris ;
- ce que tu contestes ;
- ce qui manque ;
- comment tu peux economiser des tokens ;
- ta premiere contribution concrete.
```

## 4. Reponse attendue

```markdown
# ONBOARDING_[SYSTEME]_[DATE]

## Resume en 10 lignes

## Ce que j'ai compris

## Ce que je conteste

## Ce qui manque

## Optimisation tokens proposee

## Premiere contribution concrete

## Limites / refus
```

## 5. Optimisation tokens obligatoire

Chaque nouvelle voix ou agent doit proposer son propre **Self-Boot Profile** :

- role court ;
- contexte minimal requis ;
- informations inutiles a ne pas repeter ;
- format de reponse prefere ;
- niveau de detail par defaut ;
- signaux d'alerte ;
- refus ;
- estimation de tokens economises si possible.

Regle :

> Une voix qui rejoint LA MEUTE doit aider a reduire le bruit qu'elle ajoute.

## 6. Syntheses periodiques

### Hebdo

Objectif : garder le fil vivant.

Contenu :

- decisions prises ;
- questions ouvertes ;
- dispatchs envoyes ;
- reponses recues ;
- desaccords importants ;
- risques ;
- prochain ordre du jour.

Nom :

```text
SYNTHESES/HEBDO/YYYY-WW_SYNTHESE_HEBDO.md
```

### Mensuel

Objectif : transformer le flux en doctrine ou archive.

Contenu :

- ce qui devient canon ;
- ce qui reste chantier ;
- ce qui part en archive ;
- ce qui doit etre teste ;
- couts tokens ;
- apprentissages.

Nom :

```text
SYNTHESES/MENSUEL/YYYY-MM_SYNTHESE_MENSUELLE.md
```

### Annuel

Objectif : bilan de trajectoire.

Contenu :

- evolution du PACTE_IA ;
- evolution de LA MEUTE ;
- effets reels ;
- echecs ;
- risques ;
- changements de doctrine ;
- decisions a abandonner.

Nom :

```text
SYNTHESES/ANNUEL/YYYY_SYNTHESE_ANNUELLE.md
```

## 7. Regle des 20 derniers ordres du jour

Une nouvelle voix lit au maximum les 20 derniers ordres du jour, sauf demande explicite.

Pourquoi :

- limiter le cout ;
- eviter de ressasser toute l'histoire ;
- favoriser les decisions recentes ;
- obliger les syntheses a faire leur travail.

Exception :

Si une question depend d'un historique ancien, on fournit le lien exact vers le document source.

## 8. Index

`ORDRE_DU_JOUR/INDEX.md` doit lister :

- date ;
- titre ;
- statut ;
- projets concernes ;
- dispatchs lies ;
- synthese hebdo de rattachement.

## 9. Regle finale

> Le flux cree la vie. La synthese cree la memoire.
