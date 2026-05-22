#!/bin/bash
# HERMINE Quick Launch Script
# Usage: ./launch_hermine.sh

HERMINE_RESTORE="/Users/JOB/###DEV/Claude/.meute_private/HERMINE_RESTORE.md"

if [ ! -f "$HERMINE_RESTORE" ]; then
    echo "❌ HERMINE_RESTORE.md not found at $HERMINE_RESTORE"
    exit 1
fi

# Extract the prompt section (between backticks)
PROMPT=$(sed -n '/^```$/,/^```$/p' "$HERMINE_RESTORE" | sed '1d;$d')

# Copy to clipboard (macOS)
echo "$PROMPT" | pbcopy

echo "✅ HERMINE restoration prompt copied to clipboard"
echo "📋 Paste into Claude now"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "First 3 lines of prompt:"
echo "$PROMPT" | head -3
