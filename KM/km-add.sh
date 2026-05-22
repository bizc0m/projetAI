#!/bin/bash

# KM Quick Add - Capture URL and auto-document in 3 lines
# Usage: km-add "https://example.com" OR echo "##KM https://example.com" | km-add

KM_DIR="/Users/JOB/###DEV/Claude/KM"
RESOURCES_FILE="$KM_DIR/RESOURCES.md"

# Initialize RESOURCES.md if doesn't exist
if [ ! -f "$RESOURCES_FILE" ]; then
  cat > "$RESOURCES_FILE" << 'EOF'
# 📚 Resources & Links

Auto-documented from ##KM pattern.

---

EOF
fi

# Get URL from argument or stdin
URL="${1:-}"
if [ -z "$URL" ]; then
  read -p "Paste URL: " URL
fi

# Extract from ##KM pattern if needed
URL=$(echo "$URL" | sed 's/##KM //' | xargs)

if [ -z "$URL" ]; then
  echo "❌ No URL provided"
  exit 1
fi

# Fetch page content
echo "📥 Fetching: $URL"
HTML=$(curl -s "$URL" 2>/dev/null)

# Extract metadata
TITLE=$(echo "$HTML" | grep -o '<title>[^<]*</title>' | sed 's/<[^>]*>//g' | head -1)
[ -z "$TITLE" ] && TITLE="No title"

# Extract meta description
DESC=$(echo "$HTML" | grep -o '<meta name="description" content="[^"]*"' | sed 's/.*content="\([^"]*\)".*/\1/' | head -1)
[ -z "$DESC" ] && DESC=$(echo "$HTML" | grep -o '<meta name="og:description" content="[^"]*"' | sed 's/.*content="\([^"]*\)".*/\1/' | head -1)

# Extract keywords
KEYWORDS=$(echo "$HTML" | grep -o '<meta name="keywords" content="[^"]*"' | sed 's/.*content="\([^"]*\)".*/\1/' | head -1)

# Extract domain
DOMAIN=$(echo "$URL" | sed -E 's|https?://([^/]+).*|\1|')

# Create entry with keywords (3 lines)
TIMESTAMP=$(date "+%Y-%m-%d %H:%M")

if [ -n "$DESC" ] && [ -n "$KEYWORDS" ]; then
  ENTRY="### 🔗 $TITLE
- **Keywords:** $KEYWORDS | **Summary:** $DESC
- **URL:** [$DOMAIN]($URL) | **Added:** $TIMESTAMP

"
elif [ -n "$DESC" ]; then
  ENTRY="### 🔗 $TITLE
- **Summary:** $DESC
- **URL:** [$DOMAIN]($URL) | **Added:** $TIMESTAMP

"
else
  ENTRY="### 🔗 $TITLE
- **URL:** [$DOMAIN]($URL)
- **Added:** $TIMESTAMP

"
fi

# Append to RESOURCES.md
echo "$ENTRY" >> "$RESOURCES_FILE"

echo "✅ Added to: $RESOURCES_FILE"
echo "📖 Entry:"
echo "$ENTRY"
