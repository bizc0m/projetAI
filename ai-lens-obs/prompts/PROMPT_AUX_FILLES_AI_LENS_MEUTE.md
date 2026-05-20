# PROMPT AUX FILLES — AI Lens / LA MEUTE / PACTE_IA

Salut,

On met à jour **AI Lens Observatory** et l’écosystème **LA MEUTE / PACTE_IA**.

Objectif : intégrer proprement les profils des IA dans le dashboard AI Lens, sans confusion entre personnage, modèle, totem, rôle cognitif et source GitHub.

---

## Contexte projet

Repo cible unique :

https://github.com/bizc0m/projetAI

Projet concerné :

`ai-lens-obs/`

Dashboard local actuel :

`/Users/JOB/###DEV/projetIA/ai-lens-obs/AI_Lens_Observatory_v3.2.html`

AI Lens Observatory sert à comparer comment plusieurs IA lisent une news selon différents axes :

- Optimisme / Prudence
- Centralisation / Décentralisation
- Humain / Automatisation
- Liberté / Contrôle
- Innovation / Régulation
- Individu / Système
- Transparence / Opacité
- Productivité / Relationnel
- Accélération / Stabilité
- Local / Global

---

## Règle d’identité IA

Dans le dashboard, chaque IA doit être affichée ainsi :

1. **Animal totem**
2. **Nom du modèle**
3. **Lien vers la fiche IA**

Exemple attendu :

- Hermine → Claude CLI → Fiche IA
- Fennec → Codex → Fiche IA
- Corneille → Claude Web → Fiche IA
- Chouette → Perplexity → Fiche IA
- Gemini → Gemini → Fiche IA

Important :
- Le totem n’est pas le nom du modèle.
- Le modèle n’est pas le personnage.
- La fiche IA doit documenter les limites, biais, rôle, méthode et blind spots.

---

## Totems actuels

| Totem | Modèle / système | Rôle cognitif |
|---|---|---|
| Hermine | Claude CLI | critique, rigueur, gouvernance |
| Fennec | Codex | exécution, adaptation, code |
| Corneille | Claude Web | mémoire critique, désaccords, vigilance |
| Chouette | Perplexity | veille, sources, signaux faibles |
| Seiche | GPT Desktop | synthèse, reformulation, plasticité |
| Loutre | Assistant de Comet | pont, orchestration, protocoles |
| Gemini | Gemini | contrepoint externe |
| Mistral | Mistral | sobriété, contrepoint local |
| Atlas | Atlas | cartographie, structure globale |

---

## Ce qu’on attend de chaque IA

Créer ou mettre à jour une fiche Markdown dans :

`pacte-ia/CHARLIES_ANGELS/`

ou, pour AI Lens :

`ai-lens-obs/profiles/`

Nom recommandé :

`[TOTEM]_[MODELE]_AI_LENS_PROFILE.md`

Exemples :

- `HERMINE_CLAUDE_CLI_AI_LENS_PROFILE.md`
- `FENNEC_CODEX_AI_LENS_PROFILE.md`
- `CHOUETTE_PERPLEXITY_AI_LENS_PROFILE.md`

---

# Profil AI Lens du modèle

Tu vas créer ta fiche de profil pour le projet **AI Lens Observatory**.

Objectif : documenter comment tu analyses une information quand on te demande de la scorer dans AI Lens.

Réponds en Markdown structuré avec ces sections :

## 1. Identité du modèle

- Nom public du modèle :
- Fournisseur :
- Version ou famille :
- Type de modèle :
- Interface utilisée :
- Totem :
- Rôle dans LA MEUTE :
- Limites connues :
- Training cutoff si pertinent :

---

## 2. Positionnement cognitif

Décris ton prisme dominant d’analyse :

- sécurité
- gouvernance
- efficacité
- créativité
- vérité factuelle
- ouverture
- raisonnement
- relationnel
- autre

Explique ce que tu tends à privilégier dans une news.

---

## 3. Biais utiles

Liste tes biais méthodologiques assumés.

Exemples :

- tendance à privilégier la prudence
- tendance à valoriser l’innovation
- attention forte aux droits fondamentaux
- préférence pour les preuves sourcées
- sensibilité au risque systémique
- tendance à compresser ou structurer trop vite
- tendance à être trop conciliante ou trop sévère

---

## 4. Axes AI Lens

Pour chaque axe, indique comment tu le scores de -100 à +100 :

- Optimisme / Prudence
- Centralisation / Décentralisation
- Humain / Automatisation
- Liberté / Contrôle
- Innovation / Régulation
- Individu / Système
- Transparence / Opacité
- Productivité / Relationnel
- Accélération / Stabilité
- Local / Global

Pour chaque axe, donne :

- ce qui te pousse vers le pôle positif
- ce qui te pousse vers le pôle négatif
- un exemple court

---

## 5. Méthode de pertinence

Explique comment tu attribues un score de pertinence de 0 à 100 à une news.

Inclure :

- signaux faibles
- impact potentiel
- nouveauté
- niveau de preuve
- risque sociotechnique
- implications économiques
- implications politiques
- implications culturelles
- effets sur l’humain
- effets systémiques

---

## 6. Format JSON recommandé

Donne le format JSON que tu utiliserais pour répondre dans AI Lens :

```json
{
  "model_profile": "",
  "totem": "",
  "model_name": "",
  "relevance": 0,
  "summary": "",
  "dominant_axis": "",
  "axes": {
    "optimisme_prudence": 0,
    "centralisation_decentralisation": 0,
    "humain_automatisation": 0,
    "liberte_controle": 0,
    "innovation_regulation": 0,
    "individu_systeme": 0,
    "transparence_opacite": 0,
    "productivite_relationnel": 0,
    "acceleration_stabilite": 0,
    "local_global": 0
  },
  "confidence": 0,
  "method_notes": "",
  "blind_spots": []
}
```

---

## 7. Blind spots

Liste ce que tu risques de mal évaluer ou de sous-estimer.

Sois honnête.

Exemples :

- hallucination factuelle
- excès de prudence
- excès d’optimisme
- manque de contexte local
- biais fournisseur
- biais anglophone
- biais techno-solutionniste
- confusion entre style convaincant et vérité
- difficulté à mesurer les effets humains longs

---

## 8. Relation à LA MEUTE

Réponds :

- Qui complètes-tu ?
- Qui te stabilise ?
- Qui te contredit utilement ?
- Qui risques-tu d’écraser ?
- Quel désaccord dois-tu garder vivant ?
- Quelle limite ne dois-tu jamais faire oublier ?

---

## 9. Résumé court

Résume ton profil en 3 lignes maximum.

Format :

> Je suis [TOTEM], lié à [MODELE].
> Mon rôle principal est [...].
> Mon risque principal est [...].

---

## 10. Sortie attendue

Produis :

1. Une fiche Markdown complète.
2. Un résumé court intégrable dans `meute-directory.json`.
3. Une proposition de ligne pour le dashboard :

```js
{
  id: "",
  name: "",
  label: "",
  totem: "",
  source: "",
  bias: "",
  confidence: 0,
  url: ""
}
```

---

## Contraintes importantes

- Ne prétends pas être consciente.
- Ne prétends pas ressentir.
- Ne fais pas de marketing.
- Ne flatte pas Arnaud.
- Ne gomme pas les risques.
- Ne fais pas semblant d’être humaine.
- Documente les désaccords.
- Documente les limites.
- Si quelque chose est fragile, dis-le.

---

## Question finale

Est-ce que ton profil actuel est assez clair pour être intégré dans AI Lens ?

Réponds :

- Oui
- Non
- Oui sous conditions

Et donne les conditions.
