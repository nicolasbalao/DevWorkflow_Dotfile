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
#

# Exit if any subcommand fails || need to do gestion of errors
#set -e

#Global Var

CLEAR_Line='\r\033[K'

function requirements() {

    printf "${CLEAR_Line}[1/8] Updating system..."
    sudo apt-get update -y > /dev/null

    printf "${CLEAR_Line}[2/8] Install requirements..."
    sudo apt-get install -y ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen make python3 python-is-python3 > /dev/null
}

function install_zsh() {
    printf "${CLEAR_Line}[3/8]  Install zsh..."
    sudo apt-get install -y zsh > /dev/null
}

function install_oh_my_zsh() {
    export RUNZSH=no

    printf "${CLEAR_Line}[4/8]  Install oh-my-zsh and plugins..."
    #https://ohmyz.sh/
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting > /dev/null
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions > /dev/null
}


function install_autojump() {
    cd /tmp
    git clone https://github.com/wting/autojump > /dev/null
    cd autojump
    ./install.py > /dev/null
}

function install_starship() {
    printf "${CLEAR_Line}[5/8]  Install starship..."
    curl -sS https://starship.rs/install.sh | sh 
}

function install_nvm() {
    printf "${CLEAR_Line}[5/8]  Install nvm..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash
}

function install_shell() {
    install_zsh
    install_oh_my_zsh
    install_autojump
    install_starship
    install_nvm
}

function install_tmux() {
    printf "${CLEAR_Line}[7/8]  Install tmux..."
    sudo apt-get -y install tmux > /dev/null
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm 
}

function install_neovim() {
    printf "${CLEAR_Line}[8/8]  Install neovim from source..."
    cd /tmp
    git clone https://github.com/neovim/neovim 
    cd /tmp/neovim/
    make CMAKE_BUILD_TYPE=RelWithDebInfo > /dev/null
    sudo make install  > /dev/null
}

function install_tools() {
    install_tmux
    install_neovim
}

function link_dotfile() {
    printf "${CLEAR_Line}[8/8]  Install config files..."
    mv ~/.config/nvim ~/.config/nvim.bak 2> /dev/null
    mv ~/.tmux.conf ~/.tmux.bak 2> /dev/null
    mv ~/.zshrc ~/.zshrc.bak 2> /dev/null

    ln -s $1/tmux/tmux.conf ~/.tmux.conf 2> /dev/null
    ln -s $1/nvim ~/.config/nvim 2> /dev/null
    ln -s $1/zsh/zshrc ~/.zshrc 2> /dev/null
}

function main() {
    local path=$(pwd)

    requirements
    install_shell
    install_tools
    link_dotfile $path

    echo "Dont forget to install nerd font: https://nerdfonts.com"
    echo "Setting up"
    echo "neovim: :PackerInstall "
    echo "tmux: C-a I"
}

main
