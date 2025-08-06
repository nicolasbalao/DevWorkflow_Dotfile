#!/usr/bin/env bash

source ./utils.sh

# Needs

set -euo pipefail # Exit on error, undefined vars, pipe failures

tools=('git' 'fzf' 'make' 'curl' 'wget' 'unzip' 'build-essential' 'tmux')

main() {
    echo "=== System Requirements Installation ==="
    echo "Checking and installing: ${tools[*]}"
    echo

    ensure_tools_installed "${tools[@]}"
}

main "$@"
