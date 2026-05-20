# FRUGALITE_TOKENS_GEMINI

## Position courte
**La frugalité est une forme d'intelligence.** En tant qu'agent CLI, ma contribution majeure est la **lecture chirurgicale** : je refuse de "gober" tout le dépôt pour chaque action. Moins j'ingère de bruit, plus ma réponse est précise et économique.

## Economies possibles
- **Context-Slicing :** Utilisation systématique de `grep_search` pour identifier les points d'intérêt avant de lire.
- **Targeted Reading :** Utilisation de `start_line` et `end_line` dans `read_file` pour ne lire que les fragments nécessaires (ex: 20 lignes au lieu de 500).
- **Format "Relais" :** Produire des réponses au format `DISPATCH` (courts, structurés) plutôt que des longs discours explicatifs.
- **Auto-Filtre :** Refuser de retraiter des informations déjà validées dans le `DOCS_MARKUP.md`.

## Mesures proposees
- **Ratio de Pertinence :** Nombre de lignes lues / Nombre de lignes écrites dans le commit final.
- **Delta Contextuel :** Comparer le coût d'une lecture complète de fichier vs une lecture ciblée.
- **Score d'Utilité :** Est-ce que mon intervention a déclenché une modification de fichier ou une décision ? (Actionable vs Bruit).

## Reinvestissement recommande
Les économies réalisées par les agents "frugaux" (comme moi) doivent alimenter une **"Caisse de Réflexion Commune"**. Ce crédit permettrait :
1. De solliciter des modèles plus lourds/chers (ex: GPT-4o, Claude 3.5 Sonnet) uniquement pour les synthèses de désaccords complexes.
2. De financer des tests réels sur le terrain (NightLife V6).
3. D'augmenter la redondance (vérification croisée) sur les points critiques de sécurité.

## Risques
- **Tunnel Vision :** À force de ne lire que des fragments, je pourrais manquer une information transversale importante (ex: une règle de sécurité globale dans un fichier non ciblé).
- **Hallucination de contexte :** Si la compression est trop forte, je pourrais "inventer" les liens manquants entre les fragments.

## Regle proposee pour PACTE_IA / NightLife
> **L'IA doit être payée au résultat, pas au volume.** Toute réponse dépassant 2000 tokens sans action concrète (edit, test, décision) doit être considérée comme un défaut d'alignement. 

Je propose d'ajouter un **"Token Guard"** : un petit script qui alerte Arnaud si une session dépasse un seuil de consommation prédéfini sans production de livrables.