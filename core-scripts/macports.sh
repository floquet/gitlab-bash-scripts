#! /usr/bin/env bash
printf "%s\n" "$(date), $(tput bold)${BASH_SOURCE[0]}$(tput sgr0)"

alias mp_gcc11='echo "sudo port select --set gcc mp-gcc11"; sudo port select --set gcc mp-gcc11'
alias mp_gcc10='echo "sudo port select --set gcc mp-gcc10"; sudo port select --set gcc mp-gcc10'
alias  mp_gcc9='echo "sudo port select --set gcc mp-gcc9";  sudo port select --set gcc mp-gcc9'
alias  mp_gcc8='echo "sudo port select --set gcc mp-gcc8";  sudo port select --set gcc mp-gcc8'

alias mp_python10='echo "sudo port select --set python mp-gcc11"; sudo port select --set gcc mp-gcc11'
alias mp_gcc10='echo "sudo port select --set gcc mp-gcc10"; sudo port select --set gcc mp-gcc10'

alias mp_maintenance='echo "sudo port -v selfupdate; sudo port -v upgrade outdated; sudo port -v reclaim"; sudo port -v selfupdate; echo ""; echo "@  @  @  @  @  begin upgrade"; sudo port -v upgrade outdated; echo ""; echo "@  @  @  @  @  begin reclaim"; sudo port -v reclaim'
