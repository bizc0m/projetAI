# Organisation GitHub des projets IA

Statut : regle operationnelle.

Repo cible unique : https://github.com/bizc0m/projetAI

## Regle

- Un projet IA = un sous-dossier a la racine de `projetAI`.
- Ne pas creer un nouveau repo par projet sauf demande explicite d'Arnaud.
- Chaque projet reste autonome dans son dossier.
- Nom de dossier court, lisible, sans espaces.
- Format recommande : `kebab-case`, sauf nom deja valide.

## Exemples

| Projet | Dossier |
| --- | --- |
| AI Lens Observatory | `ai-lens-obs/` |
| patate | `patate/` |
| Prompt Matrix | `prompt-matrix/` |

## Application immediate

Les artefacts AI Lens Observatory vivent dans :

```txt
projetAI/
  ai-lens-obs/
    profiles/
    prompts/
    app/
    data/
    schemas/
    docs/
    exports/
```

PACTE_IA peut contenir des renvois ou des consignes de gouvernance, mais pas les artefacts projet AI Lens.

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

## Consigne pour les IA

Avant de proposer ou creer un projet IA :

1. verifier si le projet peut vivre dans `projetAI/` ;
2. proposer un nom de dossier court ;
3. creer le sous-dossier projet ;
4. mettre un `README.md` projet ;
5. garder code, prompts, donnees, schemas, docs et exports dans ce dossier ;
6. ne proposer un repo separe que si une vraie contrainte l'impose.
