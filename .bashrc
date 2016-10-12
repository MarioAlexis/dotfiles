

#export PS1='\033[00m\u@\h:\w$ '
#export PS1="\[\033[38;5;37m\]\u\[$(tput sgr0)\]\[\033[38;5;7m\]@\[$(tput sgr0)\]\[\033[38;5;214m\]\h\[$(tput sgr0)\]\[\033[38;5;7m\]:\w\[$(tput sgr0)\]\[\033[38;5;9m\]\\$\[$(tput sgr0)\]\[\033[38;5;7m\] \[$(tput sgr0)\]"
export PS1="\[\033[38;5;37m\]\u\[$(tput sgr0)\]\[\033[38;5;7m\]@\[$(tput sgr0)\]\[\033[38;5;214m\]\h\[$(tput sgr0)\]\[\033[38;5;7m\]:\[$(tput sgr0)\]\[\033[38;5;241m\]\w\[$(tput sgr0)\]\[\033[38;5;9m\]\\$\[$(tput sgr0)\]\[\033[38;5;7m\] \[$(tput sgr0)\]"

#some more ls aliases
alias ll='ls -lF'
alias la='ls -al'
alias l='ls -CF'
alias clr='clear'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias aptins='apt-get install'
alias aptrem='apt-get remove'
alias aptup='apt-get update'
source /opt/ros/indigo/setup.bash

# Env Variable for OpenDroneMap
export PYTHONPATH=$PYTHONPATH:/root/OpenDroneMapFolder/OpenDroneMap/SuperBuild/install/lib/python2.7/dist-packages:/root/OpenDroneMapFolder/OpenDroneMap/SuperBuild/src/opensfm
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/root/OpenDroneMapFolder/OpenDroneMap/SuperBuild/install/lib
