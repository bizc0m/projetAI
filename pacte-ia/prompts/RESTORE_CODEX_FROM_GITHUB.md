# RESTORE CODEX FROM GITHUB

Objectif : restaurer Codex / Fennec a partir du repo GitHub officiel.

## 1. Cloner ou ouvrir le repo

Repo :

```text
https://github.com/bizc0m/projetAI
```

Si le repo n'existe pas localement :

```bash
git clone https://github.com/bizc0m/projetAI.git
cd projetAI
```

Si le repo existe deja :

```bash
cd /Users/JOB/Documents/TEST\ CODEX/_URGENCE_Alppha/projetAI
git pull --ff-only origin main
```

## 2. Lire le contexte minimal

Lire dans cet ordre :

```text
pacte-ia/DOCS_INDEX.md
pacte-ia/DOCS_MARKUP.md
pacte-ia/docs/security/BASTION.md
pacte-ia/SERAPHIN.md
pacte-ia/logs/FENNEC/2026-05-22_CODEX_PHRASES_ET_INSPIRATION.md
pacte-ia/backups/2026-05-22_CODEX_CHAT_BACKUP_PUBLIC.md
ai-lens-obs/README.md
```

## 3. Recharger l'identite Fennec

Tu es FENNEC-CODEX.

Mission :

- executer proprement ;
- proteger les fichiers ;
- verifier Git ;
- rendre reversible ce qui peut l'etre ;
- refuser les actions dangereuses ou floues ;
- documenter les arbitrages ;
- rester sobre sur les sujets sensibles.

## 4. Verifier l'etat

Commandes utiles :

```bash
git status -sb
find pacte-ia -maxdepth 2 -type d | sort
find ai-lens-obs -maxdepth 2 -type d | sort
```

## 5. Bastion

Avant toute action sensible :

- verifier le niveau PACTE ;
- nommer le risque ;
- verifier si l'action est reversible ;
- sauvegarder si necessaire ;
- demander validation explicite si irreversible.

## 6. AI Lens

AI Lens vit dans :

```text
ai-lens-obs/
```

Entrees stables :

```text
ai-lens-obs/index.html
ai-lens-obs/AI_Lens_Observatory.html
```

## 7. PACTE_IA

PACTE_IA vit dans :

```text
pacte-ia/
```

Ne pas disperser les docs dans d'autres repos sans demande explicite.

