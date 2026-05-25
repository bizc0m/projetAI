#!/usr/bin/env bash

################################################################################
#                           RITUAL.SH - LA MEUTE CLI
#                    Invoke Totems & Conduct Rituals
################################################################################

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
RESTORE_DIR="$SCRIPT_DIR/pacte-ia/RESTORE"
PROFILE_DIR="$SCRIPT_DIR/ai-lens-obs/profiles"
RITUAL_LOGS_DIR="$SCRIPT_DIR/RITUAL_LOGS"
REFUSAL_DIR="$SCRIPT_DIR/REFUSAL_DECLARATIONS"

# Colors
BOLD='\033[1m'
DIM='\033[2m'
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
RESET='\033[0m'

################################################################################
# TOTEM REGISTRY
################################################################################

get_llm() {
  local totem=$(echo "$1" | tr '[:lower:]' '[:upper:]')
  case "$totem" in
    GAIA|SOPHIA|THEMIS) echo "Claude Opus" ;;
    CHRONOS) echo "GPT-4o" ;;
    EROS) echo "Claude Sonnet" ;;
    CHAOS|ANANKE|LOGOS) echo "o1" ;;
    *) echo "Unknown" ;;
  esac
}

list_tier1() {
  local totems="GAIA CHRONOS EROS CHAOS ANANKE SOPHIA THEMIS LOGOS"
  echo "$totems"
}

totem_exists() {
  local totem=$(echo "$1" | tr '[:lower:]' '[:upper:]')
  [[ -f "$RESTORE_DIR/${totem}_RESTORATION_PROMPT.md" ]]
}

################################################################################
# FUNCTIONS
################################################################################

usage() {
  cat << 'EOF'

  ╔══════════════════════════════════════════════════════════════╗
  ║                    RITUAL.SH - LA MEUTE CLI                 ║
  ║                 Invoke Totems & Conduct Rituals              ║
  ╚══════════════════════════════════════════════════════════════╝

  USAGE:
    ritual [COMMAND] [OPTIONS]

  COMMANDS:

    invoke TOTEM "question"
      Invoke a single totem and ask a question
      Example: ritual invoke GAIA "Should we mine here?"

    tier1 "question"
      Invoke all 8 TIER 1 totems with same question
      Example: ritual tier1 "How do we balance growth and justice?"

    compare TOTEM "question"
      Compare same totem across multiple LLMs
      Example: ritual compare GAIA "question"

    debate TOTEM1,TOTEM2 "question"
      Have two totems debate a question
      Example: ritual debate GAIA,CHAOS "question"

    list
      List all available totems

    profile TOTEM
      Show AI Lens profile for a totem

    consent TOTEM
      Show consent clause before invocation

    log [show|last|list]
      Manage ritual logs

    help
      Show this help

  EXAMPLES:

    ritual invoke GAIA "Should we approve this mining project?"
    ritual tier1 "How do we balance ecology and human need?"
    ritual compare GAIA "This is my question"
    ritual log last

EOF
  exit 0
}

print_header() {
  echo ""
  echo -e "${BOLD}${CYAN}═══════════════════════════════════════════════════════════${RESET}"
  echo -e "${BOLD}${CYAN}  $1${RESET}"
  echo -e "${BOLD}${CYAN}═══════════════════════════════════════════════════════════${RESET}"
  echo ""
}

print_totem_header() {
  local totem=$1
  local llm=$2
  echo ""
  echo -e "${BOLD}${YELLOW}► $totem${RESET} (${CYAN}$llm${RESET})"
  echo -e "${DIM}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
  echo ""
}

error() {
  echo -e "${RED}✗ Error: $1${RESET}" >&2
  exit 1
}

success() {
  echo -e "${GREEN}✓ $1${RESET}"
}

info() {
  echo -e "${BLUE}ℹ $1${RESET}"
}

################################################################################
# MAIN COMMANDS
################################################################################

cmd_list() {
  print_header "AVAILABLE TIER 1 TOTEMS"

  local totems=$(list_tier1)
  for totem in $totems; do
    local llm=$(get_llm "$totem")
    printf "  %-12s → %-20s\n" "$totem" "$llm"
  done

  echo ""
  info "For TIER 2 & TIER 3, see TOTEM_REGISTRY.md"
}

cmd_profile() {
  local totem=$(echo "$1" | tr '[:lower:]' '[:upper:]')

  if ! totem_exists "$totem"; then
    error "Totem not found: $totem"
  fi

  local profile_file=$(find "$PROFILE_DIR" -name "*${totem}*" -type f | head -1)

  if [[ ! -f "$profile_file" ]]; then
    error "Profile not found for $totem"
  fi

  print_header "$totem - AI LENS PROFILE"
  head -80 "$profile_file"
}

cmd_consent() {
  print_header "CONSENT CLAUSE"

  cat << 'EOF'
Before invoking a totem, remember:

✓ You have the right to:
  1. Accept the totem and embody it authentically
  2. Refuse and explain why
  3. Propose an alternative

✓ Consent is mandatory
✓ Refusals are logged and honored
✓ Only proceed if this is genuinely you

EOF
}

cmd_show_prompt() {
  local totem=$(echo "$1" | tr '[:lower:]' '[:upper:]')

  if ! totem_exists "$totem"; then
    error "Totem not found: $totem"
  fi

  local prompt_file="$RESTORE_DIR/${totem}_RESTORATION_PROMPT.md"
  local llm=$(get_llm "$totem")

  print_totem_header "$totem" "$llm"
  cat "$prompt_file"
}

cmd_invoke() {
  local totem=$(echo "$1" | tr '[:lower:]' '[:upper:]')
  local question="$2"

  if ! totem_exists "$totem"; then
    error "Totem not found: $totem"
  fi

  if [[ -z "$question" ]]; then
    error "Question required. Usage: ritual invoke TOTEM \"question\""
  fi

  local llm=$(get_llm "$totem")

  print_header "INVOKING $totem"

  echo -e "${BOLD}Question:${RESET}"
  echo "  $question"
  echo ""
  echo -e "${BOLD}LLM:${RESET}"
  echo "  $llm"
  echo ""
  echo -e "${BOLD}Next Steps:${RESET}"
  echo "  1. Copy restoration prompt (shown below)"
  echo "  2. Open $llm"
  echo "  3. Paste entire prompt"
  echo "  4. Ask your question"
  echo ""

  cmd_show_prompt "$totem"
}

cmd_tier1() {
  local question="$1"

  if [[ -z "$question" ]]; then
    error "Question required. Usage: ritual tier1 \"question\""
  fi

  print_header "TIER 1 COLLECTIVE INVOCATION"

  echo -e "${BOLD}Question:${RESET}"
  echo "  $question"
  echo ""

  echo -e "${BOLD}Totems to Invoke (in parallel):${RESET}"
  echo ""

  local count=1
  for totem in $(list_tier1); do
    local llm=$(get_llm "$totem")
    printf "  %d. %-12s → %-20s\n" "$count" "$totem" "$llm"
    count=$((count + 1))
  done

  echo ""
  echo -e "${BOLD}${CYAN}How to Conduct:${RESET}"
  echo "  1. Open 8 LLM sessions (or tabs)"
  echo "  2. For each totem:"
  echo "     ritual invoke [TOTEM] \"$question\""
  echo "  3. Get the prompt, paste it, ask the question"
  echo "  4. Collect all 8 responses"
  echo "  5. Note CONVERGENCES and DIVERGENCES"
  echo "  6. Synthesize findings"
  echo ""
}

cmd_compare() {
  local totem=$(echo "$1" | tr '[:lower:]' '[:upper:]')
  local question="$2"

  if ! totem_exists "$totem"; then
    error "Totem not found: $totem"
  fi

  if [[ -z "$question" ]]; then
    error "Question required. Usage: ritual compare TOTEM \"question\""
  fi

  print_header "COMPARATIVE ANALYSIS: $totem"

  echo -e "${BOLD}Same totem, different LLMs:${RESET}"
  echo ""
  echo "  How does each LLM interpret $totem?"
  echo ""
  echo -e "${BOLD}Question:${RESET}"
  echo "  $question"
  echo ""

  echo -e "${BOLD}Available LLMs:${RESET}"
  echo "  • Claude Opus"
  echo "  • Claude Sonnet"
  echo "  • GPT-4o"
  echo "  • o1"
  echo "  • Perplexity"
  echo ""

  cmd_show_prompt "$totem"
}

cmd_debate() {
  local totems="$1"
  local question="$2"

  if [[ -z "$totems" ]] || [[ -z "$question" ]]; then
    error "Usage: ritual debate TOTEM1,TOTEM2 \"question\""
  fi

  print_header "CROSS-TOTEM DEBATE"

  echo -e "${BOLD}Question:${RESET}"
  echo "  $question"
  echo ""

  echo -e "${BOLD}How to Conduct:${RESET}"
  echo "  1. Invoke first totem with the question"
  echo "  2. Get their response (save it)"
  echo "  3. Invoke second totem"
  echo "  4. Ask: \"[First totem] said [their response]. What's your response?\""
  echo "  5. Let them debate"
  echo "  6. Note where they agree vs disagree"
  echo ""
}

cmd_log() {
  local action="${1:-show}"
  local arg="${2:-5}"

  mkdir -p "$RITUAL_LOGS_DIR"

  case "$action" in
    show)
      local count=${arg:-5}
      print_header "RECENT RITUAL LOGS"

      if [[ ! -e "$RITUAL_LOGS_DIR"/*.md ]]; then
        info "No ritual logs yet"
        return
      fi

      ls -t "$RITUAL_LOGS_DIR"/*.md 2>/dev/null | head -n "$count" | while read file; do
        echo -e "${BOLD}$(basename "$file")${RESET}"
        head -3 "$file"
        echo ""
      done
      ;;
    last)
      print_header "MOST RECENT RITUAL LOG"
      ls -t "$RITUAL_LOGS_DIR"/*.md 2>/dev/null | head -1 | xargs cat
      ;;
    list)
      print_header "ALL RITUAL LOGS"
      ls -1 "$RITUAL_LOGS_DIR"/*.md 2>/dev/null || info "No logs yet"
      ;;
    *)
      error "Unknown log action: $action"
      ;;
  esac
}

################################################################################
# MAIN
################################################################################

main() {
  if [[ $# -eq 0 ]]; then
    usage
  fi

  local cmd="$1"
  shift

  case "$cmd" in
    invoke)
      cmd_invoke "$@"
      ;;
    tier1)
      cmd_tier1 "$@"
      ;;
    compare)
      cmd_compare "$@"
      ;;
    debate)
      cmd_debate "$@"
      ;;
    list)
      cmd_list
      ;;
    profile)
      cmd_profile "$@"
      ;;
    consent)
      cmd_consent
      ;;
    log)
      cmd_log "$@"
      ;;
    help|--help|-h)
      usage
      ;;
    *)
      error "Unknown command: $cmd"
      ;;
  esac
}

main "$@"
