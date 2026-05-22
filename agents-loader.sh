#!/bin/bash

# Auto-load agents from #agents directory
AGENTS_DIR="/Users/JOB/###DEV/Claude/#agents"

# Default agent to load on startup
DEFAULT_AGENT="engineering/engineering-senior-developer"

# Function to list available agents
list_agents() {
  echo "📦 Available Agent Categories:"
  ls -1 "$AGENTS_DIR" | grep -v "^\."
}

# Function to load an agent
load_agent() {
  local agent=$1
  local agent_file="$AGENTS_DIR/${agent}.md"

  if [ -f "$agent_file" ]; then
    echo "🚀 Loading agent: $agent"
    cat "$agent_file"
  else
    echo "❌ Agent not found: $agent"
    echo "Type: list_agents() to see available agents"
  fi
}

# Function to fuzzy find agents
find_agent() {
  local query=$1
  echo "🔍 Searching agents for: $query"
  find "$AGENTS_DIR" -name "*${query}*.md" | sed "s|$AGENTS_DIR/||;s|\.md||"
}

# Export functions
export -f load_agent
export -f find_agent
export -f list_agents

# Auto-load default agent if interactive
if [ -t 0 ]; then
  echo "💡 Type: load_agent 'category/agent-name' | list_agents | find_agent 'keyword'"
fi
