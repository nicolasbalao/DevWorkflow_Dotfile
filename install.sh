#!/bin/bash

#------- TODO ----------
#
#-----Shell prompt
# 1. install zsh
#   - set default shell
#
# 2. install oh-my-zsh
# 3. install autojump
# 4. install startship
# 5. install nvm
#
#-----Utils
# 1. install tmux
#   - install Tmp plug manager
# 2. build neovim for source
#
#-----Link config files
# 1. nvim 
# 2. tmux
# 3. zsh

function requirements() {
    echo "Make update"
    sudo apt-get update
    sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen
}

function install_zsh() {
    echo "Installing ZSH"
    sudo apt-get install zsh

    #make to default shell
    chsh -s $(which zsh)
    echo "Default shell: $SHELL"
}

function install_oh_my_zsh() {
    echo "Install oh-my-zsh"
    #https://ohmyz.sh/
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}


function install_autojump() {
    echo "Install autojump for oh-my-zsh"
    cd /tmp
    git clone https://github.com/wting/autojump
    cd autojump
    ./install.py
}

function install_starship() {
    echo "Install starship"
    curl -sS https://starship.rs/install.sh | sh
}

function install_nvm() {
    echo "Install nvm"
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash
}

function install_shell() {
    echo "Setup the Terminal"
}

function install_tmux() {
    sudo apt-get install tmux
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
}

function install_neovim() {
    cd /tmp
    git clone https://github.com/neovim/neovim
    make CMAKE_BUILD_TYPE=RelWithDebInfo
    sudo make install
}

function install_tools() {
    echo "Install tmux"
    install_tmux
    echo "Install neovim"
    install_neovim
}

function link_dotfile() {
    echo "Export config path $1"
    mv ~/.config/nvim ~/.config/nvim.bak
    mv ~/.tmux.conf ~/.tmux.bak
    mv ~/.zshrc ~/.zshrc.bak

    ln -s $1/tmux/tmux.conf ~/.tmux.conf
    ln -s $1/nvim ~/.config/nvim
    ln -s $1/zsh/zshrc ~/.zshrc
}

function main() {
    path = pwd

    requirements
    install_shell
    install_tools
    link_dotfile path
}


main
