#export PS1='\033[00m\u@\h:\w$ '
#export PS1="\[\033[38;5;37m\]\u\[$(tput sgr0)\]\[\033[38;5;7m\]@\[$(tput sgr0)\]\[\033[38;5;214m\]\h\[$(tput sgr0)\]\[\033[38;5;7m\]:\w\[$(tput sgr0)\]\[\033[38;5;9m\]\\$\[$(tput sgr0)\]\[\033[38;5;7m\] \[$(tput sgr0)\]"
export PS1="\[\033[38;5;37m\]\u\[$(tput sgr0)\]\[\033[38;5;7m\]@\[$(tput sgr0)\]\[\033[38;5;214m\]\h\[$(tput sgr0)\]\[\033[38;5;7m\]:\[$(tput sgr0)\]\[\033[38;5;241m\]\w\[$(tput sgr0)\]\[\033[38;5;9m\]\\$\[$(tput sgr0)\]\[\033[38;5;7m\] \[$(tput sgr0)\]"
export DISPLAY=:0.0

# Bash Alias
alias ls="ls --color=auto"
alias ll="ls -lh"
alias la="ls -lha"
alias ..="cd ../"
alias cl="clear"
alias cdD="cd /cygdrive/c/Users/malabran/Documents/"
