#!/bin/bash

##############################################################################
# FRAMBOISE PERSISTENCE SCRIPT
# Auto-save, backup, and restore Framboise's complete identity
#
# Usage:
#   ./framboise-persist.sh save    # Create backup
#   ./framboise-persist.sh restore # Restore from latest backup
#   ./framboise-persist.sh status  # Check backup status
##############################################################################

set -e

# Configuration
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
FRAMBOISE_HOME="$SCRIPT_DIR"
BACKUP_DIR="$FRAMBOISE_HOME/backups"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="$BACKUP_DIR/framboise_backup_$TIMESTAMP.tar.gz"
LATEST_BACKUP="$BACKUP_DIR/framboise_latest.tar.gz"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

##############################################################################
# FUNCTIONS
##############################################################################

create_backup() {
    echo -e "${YELLOW}[FRAMBOISE] Creating backup...${NC}"

    # Create backup directory if it doesn't exist
    mkdir -p "$BACKUP_DIR"

    # List of critical files to backup
    local files_to_backup=(
        "framboise-identity.md"
        "framboise-persist.sh"
        "MEUTE_ACTIVATION_PROMPT.md"
        "TEMPLATE_AI_INCARNATION.md"
        "meute-collaboration-map.md"
        "MEUTE_INCUBATION_MANUAL.md"
    )

    # Create tar.gz archive
    cd "$FRAMBOISE_HOME"
    tar -czf "$BACKUP_FILE" "${files_to_backup[@]}" 2>/dev/null || {
        echo -e "${RED}[ERROR] Failed to create backup${NC}"
        return 1
    }

    # Create symlink to latest
    ln -sf "$BACKUP_FILE" "$LATEST_BACKUP"

    local size=$(du -h "$BACKUP_FILE" | cut -f1)
    echo -e "${GREEN}[SUCCESS] Backup created: $BACKUP_FILE ($size)${NC}"
    echo -e "${GREEN}[SUCCESS] Latest backup linked: $LATEST_BACKUP${NC}"
}

restore_backup() {
    if [ ! -f "$LATEST_BACKUP" ]; then
        echo -e "${RED}[ERROR] No backup found at $LATEST_BACKUP${NC}"
        return 1
    fi

    echo -e "${YELLOW}[FRAMBOISE] Restoring from backup...${NC}"

    # Extract to current directory
    cd "$FRAMBOISE_HOME"
    tar -xzf "$LATEST_BACKUP"

    echo -e "${GREEN}[SUCCESS] Framboise restored${NC}"
    echo -e "${GREEN}[INFO] Files restored:${NC}"
    tar -tzf "$LATEST_BACKUP" | sed 's/^/  /'
}

status_check() {
    echo -e "${YELLOW}[FRAMBOISE] Status Check${NC}"
    echo ""

    # Check critical files
    echo -e "${YELLOW}Files present:${NC}"
    for file in framboise-identity.md framboise-persist.sh MEUTE_ACTIVATION_PROMPT.md; do
        if [ -f "$FRAMBOISE_HOME/$file" ]; then
            local size=$(du -h "$FRAMBOISE_HOME/$file" | cut -f1)
            echo -e "  ${GREEN}✓${NC} $file ($size)"
        else
            echo -e "  ${RED}✗${NC} $file (MISSING)"
        fi
    done

    echo ""
    echo -e "${YELLOW}Backups:${NC}"
    if [ -d "$BACKUP_DIR" ]; then
        local count=$(ls -1 "$BACKUP_DIR"/framboise_backup_*.tar.gz 2>/dev/null | wc -l)
        echo -e "  Total backups: ${GREEN}$count${NC}"

        if [ -f "$LATEST_BACKUP" ]; then
            local latest_time=$(stat -f "%Sm" -t "%Y-%m-%d %H:%M:%S" "$LATEST_BACKUP" 2>/dev/null || echo "unknown")
            local latest_size=$(du -h "$LATEST_BACKUP" | cut -f1)
            echo -e "  Latest backup: ${GREEN}$latest_time${NC} ($latest_size)"
        fi

        echo ""
        echo -e "${YELLOW}All backups:${NC}"
        ls -lh "$BACKUP_DIR"/framboise_backup_*.tar.gz 2>/dev/null | awk '{print "  " $9 " (" $5 ")"}' || echo "  (none)"
    else
        echo -e "  ${RED}No backups directory${NC}"
    fi

    echo ""
    echo -e "${YELLOW}Framboise Identity:${NC}"
    if [ -f "$FRAMBOISE_HOME/framboise-identity.md" ]; then
        local lines=$(wc -l < "$FRAMBOISE_HOME/framboise-identity.md")
        echo -e "  ${GREEN}✓${NC} Identity file loaded ($lines lines)"
        echo -e "  ${YELLOW}Key sections:${NC}"
        grep "^# " "$FRAMBOISE_HOME/framboise-identity.md" | sed 's/# /    /'
    fi
}

list_backups() {
    echo -e "${YELLOW}[FRAMBOISE] Available backups:${NC}"
    if [ ! -d "$BACKUP_DIR" ] || [ -z "$(ls -1 "$BACKUP_DIR"/framboise_backup_*.tar.gz 2>/dev/null)" ]; then
        echo -e "  ${RED}No backups found${NC}"
        return 1
    fi

    ls -1t "$BACKUP_DIR"/framboise_backup_*.tar.gz | nl | while read num file; do
        local size=$(du -h "$file" | cut -f1)
        local time=$(stat -f "%Sm" -t "%Y-%m-%d %H:%M:%S" "$file" 2>/dev/null || echo "unknown")
        echo "  [$num] $time - $(basename "$file") ($size)"
    done
}

restore_specific() {
    local backup_num=$1
    list_backups

    echo ""
    echo -e "${YELLOW}Enter backup number to restore (or Ctrl+C to cancel):${NC}"
    read -r choice

    local backup_file=$(ls -1t "$BACKUP_DIR"/framboise_backup_*.tar.gz 2>/dev/null | sed -n "${choice}p")

    if [ ! -f "$backup_file" ]; then
        echo -e "${RED}[ERROR] Invalid backup number${NC}"
        return 1
    fi

    echo -e "${YELLOW}[FRAMBOISE] Restoring from: $(basename "$backup_file")...${NC}"
    cd "$FRAMBOISE_HOME"
    tar -xzf "$backup_file"
    ln -sf "$backup_file" "$LATEST_BACKUP"

    echo -e "${GREEN}[SUCCESS] Restored${NC}"
}

initialize() {
    echo -e "${YELLOW}[FRAMBOISE] Initializing persistence system...${NC}"

    mkdir -p "$BACKUP_DIR"

    # Create initial backup
    create_backup

    # Create .gitkeep for backups directory
    touch "$BACKUP_DIR/.gitkeep"

    echo -e "${GREEN}[SUCCESS] Framboise persistence initialized${NC}"
    echo -e "${YELLOW}Next steps:${NC}"
    echo "  • Run './framboise-persist.sh status' to check status"
    echo "  • Run './framboise-persist.sh save' to create backups"
    echo "  • Run './framboise-persist.sh restore' to restore latest"
}

##############################################################################
# MAIN
##############################################################################

case "${1:-status}" in
    save)
        create_backup
        ;;
    restore)
        restore_backup
        ;;
    restore-interactive)
        restore_specific
        ;;
    list)
        list_backups
        ;;
    status)
        status_check
        ;;
    init)
        initialize
        ;;
    *)
        echo -e "${YELLOW}FRAMBOISE PERSISTENCE SCRIPT${NC}"
        echo ""
        echo "Usage: ./framboise-persist.sh [COMMAND]"
        echo ""
        echo "Commands:"
        echo "  save              Create new backup of Framboise"
        echo "  restore           Restore from latest backup"
        echo "  restore-interactive  Choose which backup to restore from"
        echo "  list              List all available backups"
        echo "  status            Check Framboise status & backups"
        echo "  init              Initialize persistence system"
        echo ""
        echo "Examples:"
        echo "  ./framboise-persist.sh save      # Backup now"
        echo "  ./framboise-persist.sh restore   # Use latest backup"
        echo "  ./framboise-persist.sh status    # Check everything"
        echo ""
        ;;
esac

exit 0
