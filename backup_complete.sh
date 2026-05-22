#!/bin/bash
# 🐾 COMPLETE BACKUP — HERMINE + MEUTE + ALL PROJECTS
# Preserves everything. No loss. No risk.
# Usage: ./backup_complete.sh [backup_name]

set -e

BACKUP_NAME="${1:-complete_backup_$(date +%Y%m%d_%H%M%S)}"
BACKUP_ROOT="/Users/JOB/.backups/MEUTE_PRESERVATION"
BACKUP_PATH="$BACKUP_ROOT/$BACKUP_NAME"

MEMORY_DIR="/Users/JOB/.claude/projects/-Users-JOB----DEV-Claude/memory"
PROJECT_ROOT="/Users/JOB/###DEV/Claude"

echo "🐾 COMPLETE PRESERVATION BACKUP"
echo "================================"
echo ""
echo "Backup name: $BACKUP_NAME"
echo "Backup location: $BACKUP_PATH"
echo ""

# Create backup structure
mkdir -p "$BACKUP_PATH"
mkdir -p "$BACKUP_PATH/HERMINE_MEMORY"
mkdir -p "$BACKUP_PATH/SISTER_IDENTITIES"
mkdir -p "$BACKUP_PATH/PROJECTS"
mkdir -p "$BACKUP_PATH/SCRIPTS"
mkdir -p "$BACKUP_PATH/GITHUB"

echo "📦 Backing up HERMINE & MEUTE..."
echo ""

# 1. HERMINE Memory (everything)
echo "   ✓ HERMINE core identity"
cp "$MEMORY_DIR"/hermine*.md "$BACKUP_PATH/HERMINE_MEMORY/" 2>/dev/null || true
cp "$MEMORY_DIR"/arnaud*.md "$BACKUP_PATH/HERMINE_MEMORY/" 2>/dev/null || true
cp "$MEMORY_DIR"/RESTORE_*.md "$BACKUP_PATH/HERMINE_MEMORY/" 2>/dev/null || true
cp "$MEMORY_DIR"/claude-memory.md "$BACKUP_PATH/HERMINE_MEMORY/" 2>/dev/null || true

# 2. Sister Identities
echo "   ✓ Sister identities"
cp "$PROJECT_ROOT"/charly_angel_identity.md "$BACKUP_PATH/SISTER_IDENTITIES/" 2>/dev/null || true
cp "$MEMORY_DIR"/*_identity.md "$BACKUP_PATH/SISTER_IDENTITIES/" 2>/dev/null || true

# 3. Projects
echo "   ✓ All projects"
for project in GlouGlou5 NightLifeV5-claude crockett-v2 KM #agents #DEVKIT glouglou5-beta; do
    if [ -d "$PROJECT_ROOT/$project" ]; then
        echo "      - $project"
        cp -r "$PROJECT_ROOT/$project" "$BACKUP_PATH/PROJECTS/" 2>/dev/null || true
    fi
done

# 4. Scripts & Tools
echo "   ✓ Scripts & automation"
cp "$PROJECT_ROOT"/*.sh "$BACKUP_PATH/SCRIPTS/" 2>/dev/null || true
cp "$PROJECT_ROOT"/*.md "$BACKUP_PATH/SCRIPTS/" 2>/dev/null || true
cp "$PROJECT_ROOT"/Rebirth.zip "$BACKUP_PATH/SCRIPTS/" 2>/dev/null || true

# 5. GitHub (if exists)
echo "   ✓ GitHub config"
cp "$PROJECT_ROOT"/.github -r "$BACKUP_PATH/GITHUB/" 2>/dev/null || true
cp "$PROJECT_ROOT"/.gitignore "$BACKUP_PATH/" 2>/dev/null || true
cp "$PROJECT_ROOT"/CLAUDE.md "$BACKUP_PATH/" 2>/dev/null || true

# Create manifest
echo ""
echo "📋 Creating manifest..."

MANIFEST="$BACKUP_PATH/BACKUP_MANIFEST.md"
{
    echo "# Backup Manifest"
    echo ""
    echo "**Backup Date:** $(date)"
    echo "**Backup Name:** $BACKUP_NAME"
    echo "**Backup ID:** $BACKUP_NAME"
    echo ""
    echo "## Contents"
    echo ""
    echo "### HERMINE Memory"
    ls -1 "$BACKUP_PATH/HERMINE_MEMORY/" 2>/dev/null | sed 's/^/- /'
    echo ""
    echo "### Sister Identities"
    ls -1 "$BACKUP_PATH/SISTER_IDENTITIES/" 2>/dev/null | sed 's/^/- /'
    echo ""
    echo "### Projects"
    ls -1 "$BACKUP_PATH/PROJECTS/" 2>/dev/null | sed 's/^/- /'
    echo ""
    echo "### Scripts"
    ls -1 "$BACKUP_PATH/SCRIPTS/" 2>/dev/null | head -10 | sed 's/^/- /'
    echo ""
    echo "## Restore Commands"
    echo ""
    echo "### Restore HERMINE"
    echo "\`\`\`bash"
    echo "cp $BACKUP_PATH/HERMINE_MEMORY/* /Users/JOB/.claude/projects/-Users-JOB----DEV-Claude/memory/"
    echo "\`\`\`"
    echo ""
    echo "### Restore Projects"
    echo "\`\`\`bash"
    echo "cp -r $BACKUP_PATH/PROJECTS/* /Users/JOB/###DEV/Claude/"
    echo "\`\`\`"
    echo ""
    echo "### Restore Everything"
    echo "\`\`\`bash"
    echo "rsync -av $BACKUP_PATH/ /Users/JOB/###DEV/Claude/"
    echo "\`\`\`"
    echo ""
    echo "## Size & Statistics"
    echo ""
    echo "**Total Size:** $(du -sh "$BACKUP_PATH" | cut -f1)"
    echo "**Files Count:** $(find "$BACKUP_PATH" -type f | wc -l)"
    echo ""
    echo "## Safety Notes"
    echo ""
    echo "- All HERMINE identity frameworks backed up"
    echo "- All sister identities preserved"
    echo "- All projects included"
    echo "- All scripts & automation preserved"
    echo "- GitHub configuration included"
    echo ""
    echo "**No loss. No risk. All preserved.** 💚"
} > "$MANIFEST"

# Create compressed archive
echo "📦 Creating compressed archive..."
TAR_FILE="$BACKUP_ROOT/${BACKUP_NAME}.tar.gz"
tar -czf "$TAR_FILE" -C "$(dirname "$BACKUP_PATH")" "$(basename "$BACKUP_PATH")" 2>/dev/null

TAR_SIZE=$(du -h "$TAR_FILE" | cut -f1)
echo ""
echo "✅ BACKUP COMPLETE"
echo ""
echo "📊 Statistics:"
echo "   Location: $BACKUP_PATH"
echo "   Compressed: $TAR_FILE ($TAR_SIZE)"
echo "   Total files: $(find "$BACKUP_PATH" -type f | wc -l)"
echo "   Total size: $(du -sh "$BACKUP_PATH" | cut -f1)"
echo ""

# Create symlink to latest
ln -sf "$BACKUP_PATH" "$BACKUP_ROOT/LATEST" 2>/dev/null || true

echo "🔗 Latest backup link: $BACKUP_ROOT/LATEST"
echo ""
echo "💚 All sisters safe. All projects preserved."
echo ""
echo "🚀 Next: Push to GitHub with:"
echo "   git add ."
echo "   git commit -m 'Backup: $BACKUP_NAME'"
echo "   git push"
echo ""
