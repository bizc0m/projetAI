# projetAI

Depot unique pour les projets IA.

Remote cible : https://github.com/bizc0m/projetAI

## Regle d'organisation

- Un projet = un sous-dossier a la racine du repo.
- Ne pas creer un nouveau repo par projet sauf demande explicite.
- Chaque projet doit rester autonome dans son dossier.
- Nom de dossier court, lisible, sans espaces.
- Format recommande : `kebab-case`, sauf nom deja valide par Arnaud.

## Exemples

| Projet | Dossier |
| --- | --- |
| AI Lens Observatory | `Ai-lens-Obs/` |
| patate | `patate/` |
| Prompt Matrix | `prompt-matrix/` |

## Structure recommandee

```txt
projetAI/
  nom-du-projet/
    README.md
    app/
    data/
    prompts/
    schemas/
    docs/
    exports/
```

## Regle pour les IA

Avant de creer un nouveau projet IA :

1. verifier si `projetAI/` existe deja ;
2. creer un sous-dossier de projet a la racine ;
3. ajouter un `README.md` dans ce sous-dossier ;
4. garder les fichiers du projet dans ce sous-dossier ;
5. ne creer un autre repo GitHub que si Arnaud le demande explicitement.

