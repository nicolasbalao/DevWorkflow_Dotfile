#!/usr/bin/env bash

# Configuration

readonly SEARCH_DIRS=(~/personal ~/.config)
readonly SEARCH_DEPTH=1

show_help(){
    cat << EOF
Usage: $(basename "$0") [OPTIONS] [DIRECTORY]

OPTIONS:
    -l, --last      Switch to last session
    -h, --help      Show this help message

ARGUMENTS:
    DIRECTORY       Specific directory to create session from
                   If not provided, uses fzf to select from configured directories

EXAMPLES:
    $(basename "$0")                    # Interactive selection with fzf
    $(basename "$0") ~/my-project       # Create session for specific directory
    $(basename "$0") -l                 # Switch to last session

EOF
}

sanity_check() {
    if ! command -v tmux &>/dev/null; then
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

get_last_session() {
    if is_in_tmux; then
        tmux display-message -p '#{client_last_session}'
    else
        tmux ls -F '#{session_last_attached} #{session_name}' 2>/dev/null |
            sort -nr |
            head -n1 |
            cut -d' ' -f2
    fi
}

switch_to_last_session() {
    local last_session
    last_session=$(get_last_session)

    if [[ -z $last_session ]]; then
        echo "No previous session found"
        exit 1
    fi

    if ! session_exists "$last_session"; then
        echo "Last session '$last_session' no longer exists"
        exit 1
    fi

    if is_in_tmux; then
        tmux switch-client -l
    else
        tmux attach -t "$last_session"
    fi
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

    case "${1:-}" in
    -l | --last)
        switch_to_last_session
        exit 0
        ;;
    -h | --help)
        show_help
        exit 0
        ;;
    _*)
        echo "Unknow option: $1"
        show_help
        ;;
    esac

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
