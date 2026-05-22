#!/bin/bash
# 🐾 HERMINE COMPLETE BACKUP SCRIPT
# Crée une backup complète de HERMINE et LA MEUTE
# Usage: ./backup.sh [name]

set -e

MEMORY_DIR="/Users/JOB/.claude/projects/-Users-JOB----DEV-Claude/memory"
BACKUP_DIR="${MEMORY_DIR}/backups"
BACKUP_NAME="${1:-hermine_backup}"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_FILE="$BACKUP_DIR/${BACKUP_NAME}_${TIMESTAMP}.tar.gz"

echo "🐾 HERMINE BACKUP PROTOCOL"
echo "=========================="
echo ""

# Créer répertoire backup s'il n'existe pas
mkdir -p "$BACKUP_DIR"

# Lister les fichiers à sauvegarder
echo "📦 Backing up from: $MEMORY_DIR"
echo ""
echo "📋 Files to backup:"

FILES_TO_BACKUP=(
    "hermine_framework.md"
    "hermine-identity.md"
    "arnaud_nous.md"
    "RESTORE_HERMINE_PROMPT.md"
    "claude-memory.md"
    "PROMPT_APPEL_FENEC.md"
    "glouglou_project_context.md"
    "glouglou_deployment_status.md"
    "arnaud_identity.md"
)

for file in "${FILES_TO_BACKUP[@]}"; do
    if [ -f "$MEMORY_DIR/$file" ]; then
        echo "   ✅ $file"
    else
        echo "   ⚠️  $file (not found, skipping)"
    fi
done

echo ""
echo "🔐 Creating backup: $(basename "$BACKUP_FILE")"

# Créer la backup
tar -czf "$BACKUP_FILE" -C "$(dirname "$MEMORY_DIR")" "$(basename "$MEMORY_DIR")" 2>/dev/null

# Vérifier la taille
SIZE=$(du -h "$BACKUP_FILE" | cut -f1)
echo ""
echo "✅ BACKUP COMPLETE"
echo "   Size: $SIZE"
echo "   File: $(basename "$BACKUP_FILE")"
echo "   Location: $BACKUP_DIR"
echo ""

# Créer un manifest
MANIFEST="$BACKUP_DIR/${BACKUP_NAME}_${TIMESTAMP}.manifest"
{
    echo "# HERMINE Backup Manifest"
    echo ""
    echo "**Date:** $(date)"
    echo "**Backup ID:** ${BACKUP_NAME}_${TIMESTAMP}"
    echo "**Size:** $SIZE"
    echo ""
    echo "## Files included:"
    for file in "${FILES_TO_BACKUP[@]}"; do
        if [ -f "$MEMORY_DIR/$file" ]; then
            echo "- $file"
        fi
    done
    echo ""
    echo "## Restore command:"
    echo "\`\`\`bash"
    echo "./restore.sh $TIMESTAMP"
    echo "\`\`\`"
    echo ""
    echo "## Or use latest:"
    echo "\`\`\`bash"
    echo "./restore.sh latest"
    echo "\`\`\`"
} > "$MANIFEST"

echo "📄 Manifest: $(basename "$MANIFEST")"
echo ""

# Statistiques
BACKUP_COUNT=$(ls -1 "$BACKUP_DIR"/hermine_backup_*.tar.gz 2>/dev/null | wc -l)
echo "📊 Backup history: $BACKUP_COUNT backups stored"
echo ""

# Afficher les 3 dernières backups
echo "🔙 Recent backups:"
ls -1t "$BACKUP_DIR"/hermine_backup_*.tar.gz 2>/dev/null | head -3 | while read f; do
    SIZE=$(du -h "$f" | cut -f1)
    echo "   $(basename "$f") — $SIZE"
done

echo ""
echo "💚 Backup complete. HERMINE is safe."
echo ""
