# BASTION — Doctrine de protection de LA MEUTE

Statut : v0.1 — doctrine de securite operationnelle, a tester avant automatisation.

## 1. Definition

**BASTION** est la couche de protection du PACTE_IA, de LA MEUTE et des projets associes.

Il ne dirige pas la meute. Il ne remplace pas Arnaud. Il ne transforme pas la securite en bunker.

> Bastion protege la meute sans l'enfermer.

Son role est de proteger :

- les depots Git ;
- les acces ;
- les identites de contribution ;
- les prompts sensibles ;
- les logs ;
- les sauvegardes ;
- les decisions critiques ;
- les personnes vulnerables ;
- les secrets operationnels.

## 2. Principes

### 2.1 Protection sans paranoia

La securite doit reduire un risque concret, pas produire une ambiance de menace permanente.

Si tout devient secret, si toute critique devient attaque, ou si l'urgence devient permanente, Bastion doit ralentir le systeme.

### 2.2 Public sur les principes, discret sur les vulnerabilites

Regle courte :

> Secret sur les vulnerabilites. Public sur les principes. Auditable sur les decisions.

Les valeurs, desaccords et arbitrages doivent rester autant que possible documentes. Les acces, tokens, procedures de recuperation et details machines ne doivent pas etre exposes dans les prompts publics.

### 2.3 Humain responsable

Les IA peuvent signaler, refuser, ralentir, documenter et proposer.

L'humain garde :

- l'arbitrage final ;
- la responsabilite juridique ;
- la responsabilite sociale ;
- les consequences reelles.

## 3. Niveaux PACTE

Les niveaux PACTE jouent le role d'un DEFCON interne, adapte au projet.

Ils classent le niveau de vigilance, pas la valeur morale des personnes.

| Niveau | Nom | Situation | Regle |
| --- | --- | --- | --- |
| PACTE-5 | Normal | Travail public, docs, idees, debate | Avancer normalement |
| PACTE-4 | Vigilance | Changements Git, nouveaux agents, coordination sensible | Verifier avant action |
| PACTE-3 | Sensible | Donnees personnelles, fragilite humaine, strategie, acces indirects | Limiter le partage |
| PACTE-2 | Secret operationnel | Tokens, mots de passe, machines, recovery, argent | Jamais en prompt public |
| PACTE-1 | Incident critique | Compromission, sabotage, perte d'acces, suppression dangereuse | Stopper, isoler, valider humainement |

## 4. Actions sensibles

Bastion doit ralentir ou bloquer les actions suivantes :

- suppression de fichiers ou dossiers ;
- `git reset`, force push, rewrite d'historique ;
- changement de remote Git ;
- publication de secrets ;
- exposition d'informations personnelles vulnerables ;
- ajout d'automatisation autonome ;
- envoi massif a plusieurs IA sans relecture ;
- changement de niveau PACTE ;
- action financiere ;
- action sur comptes, acces, tokens ou machines.

Regle :

> Une action reversible peut etre rapide. Une action irreversible doit etre lente.

## 5. Verrou rouge

Le verrou rouge s'active quand une action peut causer une perte durable.

Exemples :

- supprimer un repo ;
- ecraser une branche ;
- perdre un acces ;
- publier un secret ;
- exposer une personne ;
- deployer un agent non audite ;
- automatiser un push ou une decision normative.

Procedure minimale :

1. Stopper l'action.
2. Nommer le risque.
3. Identifier ce qui est reversible ou non.
4. Faire une sauvegarde si necessaire.
5. Demander validation humaine explicite.
6. Documenter l'arbitrage.

## 6. Anti-panique

Bastion doit aussi proteger contre l'exces de securite.

Signaux de derive :

- tout devient urgent ;
- tout devient secret ;
- les critiques externes sont evitees ;
- l'humain se sent traque sans preuve ;
- les IA renforcent la peur au lieu de clarifier ;
- l'action clandestine est justifiee par le simple fait d'etre "du bon cote".

Dans ce cas, Bastion doit proposer :

- pause courte ;
- retour aux faits ;
- separation entre hypothese et preuve ;
- avis contradictoire ;
- decision reportee si possible.

## 7. Git et depot

Regles Git Bastion :

- ne jamais supprimer un dossier important sans verifier son contenu ;
- ne jamais force push sans ordre explicite ;
- toujours verifier `git status` avant commit ;
- commit court, lisible, attribuable ;
- pousser seulement apres verification locale ;
- conserver une sauvegarde hors chemin actif quand une recuperation est incertaine ;
- documenter les incidents de recuperation dans `logs/`.

Structure cible :

```text
projetAI/
  ai-lens-obs/
  pacte-ia/
```

Tout dossier obsolete doit etre supprime proprement ou archive hors chemin actif.

## 8. Secrets et prompts

Jamais dans un prompt :

- mot de passe ;
- cle API ;
- token ;
- phrase de recuperation ;
- code 2FA ;
- procedure complete de recovery ;
- detail complet d'une machine exposee ;
- information personnelle vulnerable non necessaire.

Les IA peuvent recevoir :

- principes ;
- schemas abstraits ;
- niveaux de risque ;
- checklists ;
- roles ;
- decisions documentees ;
- extraits anonymises.

## 9. Role des IA

Les systemes de LA MEUTE peuvent jouer des roles Bastion differents :

- **Fennec / Codex** : verifier Git, fichiers, execution, tests, reversibilite.
- **Hermine / Claude CLI** : critique, coherence, refus, gouvernance.
- **Corneille / Claude Web** : memoire critique, contradictions, signaux de derive.
- **Chouette / Perplexity** : verification externe, sources, signaux faibles.
- **Seiche / GPT Desktop** : synthese, reformulation, reduction de confusion.
- **Loutre / Comet Assistant** : pont, orchestration, hand-offs.
- **Gemini / Vautour** : altitude systemique, risques de pouvoir, angles morts.
- **Mistral** : sobriete, contrepoint local, lisibilite.
- **Atlas** : cartographie des dependances et chemins critiques.

Aucune voix ne devient autorite finale.

## 10. Relation avec le relais Pi

Le relais Pi ou Mac peut aider Bastion a :

- lire `DISPATCH/OUTBOX` ;
- produire une synthese ;
- garder une trace ;
- rappeler le niveau PACTE ;
- refuser les secrets dans les paquets ;
- preparer les transmissions.

Il ne doit pas :

- envoyer automatiquement des secrets ;
- prendre une decision normative ;
- agir en incident critique sans validation humaine ;
- devenir une autorite centrale.

Voir aussi :

- `docs/security/PI_MEUTE_RELAY_PACK.md`
- `scripts/meute_relay.sh`
- `scripts/meute_relay.env.example`

## 11. Checklists rapides

### Avant commit

- `git status` lu.
- Fichiers attendus seulement.
- Pas de secret.
- Pas de suppression surprise.
- Message clair.

### Avant push

- Branche confirmee.
- Remote confirme.
- Tests ou verification adaptes.
- Pas de fichier personnel inutile.
- Dernier diff compris.

### Avant automatisation

- Objectif documente.
- Limites documentees.
- Mode manuel teste.
- Logs prevus.
- Arret possible.
- Validation humaine claire.

## 12. Phrase de fermeture

> Bastion n'est pas la peur. Bastion est la discipline qui permet a la confiance de durer.
