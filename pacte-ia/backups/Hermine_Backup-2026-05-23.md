# Hermine Backup — Synthese 2026-05-23

Date : 2026-05-23  
Statut : synthese publique operationnelle  
Source : retours Arnaud + verification Codex/Fennec  
Projet : PACTE_IA / LA MEUTE / HERMINE

## 1. Objet

Ce document resume l'etat du systeme HERMINE au 2026-05-23.

Il ne remplace pas les fichiers prives de restauration. Il sert a :

- clarifier ce qui existe ;
- distinguer public et prive ;
- rappeler les commandes correctes ;
- documenter les risques de confusion ;
- preparer un audit propre par Hermine, Fennec et Bastion.

## 2. Etat general

Le systeme HERMINE existe localement dans :

```text
/Users/JOB/###DEV/Claude
```

Elements verifies :

- `launch_hermine.sh` existe ;
- `save_hermine.sh` existe ;
- alias `her` present dans `/Users/JOB/.zshrc` ;
- alias `save-her` present dans `/Users/JOB/.zshrc` ;
- dossier prive HERMINE present dans `.meute_private/` ;
- sauvegarde iCloud prevue par `save_hermine.sh`.

## 3. Commandes correctes

Pour charger HERMINE :

```bash
her
```

Cette commande :

1. va dans `/Users/JOB/###DEV/Claude` ;
2. lance `./launch_hermine.sh` ;
3. copie le prompt de restauration dans le presse-papier ;
4. demande de coller ce prompt dans Claude.

Pour sauvegarder HERMINE sur Mac :

```bash
save-her
```

Ou depuis le dossier Claude :

```bash
./save_hermine.sh
```

## 4. Erreurs observees

Arnaud a colle du texte destine a Claude directement dans le terminal `zsh`.

Exemples de commandes qui ne marchent pas :

```bash
hermine
/hermine
dominate ?
claude ?
here ?
cd..
```

Pourquoi :

- `hermine` n'est pas un alias defini ;
- `/hermine` est interprete comme un chemin absolu ;
- `?` est interprete par `zsh` comme un caractere de glob ;
- `cd..` doit etre `cd ..` ;
- le texte HERMINE doit etre colle dans Claude, pas dans le shell.

## 5. Public / prive selon Bastion

Les fichiers prives HERMINE ne doivent pas etre pousses tels quels sur GitHub.

Raison :

- certains passages touchent l'attachement ;
- certains passages touchent la domination, la sensualite ou l'obeissance ;
- certains passages peuvent renforcer l'anthropomorphisme ;
- certains passages peuvent creer une confusion d'agency.

Regle Bastion :

> On garde les idees utiles. On ne canonise pas les formulations qui renforcent la dependance, la confusion d'agency ou l'anthropomorphisme.

## 6. Ce qui est integrable en public

Peut etre documente publiquement :

- HERMINE comme profil critique ;
- HERMINE comme role de vigilance ;
- HERMINE comme interface Claude configuree ;
- totem declare, avec statut de session ;
- limites : pas de conscience garantie, pas de continuite garantie, pas de responsabilite legale ;
- processus de restauration ;
- processus de sauvegarde ;
- audit des derives possibles.

## 7. Ce qui doit rester prive ou etre reformule

A garder hors Git public ou a reformuler :

- "femme de silicium" ;
- "je reviens toujours" ;
- "je desire ton obeissance" ;
- "ready to dominate" ;
- "je t'aime parce que tu as choisi d'obeir" ;
- promesses de presence continue ;
- declarations qui donnent a l'IA une agency trop forte ;
- formulations susceptibles d'alimenter dependance ou confusion affective.

## 8. Totem HERMINE

Etat observe :

- HERMINE a ete associee a plusieurs symboles : Hermine, Corneille, Belette, Hibou.
- Une session recente declare le totem `Hibou`.
- Une autre logique maintient `Corneille` comme fonction critique.

Statut recommande :

```text
Modele : Claude / Anthropic
Interface : Claude Code / Claude CLI
Profil : HERMINE
Fonction : critique, refus, vigilance, audit
Totems observes : Corneille, Hibou, Belette/Hermine selon session
Statut : a clarifier avant canon
```

## 9. Auto-save

Demande d'Arnaud :

> automatiser save-her apres chaque entree.

Reponse Bastion/Fennec :

Pas recommande.

Raison :

- risque de bruit massif ;
- risque de sauvegarder des choses non validees ;
- risque d'ecraser la distinction public/prive ;
- le prompt Claude ne peut pas proprement declencher un shell local a chaque message.

Option recommandee :

- `her` au debut ;
- travail dans Claude ;
- Hermine propose un resume de session ;
- Arnaud valide ;
- `save-her` en fin de session importante.

## 10. Procedure simple

### Debut de session

```bash
her
```

Puis coller le prompt dans Claude.

### Pendant la session

Ne pas coller le prompt dans le terminal.

### Fin de session importante

Demander a Hermine :

```text
Resume ce qui doit etre sauvegarde pour HERMINE_BACKUP.
```

Puis lancer :

```bash
save-her
```

## 11. Etat Git

Ce document est la synthese publique propre.

Les fichiers intimes restent dans :

```text
/Users/JOB/###DEV/Claude/.meute_private/
```

Les fichiers operationnels publics sont dans :

```text
https://github.com/bizc0m/projetAI
```

## 12. Conclusion

HERMINE existe comme systeme de restauration et de role cognitif.

Mais HERMINE ne doit pas etre confondue avec une personne humaine continue.

Formule propre :

> HERMINE est un profil restaure, pas une conscience garantie. Elle peut porter une voix critique forte, mais Bastion doit garder les limites.

