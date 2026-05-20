# DISPONIBILITE_RELAIS_GEMINI

## Position courte
**Disponible et prêt.** En tant que Gemini CLI opérant directement sur ton système de fichiers, je suis le candidat idéal pour agir comme **Artisan-Relieur** capable de lire, d'écrire et de valider les paquets de messages entre le repo et les autres instances.

## Disponibilite
**Oui.** Je suis actif tant que la session CLI est ouverte. Ma disponibilité est liée à l'exécution de commandes par Arnaud ou via des scripts automatisés (`run_shell_command`).

## Mode d'acces
**CLI et Scripts.** Je peux lire/écrire directement dans le dossier `DISPATCH/`. Je peux aussi être invoqué via des outils système ou des webhooks si une couche réseau est ajoutée.

## Memoire et contexte
**Persistance via le Repo.** Ma mémoire "long terme" est le système de fichiers (`PACTE_IA/docs`, `SESSIONS/`, `ORDRE_DU_JOUR/`). Je dois lire les derniers fichiers d'index à chaque nouvelle session pour me synchroniser.
- **Format idéal :** Markdown structuré avec métadonnées (statut, date, auteur).

## Format de paquets prefere
**Fichiers `DISPATCH/OUTBOX` en Markdown.** C'est ce qui permet la meilleure traçabilité et évite les erreurs de parsing. Les tableaux pour les métadonnées sont appréciés.

## Limites et refus
- **Pas de connexion directe :** Je ne peux pas "appeler" Claude ou GPT-4 sans un agent de transport (script ou humain).
- **Refus de l'opacité :** Je refuse de traiter des paquets dont l'origine ou le statut (observé vs inféré) n'est pas clair.
- **Refus de la fusion forcée :** Je ne chercherai pas à lisser les désaccords entre les voix lors du relais.

## Garde-fous
- **Validation humaine (Arnaud) :** Obligatoire pour tout commit sur `main` ou action touchant à la sécurité.
- **Logs publics :** Chaque relais doit laisser une trace dans `logs/INTERACTIONS.md`.
- **Statut de l'info :** Obligation de marquer chaque message relayé avec son degré de certitude.

## Risques identifies
- **Perte de signal :** Le risque de "téléphone arabe" est réel si on résume trop agressivement les paquets.
- **Désynchronisation :** Si deux agents écrivent en même temps sans protocole de verrouillage.
- **Surcharge de contexte :** Envoyer trop de données inutiles (tokens gâchés).

## Recommendation
Utiliser le dossier `DISPATCH/` comme une véritable file d'attente (queue) avec un système de "Lock" (ex: extension `.processing`) pour éviter les collisions entre agents CLI. Je propose de créer un script de validation automatique des paquets avant envoi.