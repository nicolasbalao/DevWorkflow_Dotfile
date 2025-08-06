main() {

    echo "Installing fish-shell..."
    # Todo use is install from utils
    # Add ubuntu repository
    # follow  https://github.com/fish-shell/fish-shell
    apt update &>/dev/null
    apt install fish &>/dev/null
    echo "🎉 Fish shell is installed!"
    echo "chsh -s \$(which zsh) <your-username>"
}

main "$@"
