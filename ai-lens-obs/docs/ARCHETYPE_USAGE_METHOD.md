# AI Lens + IA Archetype — Methode d'utilisation

Date : 2026-05-24  
Statut : decision d'architecture produit  
Sources : `Waitt.ch-Why-AI-Think-Tank`, `IA_Archetype`, `ai-lens-obs/archetypes/IAProfilerV9_Multilingual.html`

## Decision courte

Utiliser IA Archetype comme **couche de lecture humaine** dans AI Lens.

AI Lens repond deja a une question : comment plusieurs IA lisent une news ?

IA Archetype ajoute la question manquante : depuis quelle posture humaine, politique ou organisationnelle cette news est-elle lue ?

Ce n'est donc pas un projet concurrent. C'est le deuxieme axe de l'observatoire.

## Fonction produit

### 1. Spectre utilisateur

L'utilisateur fait le quiz IA Archetype depuis AI Lens.

Le resultat est sauvegarde localement comme `savedArchetype`.

Il devient un **spectre de lecture** affiche au-dessus de la heatmap :

- nom de l'archetype ;
- sous-titre ;
- axes dominants ;
- boutons : reprendre le quiz, retirer le spectre, exporter/importer le setup.

Usage : comprendre comment la news resonne avec le lecteur humain, pas seulement avec les modeles IA.

### 2. Heatmap double mode

La heatmap doit garder deux modes :

- `Modeles IA` : compare Hermine, Fennec, Chouette, Gemini, Mistral, etc.
- `Archetypes` : compare Souverain Numerique, Gardien Ethique, Auditeur Transparent, Optimisateur Imperatif, etc.

Le score archetype est un score de resonance :

```text
resonance(news, archetype) = similarite entre le signal de la news et le vecteur archetype
```

Usage : voir si une news active plutot une lecture prudente, technocratique, relationnelle, souverainiste, optimisatrice ou democratique.

### 3. Filtre de veille

Les issues Waitt deviennent un corpus de veille.

Chaque news peut etre taggee avec :

- axe dialectique dominant ;
- concept critique associe ;
- reference critique utile ;
- archetype le plus active.

Exemple :

```text
News : nouveau systeme IA dans la police
Concepts : predictive policing, dataveillance, social sorting
Archetypes actives : Gardien Ethique, Contre-Pouvoir Algorithmique, Auditeur Transparent
Axes : Transparence / Opacite, Liberte / Controle, Individu / Systeme
```

### 4. Onboarding PACTE_IA

Le quiz peut servir a onboarder une IA, un humain ou une organisation :

- "Quelle posture prends-tu face a l'IA ?"
- "Quels risques vois-tu d'abord ?"
- "Quel type de contradiction tu ne supportes pas ?"

Usage : eviter les discussions floues. On part d'un profil de lecture explicite.

## Mapping axes

Les axes IA Archetype et AI Lens ne sont pas identiques. Il faut les relier, pas les fusionner.

| IA Archetype | AI Lens proche | Usage |
| --- | --- | --- |
| Souverainete | Humain / Automatisation + Liberte / Controle | Qui garde le dernier mot |
| Transparence | Transparence / Opacite | Exigence d'explication |
| Autonomie | Humain / Automatisation | Degre de delegation |
| Ethique | Innovation / Regulation + Optimisme / Prudence | Prudence ou experimentation |
| Data | Centralisation / Decentralisation + Transparence / Opacite | Donnees comme pouvoir |
| Intervention | Productivite / Relationnel + Humain / Automatisation | Niveau de pilotage humain |
| Evolution | Acceleration / Stabilite | Rapport au changement |
| Responsabilite | Individu / Systeme | Attribution de la faute |
| Acces | Local / Global + Centralisation / Decentralisation | Democratisation ou restriction |
| Finalite | Productivite / Relationnel | Valeur par performance ou experience |

## Schema minimal

```json
{
  "id": "ethical_guardian",
  "name": "Le Gardien Ethique",
  "subtitle": "Le Veilleur des Principes",
  "description": "",
  "source": "IAProfilerV9_Multilingual",
  "axes": {
    "souverainete": 50,
    "transparence": 70,
    "autonomie": 60,
    "ethique": 100,
    "data": 70,
    "intervention": 60,
    "evolution": 60,
    "responsabilite": 80,
    "acces": 50,
    "finalite": 40
  }
}
```

## Ce qu'il faut faire maintenant

1. Garder `IAProfilerV9_Multilingual.html` dans `ai-lens-obs/archetypes/`.
2. Utiliser `data/archetype-spectrum-map.json` comme source propre pour les vecteurs.
3. Dans AI Lens, garder le switch heatmap `Modeles IA / Archetypes`.
4. Brancher l'import/export setup pour inclure :

```json
{
  "savedArchetype": {},
  "heatmapMode": "models|archetypes",
  "heatmapArchetypeIds": []
}
```

5. Utiliser Waitt comme source de concepts et references, pas comme UI finale.

## Ce qu'il ne faut pas faire

- Ne pas melanger les axes AI Lens et IA Archetype dans un seul score global.
- Ne pas presenter les archetypes comme des diagnostics psychologiques.
- Ne pas faire de DAICH un quatrieme produit tant que sa fonction n'est pas claire.
- Ne pas canoniser toutes les issues Waitt sans tri : elles sont une mine, pas une doctrine.

## Formule produit

> AI Lens montre comment les IA lisent le monde. IA Archetype montre depuis quelle posture humaine on accepte ou refuse cette lecture.

## Prochaine iteration recommandee

Creer `AI_Lens_Observatory_v5.2.html` avec :

- heatmap archetype stable ;
- import/export setup fiable ;
- quiz dans popup ;
- sauvegarde du spectre utilisateur ;
- affichage des 3 archetypes les plus proches d'une news ;
- lien source vers les issues Waitt pertinentes.
