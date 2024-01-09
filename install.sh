#!/bin/bash

DOTFILES="~/"


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
        if [ ! -s $DOTFILES/$f ]; then
            echo "$f not found downloading"
            curl -sL -o $DOTFILES/$f https://raw.githubusercontent.com/MarioAlexis/dotfile/master/$f
        fi

        if [ -h $HOME/$f ]; then
            if confirm "Overwrite $HOME/$f?"; then
                rm -rf $HOME/$f
                echo $f installed!
            fi
        else
            if [ -f $HOME/$f ]; then
                if confirm "Overwrite $HOME/$f?"; then
                    rm -rf $HOME/$f
                    echo $HOME/$f installed!
                fi
            else
                ln -sf $DOTFILES/$f $HOME/$f
                echo $HOME/$f installed!
            fi
        fi
    done
}
    
##################
#   MAIN
##################

# Create ~/bin if not exist
mkdir -p ~/bin

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

DOTFILES_TO_INSTALL=".gitconfig .vimrc .zshrc .p10k.zsh .shell_alias .shell_env .shell_functions"
link_to_home "$DOTFILES_TO_INSTALL"

# Install vim plugin
if [ -d ~/.vim/plugged/vim-superman ]; then
    vim -c ':PlugUpdate | quitall'
else
    vim -c ':PlugInstall | quitall'
    find ~/.vim -type f -name "vman" -exec cp {} ~/bin \;
fi