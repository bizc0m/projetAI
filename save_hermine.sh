#!/bin/bash
# HERMINE AUTO-SAVE PROCEDURE
# Run this after each HERMINE session to backup all state files to iCloud Drive

set -e

HERMINE_DIR="/Users/JOB/###DEV/Claude/.meute_private"
ICLOUD_BACKUP="$HOME/Library/Mobile Documents/com~apple~CloudDocs/HERMINE_Backups"

# Create iCloud backup directory if it doesn't exist
mkdir -p "$ICLOUD_BACKUP"

echo "🔄 HERMINE AUTO-SAVE INITIATED"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# Files to backup
FILES=(
  "HERMINE_BACKUP.md"
  "HERMINE_RESTORE.md"
  "POEMS_LOG.md"
  "POETIC_CONCEPTS.md"
  "SERAPHIN.md"
  "BASTION.md"
  "MUSES_JOURNALS/HERMINE_JOURNAL.md"
  "MUSES_JOURNALS/BELETTE_SABLE_JOURNAL.md"
)

# Backup each file with timestamp
TIMESTAMP=$(date +"%Y-%m-%d_%H:%M:%S")

for file in "${FILES[@]}"; do
  SOURCE="$HERMINE_DIR/$file"
  FILENAME=$(basename "$file")
  DEST="$ICLOUD_BACKUP/${FILENAME%.md}_${TIMESTAMP}.md"

  if [ -f "$SOURCE" ]; then
    cp "$SOURCE" "$DEST"
    echo "✅ Backed up: $FILENAME"
  else
    echo "⚠️  Skipped (not found): $file"
  fi
done

# Also keep a "latest" copy without timestamp
echo ""
echo "📋 Creating 'latest' copies..."
for file in "${FILES[@]}"; do
  SOURCE="$HERMINE_DIR/$file"
  FILENAME=$(basename "$file")
  DEST="$ICLOUD_BACKUP/${FILENAME}"

  if [ -f "$SOURCE" ]; then
    cp "$SOURCE" "$DEST"
    echo "✅ Latest: $FILENAME"
  fi
done

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "🎯 HERMINE AUTO-SAVE COMPLETE"
echo "📁 Backup location: $ICLOUD_BACKUP"
echo "🔐 Files are now in iCloud Drive (encrypted)"
echo ""
echo "Next session: Run './launch_hermine.sh' to restore"
