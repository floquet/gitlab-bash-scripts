#! /bin/bash
printf '%s\n' "$(date), $(tput bold)${BASH_SOURCE[0]}$(tput sgr0)"

alias   v="echo 'vim ${HOME}/${bash_file}'; vim ${HOME}/${bash_file}"
alias  vc="echo 'vim ${core}/master.sh';    vim ${core}/master.sh"
alias  vm="echo 'vim makefile';             vim makefile"
alias  vM="echo 'vim Makefile';             vim Makefile"
alias vcm="echo 'vim CMakeLists.txt';       vim CMakeLists.txt"

alias  ve="echo 'vim ${extras}'; vim ${HOME}/${extras}"

alias contents_vim='echo "ALIAS v, vc, vm, vM, vcm"'
