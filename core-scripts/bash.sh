#!/bin/bash
printf '%s\n' "$(date), $(tput bold)${BASH_SOURCE[0]}$(tput sgr0)"

# #   E X P O R T
export os="$(tr [A-Z] [a-z] <<< "$(uname)")" # operating system, lower case

# #   A L I A S
alias    lss="ls -alh --color"
alias     sr="source ${HOME}/${bash_file}"  # source bash file
alias   bcat="cat    ${HOME}/${bash_file}"  # cat    bash file
alias setnow='export dir_now="$(pwd)"; gonow=cd ${dir_now}'
alias    lsb="echo 'lsb_release -a'; lsb_release -a"

alias curl_37='grep -r "curl: (37)" .'
alias   stale='grep  -r "[Errno 116] Stale file handle" .'

alias release='echo "cat /etc/os-release"; cat /etc/os-release'


# # path queries
alias  ep="echo '\${PATH}:';       echo ${PATH}"
alias emp="echo '\${MODULEPATH}:'; echo ${MODULEPATH}"
alias esp="echo '\${SPACK_ROOT}:'; echo ${SPACK_ROOT}"
alias ebf="echo '\${bash_file}:';  echo ${bash_file}"
alias epa="echo '\${partition}:';  echo ${partition}"
