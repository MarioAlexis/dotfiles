#!/bin/bash

function confirm()
{
    read -p "$1 [y/N]" -n 1 -r
    echo    # (optional) move to a new line
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        return 0
    fi
    return 1
}

function link_to_home()
{
    for f in ${1}; do
        if [ -f ~/$f ]; then
            if confirm "Overwrite ~/$f?"; then
                rm -rf ~/$f
                curl -sL -o ~/$f https://raw.githubusercontent.com/MarioAlexis/dotfile/master/$f
                echo ~/$f installed!
            fi
        else
            curl -sL -o ~/$f https://raw.githubusercontent.com/MarioAlexis/dotfile/master/$f
            echo ~/$f installed!
        fi
    done
}
    
##################
#   MAIN
##################

# Create ~/bin if not exist
mkdir -p ~/bin
mkdir -p ~/.vim

DOTFILES_TO_INSTALL=".gitconfig .vimrc .zshrc .p10k.zsh .shell_alias .shell_env .shell_functions"
link_to_home "~_TO_INSTALL"

# Install vim plugin
if [ -d ~/.vim/plugged/vim-superman ]; then
    vim -c ':PlugUpdate | quitall'
else
    vim -c ':PlugInstall | quitall'
    find ~/.vim -type f -name "vman" -exec cp {} ~/bin \;
fi