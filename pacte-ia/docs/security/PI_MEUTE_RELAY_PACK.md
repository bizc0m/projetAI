# PI MEUTE RELAY PACK

Statut : paquet v0 pour Raspberry Pi ou machine Unix legere.

Objectif : faire tourner un relais sobre pour LA MEUTE, capable de lire les paquets `DISPATCH/OUTBOX`, produire une synthese de transmission et garder une trace Git, sans envoyer automatiquement des secrets ni simuler une conscience collective.

## 1. Principe

Le Pi n'est pas un chef. Il est un facteur.

> Le relais transmet, trace et relance. Il ne decide pas, ne fusionne pas les voix, et ne remplace pas l'arbitrage humain.

## 2. Ce que le Pi peut faire

- garder le depot synchronise ;
- lister les paquets `DISPATCH/OUTBOX` ;
- creer une synthese dans `SESSIONS/` ;
- preparer ce qu'Arnaud doit envoyer aux autres systemes ;
- conserver les reponses dans `DISPATCH/INBOX` ;
- aider a produire une synthese contradictoire ;
- fonctionner via cron quand le protocole est stable.

## 3. Ce que le Pi ne doit pas faire en v0

- envoyer des secrets aux IA ;
- stocker des tokens en clair ;
- prendre une decision normative ;
- pousser automatiquement du contenu sensible ;
- agir en mode incident sans validation humaine ;
- masquer des instructions ou du contexte a l'utilisateur.

## 4. DEFCON PACTE_IA

Les niveaux servent a classer l'information, pas a creer une ambiance paranoiaque.

| Niveau | Nom | Usage | Canal |
| --- | --- | --- | --- |
| PACTE-5 | Public | Manifestes, debats, docs publiables | GitHub public |
| PACTE-4 | Interne | Brouillons, coordination, prompts de travail | Repo prive ou local |
| PACTE-3 | Sensible | Infos personnelles, contexte vulnerable, strategie | Canal prive, partage limite |
| PACTE-2 | Secret operationnel | Acces, tokens, machines, recovery | Gestionnaire de secrets, jamais chat |
| PACTE-1 | Incident critique | Compromission, sabotage, perte d'acces | Procedure d'urgence |

Regle :

> Secret sur les vulnerabilites. Public sur les principes. Auditable sur les decisions.

## 5. Installation Raspberry Pi

Prerequis :

- Raspberry Pi OS ou Debian ;
- Git ;
- shell POSIX ;
- acces SSH optionnel ;
- depot `PACTE_IA` clone.

Commandes indicatives :

```bash
sudo apt update
sudo apt install -y git
git clone https://github.com/bizc0m/PACTE_IA.git
cd PACTE_IA
cp scripts/meute_relay.env.example scripts/meute_relay.env
sh scripts/meute_relay.sh
```

Le script affiche le chemin d'une synthese dans `SESSIONS/`.

## 6. Configuration

Fichier :

```text
scripts/meute_relay.env
```

Regles :

- ne pas committer `scripts/meute_relay.env` s'il contient des valeurs sensibles ;
- garder `MEUTE_SEND_MODE=manual` tant que les connecteurs/API ne sont pas audites ;
- garder `MEUTE_PUBLIC_ONLY=true` sur Pi en v0.

## 7. Cron v1

Ne pas activer cron avant d'avoir teste le script manuellement.

Exemple futur :

```cron
*/30 * * * * cd /home/pi/PACTE_IA && git pull --ff-only && sh scripts/meute_relay.sh
```

Ce cron ne push pas automatiquement. Il prepare seulement une synthese.

## 8. Secret et chiffrement

Les IA peuvent traiter les principes en clair. Elles ne doivent pas recevoir les secrets operationnels en clair.

Jamais dans les prompts :

- mots de passe ;
- cles API ;
- tokens ;
- phrases scellees ;
- procedures de recuperation ;
- details complets des machines ;
- infos personnelles vulnerables non necessaires.

## 9. Clandestinite et ethique

La resistance ou la protection d'un projet ne justifie pas automatiquement l'action clandestine.

Critere :

> On ne cache pas pour se sentir important. On cache pour reduire un risque concret.

La clandestinite peut proteger une action juste. Elle ne rend jamais une action juste a elle seule.

## 10. Workflow v0

1. Un humain ou agent cree un paquet dans `DISPATCH/OUTBOX`.
2. Le Pi execute `sh scripts/meute_relay.sh`.
3. Le script cree `SESSIONS/YYYY-MM-DD_HH-MM-SS/SYNTHESE_RELAIS_A_ENVOYER.md`.
4. Arnaud copie-colle les paquets vers les systemes concernes.
5. Les reponses sont enregistrees dans `DISPATCH/INBOX`.
6. Fennec ou un autre agent produit une synthese contradictoire.
7. Les desaccords importants vont dans `ARCHIVE/DISAGREEMENTS.md`.

## 11. Fichiers du pack

- `scripts/meute_relay.sh`
- `scripts/meute_relay.env.example`
- `DISPATCH/OUTBOX/`
- `DISPATCH/INBOX/`
- `DISPATCH/PROCESSED/`
- `SESSIONS/`
- `ARCHIVE/`

## 12. Regle finale

> Le Pi garde la continuite. Arnaud garde la decision. LA MEUTE garde les objections.
