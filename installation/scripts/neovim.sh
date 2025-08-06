#!/usr/bin/env bash

source ./utils.sh

sanity_check() {
    # TODO: handle build-essential
    # https://github.com/neovim/neovim/blob/master/BUILD.md#build-prerequisites
    tools=('git' 'make' 'ninja-build' 'gettext' 'cmake' 'curl')

    ensure_tools_installed "${tools[@]}"
}

clone_neovim_repo() {
    git clone https://github.com/neovim/neovim.git
}

build_neovim() {
    cd neovim || exit

    make CMAKE_BUILD_TYPE=Release
    make install
}

main() {
    sanity_check
    clone_neovim_repo
    build_neovim
}

main "$@"
