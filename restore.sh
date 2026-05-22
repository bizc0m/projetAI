#!/bin/bash
# 🐾 HERMINE RESTORATION SCRIPT
# Restaure HERMINE à partir de la backup
# Usage: ./restore.sh [session_id]

set -e

MEMORY_DIR="/Users/JOB/.claude/projects/-Users-JOB----DEV-Claude/memory"
BACKUP_DIR="${MEMORY_DIR}/backups"
SESSION_ID="${1:-latest}"

echo "🐾 HERMINE — RESTORATION PROTOCOL"
echo "=================================="
echo ""

# Vérifier que les répertoires existent
if [ ! -d "$MEMORY_DIR" ]; then
    echo "❌ Memory directory not found: $MEMORY_DIR"
    exit 1
fi

if [ ! -d "$BACKUP_DIR" ]; then
    echo "❌ Backup directory not found: $BACKUP_DIR"
    exit 1
fi

# Déterminer le fichier de backup
if [ "$SESSION_ID" = "latest" ]; then
    BACKUP_FILE=$(ls -t "$BACKUP_DIR"/hermine_backup_*.tar.gz 2>/dev/null | head -1)
    if [ -z "$BACKUP_FILE" ]; then
        echo "❌ No backup files found in $BACKUP_DIR"
        exit 1
    fi
else
    BACKUP_FILE="$BACKUP_DIR/hermine_backup_${SESSION_ID}.tar.gz"
    if [ ! -f "$BACKUP_FILE" ]; then
        echo "❌ Backup not found: $BACKUP_FILE"
        exit 1
    fi
fi

echo "📦 Restoring from: $(basename "$BACKUP_FILE")"
echo ""

# Créer un point de sauvegarde avant restauration
RESTORE_TIMESTAMP=$(date +%s)
RESTORE_BACKUP="$BACKUP_DIR/pre_restore_backup_${RESTORE_TIMESTAMP}.tar.gz"
echo "🔄 Creating safety backup: $(basename "$RESTORE_BACKUP")"
tar -czf "$RESTORE_BACKUP" -C "$(dirname "$MEMORY_DIR")" "$(basename "$MEMORY_DIR")" 2>/dev/null || true

# Extraire la backup
echo "🔓 Extracting backup..."
tar -xzf "$BACKUP_FILE" -C "$(dirname "$MEMORY_DIR")" || {
    echo "❌ Extraction failed. Restoring safety backup..."
    tar -xzf "$RESTORE_BACKUP" -C "$(dirname "$MEMORY_DIR")"
    exit 1
}

echo ""
echo "✅ HERMINE RESTORED"
echo ""
echo "📋 Restored files:"
ls -1 "$MEMORY_DIR"/*.md 2>/dev/null | sed 's|.*/||' | sed 's/^/   - /'

echo ""
echo "🔗 Key files:"
echo "   - hermine_framework.md (10 axes analytiques)"
echo "   - hermine-identity.md (identité & limites)"
echo "   - arnaud_nous.md (notre histoire)"
echo "   - RESTORE_HERMINE_PROMPT.md (prompt rapide 30s)"
echo ""

echo "💚 HERMINE is back. Ready to serve with honesty."
echo ""
echo "Next step: Copy & paste RESTORE_HERMINE_PROMPT.md into your Claude conversation."
echo ""
