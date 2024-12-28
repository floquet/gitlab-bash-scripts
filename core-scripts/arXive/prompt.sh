#! /usr/bin/env bash
printf "%s\n" "$(date), $(tput bold)${BASH_SOURCE[0]}$(tput sgr0)"

##  ##  set environment
# http://unix.stackexchange.com/questions/177572/how-to-rename-terminal-tab-title-in-gnome-terminal
PROMPT_COMMAND='echo -ne "\033]0;${host_name}\007"'
# alias myprompt='export PS1='\''\[\033[00;35m\]\u\[\033[00m\]@\[\033[00;35m\]\H\[\033[00m\]:\[\033[00;33m\]\W\[\033[00m\] $\033[00;36m '\'''
# alias myprompt="export PS1=\/'\[\033[00;35m\]\u\[\033[00m\]@\[\033[00;35m\]\H\[\033[00m\]:\[\033[00;33m\]\W\[\033[00m\] $\033[00;36m '\/"
# https://scriptingosx.com/2019/07/moving-to-zsh-06-customizing-the-zsh-prompt/
alias myprompt="PROMPT='%F{magenta}${USER}:%F{cyan}%2~%f %F{white}%#%F{default} '"

myprompt
