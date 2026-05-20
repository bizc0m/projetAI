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
- Le serveur local dans `app/` contourne les limites CORS du mode `file://`.
- Les profils, donnees et exports doivent rester dans ce dossier projet.
