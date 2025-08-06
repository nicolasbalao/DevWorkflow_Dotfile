main() {
    local config_path="$HOME/.config"
    local repo_url="https://github.com/nicolasbalao/DevWorkflow_Dotfile.git"
    local repo_dir="$HOME/DevWorkflow_Dotfile"

    # Clone repo
    git clone "$repo_url" "$repo_dir" || {
        echo "❌ Failed to clone repo."
        exit 1
    }

    cd "$repo_dir" || exit 1

    mkdir -p "$config_path"

    # Neovim
    if [[ -d "$config_path/nvim" ]]; then
        mv "$config_path/nvim"{,.bak}
        mv ~/.local/share/nvim{,.bak}
        mv ~/.local/state/nvim{,.bak}
        mv ~/.cache/nvim{,.bak}
    fi

    ln -snf "$repo_dir/nvim" "$config_path/nvim"

    # Fish
    mkdir -p "$config_path/fish"
    if [[ -d "$config_path/fish/conf.d" ]]; then
        mv "$config_path/fish/conf.d"{,.bak}
    fi
    ln -snf "$repo_dir/fish/conf.d" "$config_path/fish/conf.d"

    # Tmux
    mkdir -p "$config_path/tmux"
    ln -snf "$repo_dir/tmux/tmux.conf" "$config_path/tmux/tmux.conf"

    echo "✅ Dotfiles linked successfully!"
}

main "$@"
