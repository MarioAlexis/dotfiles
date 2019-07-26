#!/bin/bash

DOTFILES="$( cd "$( dirname "${BASH_SOURCE[0]}")" && pwd )"


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
                ln -sf $DOTFILES/$f $HOME/$f
                echo $f installed!
            fi
        else
            if [ -f $HOME/$f ]; then
                if confirm "Overwrite $HOME/$f?"; then
                    rm -rf $HOME/$f
                    ln -sf $DOTFILES/$f $HOME/$f
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

DOTFILES_TO_INSTALL=".gitconfig .tmux.conf .vimrc .zshrc .bashrc .shell_alias .shell_env .shell_functions"
link_to_home "$DOTFILES_TO_INSTALL"
