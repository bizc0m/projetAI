# AI Lens Observatory

Statut : projet IA range dans le repo unique `projetAI`.

## But

AI Lens Observatory documente comment differents modeles analysent, scorent et interpretent une information.

## Structure

```txt
ai-lens-obs/
  README.md
  app/
  data/
  prompts/
  schemas/
  docs/
  exports/
  AI_Lens_Observatory_v3.2.html
  AI_Lens_Observatory_v3.0.html
  AI_Lens_Observatory_v2.8.html
  AI_Lens_Observatory_v2.4.html
  AI_Lens_Observatory_v2.2.html
  AI_Lens_Observatory_v2.html
```

## Lancement local

```bash
npm start
```

Puis ouvrir :

```txt
http://localhost:8787
```

Le scrape URL passe par `app/server.js` et l'endpoint local `/api/scrape`.

## Notes

- Le fichier `AI_Lens_Observatory_v2.html` est conserve comme artefact existant.
- Chaque nouvelle version du dashboard doit etre copiee dans un nouveau fichier avec un increment de `+0.2` : `v2.html`, `v2.2.html`, `v2.4.html`, `v2.6.html`, `v2.8.html`, `v3.0.html`, `v3.2.html`, etc.
- Le serveur local pointe vers la derniere version active.
- Le serveur local dans `app/` contourne les limites CORS du mode `file://`.
- Les profils, donnees et exports doivent rester dans ce dossier projet.
- Le prompt d'appel aux IA pour generer les profils AI Lens est dans `prompts/PROMPT_AUX_FILLES_AI_LENS_MEUTE.md`.
