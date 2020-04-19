zstyle :compinstall filename '/home/tim/.zshrc'

autoload -Uz compinit promptinit
compinit
promptinit

prompt walters

alias ls='ls -F -x --color=auto --group-directories-first'
alias grep='grep --color=auto'
alias diff='diff --color=auto'
