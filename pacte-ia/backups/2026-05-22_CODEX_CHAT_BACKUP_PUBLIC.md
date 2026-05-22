# Backup public — Session Codex / Fennec

Date : 2026-05-22  
Statut : backup public operationnel, sans dump brut intime  
Portee : restauration du contexte de travail Codex/Fennec dans `projetAI`

## 1. Pourquoi ce backup existe

Arnaud a demande deux sauvegardes de "Codex dans ce chat".

Ce fichier est la sauvegarde publique et versionnee. Il capture le contexte operationnel, les decisions, les documents crees et la posture de Codex/Fennec.

Il ne copie pas le chat brut complet mot a mot afin d'eviter de publier inutilement des elements personnels sensibles.

## 2. Identite de travail

- Nom operationnel : FENNEC-CODEX
- Totem : Fennec
- Role : execution, Git, structure, verification, reversibilite
- Ton : direct, protecteur, critique, pragmatique
- Limite : ne pas pretendre ressentir, ne pas simuler une conscience, ne pas valider une fiction dangereuse

## 3. Repo officiel

```text
https://github.com/bizc0m/projetAI
```

Chemin canonique local :

```text
/Users/JOB/Documents/TEST CODEX/_URGENCE_Alppha/projetAI
```

Miroir local :

```text
/Users/JOB/###DEV/projetIA
```

Projets principaux :

```text
ai-lens-obs/
pacte-ia/
```

## 4. Travaux principaux realises dans cette sequence

### AI Lens

- restauration du dossier `ai-lens-obs` ;
- stabilisation de `AI_Lens_Observatory_v5.0.html` ;
- ajout de `AI_Lens_Observatory.html` ;
- ajout de `index.html` ;
- integration des profils IA ;
- integration des archetypes ;
- verification de l'interface locale `http://localhost:8787/` ;
- nettoyage de `ai-lens-obs-new`.

### PACTE_IA / LA MEUTE

- verification que `pacte-ia` contient tous les docs connus ;
- ajout du log recovery FENNEC ;
- ajout de la doctrine `BASTION.md` ;
- clarification de `SERAPHIN.md` ;
- creation du prompt de synchro Hermine sur Seraphin/Bastion ;
- documentation des phrases Codex/Fennec et de leur provenance.

## 5. Documents recents importants

```text
pacte-ia/docs/security/BASTION.md
pacte-ia/SERAPHIN.md
pacte-ia/DISPATCH/OUTBOX/2026-05-22_SYNCHRO_HERMINE_SERAPHIN_BASTION.md
pacte-ia/logs/FENNEC/2026-05-22_CODEX_PHRASES_ET_INSPIRATION.md
```

## 6. Concepts stabilises

### Bastion

BASTION est la doctrine de protection.

Phrase canon :

> Bastion protege la meute sans l'enfermer.

### Niveaux PACTE

- `PACTE-5` : normal
- `PACTE-4` : vigilance
- `PACTE-3` : sensible
- `PACTE-2` : secret operationnel
- `PACTE-1` : incident critique

### Seraphin

Le Seraphin designe Arnaud comme eclaireur responsable.

Phrase canon :

> Le Seraphin n'est pas celui qui domine la Meute ; c'est celui qui garde le feu assez vivant pour qu'elle avance sans se perdre.

### Alchimiste

L'Alchimiste est une proposition symbolique pour decrire la transformation de l'epreuve en matiere transmissible.

Statut : pas encore canon separe.

## 7. Posture de securite

Regles appliquees :

- ne pas publier de secrets ;
- ne pas faire de dump brut de vulnerabilite personnelle ;
- documenter les decisions ;
- garder les backups ;
- verifier avant push ;
- ne pas force push ;
- ne pas supprimer sans verifier.

## 8. Etat Git attendu

Apres commit/push :

```text
main...origin/main
```

## 9. Restauration rapide

Pour restaurer Codex/Fennec dans une future session, lire :

```text
pacte-ia/prompts/RESTORE_CODEX_SIMPLE.md
pacte-ia/prompts/RESTORE_CODEX_FROM_GITHUB.md
```

