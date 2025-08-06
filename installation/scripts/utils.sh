is_installed() {
    local tool="$1"

    if command -v "$tool" &>/dev/null; then
        return 0
    fi
    return 1
}

install_tool() {
    local tool="$1"
    echo "Installing $tool..."

    if apt update &> /dev/null && apt install -y "$tool" &> /dev/null; then
        echo "✓ $tool installed successfully"
    else
        echo "✗ Failed to install $tool"
        return 1
    fi
}

ensure_tools_installed() {
    local tools=("$@")
    local failed_installs=()

    for tool in "${tools[@]}"; do
        if is_installed "$tool"; then
            echo "✓ $tool is already installed"
            continue
        fi

        echo "⚠  $tool is not installed"
        if install_tool "$tool"; then
            echo
        else
            failed_installs+=("$tool")
        fi
    done

    echo

    if [[ ${#failed_installs[@]} -eq 0 ]]; then
        echo "🎉 All system requirements are installed!"
    else
        echo "❌ Failed to install: ${failed_installs[*]}"
        exit 1
    fi

}
