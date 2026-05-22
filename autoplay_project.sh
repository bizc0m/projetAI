#!/bin/bash
# 🚀 AUTOPLAY PROJECT — Launch All Projects
# Starts dev servers, initializes databases, restores state
# Usage: ./autoplay_project.sh [project_name]

set -e

PROJECT_ROOT="/Users/JOB/###DEV/Claude"
PROJECT_NAME="${1:-all}"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
LOG_DIR="/tmp/project_autoplay_${TIMESTAMP}"

mkdir -p "$LOG_DIR"

echo "🚀 PROJECT AUTOPLAY"
echo "===================="
echo ""
echo "Project: $PROJECT_NAME"
echo "Time: $(date)"
echo "Logs: $LOG_DIR"
echo ""

# Function to start a project
start_project() {
    local name="$1"
    local path="$PROJECT_ROOT/$name"

    if [ ! -d "$path" ]; then
        echo "⚠️  Project not found: $name"
        return 1
    fi

    echo "🚀 Starting $name..."

    cd "$path"

    # Detect project type and start
    if [ -f "package.json" ]; then
        echo "   📦 Node.js project detected"
        npm install > "$LOG_DIR/${name}_install.log" 2>&1 || true
        npm run dev > "$LOG_DIR/${name}_dev.log" 2>&1 &
        echo "   ✅ Dev server started (PID: $!)"
        echo "$!" > "$LOG_DIR/${name}_pid.txt"

    elif [ -f "Cargo.toml" ]; then
        echo "   🦀 Rust project detected"
        cargo build > "$LOG_DIR/${name}_build.log" 2>&1 || true
        cargo run > "$LOG_DIR/${name}_run.log" 2>&1 &
        echo "   ✅ Running (PID: $!)"
        echo "$!" > "$LOG_DIR/${name}_pid.txt"

    elif [ -f "pyproject.toml" ] || [ -f "requirements.txt" ]; then
        echo "   🐍 Python project detected"
        pip install -q -r requirements.txt 2>/dev/null || true
        python -m uvicorn main:app --reload > "$LOG_DIR/${name}_run.log" 2>&1 &
        echo "   ✅ Server started (PID: $!)"
        echo "$!" > "$LOG_DIR/${name}_pid.txt"

    elif [ -f "electron-builder.yml" ] || grep -q '"electron"' package.json 2>/dev/null; then
        echo "   ⚛️  Electron app detected"
        npm install > "$LOG_DIR/${name}_install.log" 2>&1 || true
        npm start > "$LOG_DIR/${name}_start.log" 2>&1 &
        echo "   ✅ Electron app started (PID: $!)"
        echo "$!" > "$LOG_DIR/${name}_pid.txt"

    else
        echo "   ❓ Unknown project type"
        return 1
    fi
}

# Start projects
case "$PROJECT_NAME" in
    "all")
        echo "📚 Starting all projects..."
        echo ""
        for project in GlouGlou5 NightLifeV5-claude crockett-v2 KM; do
            if [ -d "$PROJECT_ROOT/$project" ]; then
                start_project "$project"
                echo ""
                sleep 2
            fi
        done
        ;;
    *)
        start_project "$PROJECT_NAME"
        ;;
esac

echo ""
echo "✅ AUTOPLAY COMPLETE"
echo ""
echo "📊 Running Processes:"
ps aux | grep -E "node|cargo|python|electron" | grep -v grep || echo "   (none yet, starting...)"
echo ""

echo "📋 Logs Location: $LOG_DIR"
echo ""
echo "🔍 To monitor:"
echo "   tail -f $LOG_DIR/*.log"
echo ""

echo "⏹️  To stop all:"
echo "   killall node python cargo npm"
echo ""

echo "💚 Projects ready."
echo ""
