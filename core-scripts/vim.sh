#! /bin/bash
printf '%s\n' "$(date), $(tput bold)${BASH_SOURCE[0]}$(tput sgr0)"

alias   v="echo 'vim ${HOME}/${bash_file}'; vi ${HOME}/${bash_file}"
alias  vc="echo 'vim ${core}/master.sh';    vi ${core}/master.sh"
alias  vm="echo 'vim makefile';             vi makefile"
alias  vM="echo 'vim Makefile';             vi Makefile"
alias vcm="echo 'vim CMakeLists.txt';       vi CMakeLists.txt"

alias  ve="echo 'vim ${extras}'; vi ${HOME}/${extras}"

alias contents_vim='echo "ALIAS v, vc, vm, vM, vcm"'
