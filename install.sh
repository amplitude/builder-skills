#!/usr/bin/env bash
# Install amplitude/builder-skills into Claude Code
# Usage: ./install.sh [plugin-name]
# Examples:
#   ./install.sh                 # install everything
#   ./install.sh product-skills  # install one plugin

set -e

SKILLS_DIR="$HOME/.claude/skills"
COMMANDS_DIR="$HOME/.claude/commands"
REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
PLUGIN="${1:-all}"

install_plugin() {
  local plugin_dir="$1"
  find "$plugin_dir" -name "SKILL.md" | while read -r f; do
    local name; name=$(basename "$(dirname "$f")")
    mkdir -p "$SKILLS_DIR/$name"
    cp "$f" "$SKILLS_DIR/$name/SKILL.md"
  done
  mkdir -p "$COMMANDS_DIR"
  find "$plugin_dir" -name "*.md" -path "*/commands/*" -exec cp {} "$COMMANDS_DIR/" \;
}

if [[ "$PLUGIN" == "all" ]]; then
  for dir in "$REPO_DIR"/*-skills; do
    [[ -d "$dir" ]] && install_plugin "$dir"
  done
  echo "Installed all builder-skills into $SKILLS_DIR"
else
  [[ -d "$REPO_DIR/$PLUGIN" ]] || { echo "Plugin not found: $PLUGIN"; exit 1; }
  install_plugin "$REPO_DIR/$PLUGIN"
  echo "Installed $PLUGIN into $SKILLS_DIR"
fi
