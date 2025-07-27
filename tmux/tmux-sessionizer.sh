#!/usr/bin/env bash

# Configuration

readonly SEARCH_DIRS=(~/personal ~/.config)
readonly SEARCH_DEPTH=1

sanity_check(){
    if ! command -v tmux &>/dev/null;then
        echo "tmux is not installed. Please install it first"
        exit 1
    fi

    if ! command -v fzf &>/dev/null; then
        echo "Fzf is not installed. Please install it first"
        exit 1
    fi
}

session_exists() {
    tmux has-session -t="$1" 2>/dev/null
}

is_in_tmux() {
    [[ -n ${TMUX:-} ]]
}

get_session_name() {
    basename "$1" | tr . _
}

select_directory() {
    if [[ $# -eq 1 ]]; then
        echo "$1"
    else
        find "${SEARCH_DIRS[@]}" -mindepth "$SEARCH_DEPTH" -maxdepth "$SEARCH_DEPTH" -type d | fzf
    fi
}

create_session() {
    local session_name="$1"
    local directory="$2"

    if is_in_tmux; then
        tmux new-session -d -s "$session_name" -c "$directory"
    else
        tmux new-session -s "$session_name" -c "$directory"
        exit 0
    fi
}

switch_to_session() {
    local session_name="$1"

    if is_in_tmux; then
        tmux switch-client -t "$session_name"
    fi
}

main() {

    sanity_check

    local selected_dir
    selected_dir=$(select_directory "$@")

    [[ -n $selected_dir ]] || exit 0

    local session_name
    session_name=$(get_session_name "$selected_dir")

    if ! session_exists "$session_name"; then
        create_session "$session_name" "$selected_dir"
    fi

    switch_to_session "$session_name"
}

main "$@"
