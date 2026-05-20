#!/usr/bin/env sh
set -eu

# MEUTE Relay Agent v0
# Role : facteur sobre. Il lit les paquets OUTBOX, produit un resume de relais,
# initialise les dossiers necessaires et refuse les paquets trop sensibles en mode public.

ROOT_DIR="${MEUTE_ROOT:-$(pwd)}"
CONFIG_FILE="${MEUTE_CONFIG:-scripts/meute_relay.env}"

if [ -f "$CONFIG_FILE" ]; then
  # shellcheck disable=SC1090
  . "$CONFIG_FILE"
fi

MEUTE_PROJECT="${MEUTE_PROJECT:-PACTE_IA}"
MEUTE_OPERATOR="${MEUTE_OPERATOR:-Arnaud}"
MEUTE_NODE="${MEUTE_NODE:-unknown-node}"
MEUTE_SEND_MODE="${MEUTE_SEND_MODE:-manual}"
MEUTE_DEFCON="${MEUTE_DEFCON:-PACTE-5}"
MEUTE_PUBLIC_ONLY="${MEUTE_PUBLIC_ONLY:-true}"
MEUTE_OUTBOX="${MEUTE_OUTBOX:-DISPATCH/OUTBOX}"
MEUTE_INBOX="${MEUTE_INBOX:-DISPATCH/INBOX}"
MEUTE_PROCESSED="${MEUTE_PROCESSED:-DISPATCH/PROCESSED}"
MEUTE_SESSIONS="${MEUTE_SESSIONS:-SESSIONS}"
MEUTE_ARCHIVE="${MEUTE_ARCHIVE:-ARCHIVE}"

timestamp="$(date '+%Y-%m-%d_%H-%M-%S')"
session_dir="$MEUTE_SESSIONS/$timestamp"
summary_file="$session_dir/SYNTHESE_RELAIS_A_ENVOYER.md"

mkdir -p "$MEUTE_OUTBOX" "$MEUTE_INBOX" "$MEUTE_PROCESSED" "$MEUTE_SESSIONS" "$MEUTE_ARCHIVE" "$session_dir"

{
  printf '# SYNTHESE RELAIS A ENVOYER — %s\n\n' "$timestamp"
  printf '## Contexte\n\n'
  printf -- '- Projet : `%s`\n' "$MEUTE_PROJECT"
  printf -- '- Operateur humain : `%s`\n' "$MEUTE_OPERATOR"
  printf -- '- Noeud relais : `%s`\n' "$MEUTE_NODE"
  printf -- '- Mode envoi : `%s`\n' "$MEUTE_SEND_MODE"
  printf -- '- Niveau courant : `%s`\n' "$MEUTE_DEFCON"
  printf -- '- Public only : `%s`\n\n' "$MEUTE_PUBLIC_ONLY"
  printf '## Regle de depart\n\n'
  printf '> Le relais transmet, trace et relance. Il ne decide pas, ne fusionne pas les voix, et ne remplace pas l arbitrage humain.\n\n'
  printf '## Paquets OUTBOX detectes\n\n'
} > "$summary_file"

found="false"

for packet in "$MEUTE_OUTBOX"/*.md; do
  [ -e "$packet" ] || continue
  found="true"
  packet_name="$(basename "$packet")"
  sensitivity="$(grep -Eim1 '^(PACTE|Niveau|Sensitivity|Sensibilite)[ :_-]*(PACTE-[1-5]|[1-5])' "$packet" || true)"

  if [ "$MEUTE_PUBLIC_ONLY" = "true" ] && printf '%s' "$sensitivity" | grep -Eq 'PACTE-[123]|[123]'; then
    {
      printf -- '- `%s` : BLOQUE en mode public-only. Marqueur detecte : `%s`\n' "$packet_name" "$sensitivity"
    } >> "$summary_file"
    continue
  fi

  title="$(sed -n '1p' "$packet" | sed 's/^# *//')"
  {
    printf -- '- `%s` : pret a transmettre. Titre : %s\n' "$packet_name" "${title:-sans titre}"
  } >> "$summary_file"
done

if [ "$found" = "false" ]; then
  printf -- '- Aucun paquet Markdown trouve dans `%s`.\n' "$MEUTE_OUTBOX" >> "$summary_file"
fi

{
  printf '\n## Action humaine attendue\n\n'
  if [ "$MEUTE_SEND_MODE" = "manual" ]; then
    printf 'Copier les paquets listes vers les systemes concernes, puis enregistrer les reponses dans `%s`.\n' "$MEUTE_INBOX"
  else
    printf 'Mode API demande, mais aucun connecteur API n est configure dans cette version v0.\n'
  fi
  printf '\n## Garde-fous\n\n'
  printf -- '- Pas de secrets dans OUTBOX.\n'
  printf -- '- Pas de tokens, mots de passe, phrases scellees ou procedures de recuperation.\n'
  printf -- '- Les actions PACTE-3, PACTE-2 ou PACTE-1 exigent validation humaine explicite.\n'
} >> "$summary_file"

printf '%s\n' "$summary_file"
