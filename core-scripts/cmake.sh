#! /usr/bin/env bash
printf "%s\n" "$(date), $(tput bold)${BASH_SOURCE[0]}$(tput sgr0)"

export my_log="${configuration}/alias_assignments.txt"

alias   again="cd ../; rm -rf build; mkdir build;  cd build"
alias   quick="rm -rf build/ && mkdir build && cd build && cmake .."
alias   spwx-quick='echo "cd ${HOME}/SpWx; rm -rf build/ && mkdir build && cd build && cmake ../source -DCMAKE_INSTALL_PREFIX=../"'; cd ${HOME}/SpWx; rm -rf build/ && mkdir build && cd build && cmake ../source -DCMAKE_INSTALL_PREFIX=../'
alias quicker="cd ..; quick;  make"

alias crun="cd $DEMO_HOME; cd build; cmake ..; make"

alias contents_cmake='echo "ALIAS again, quick, quicker, crun: EXPORT my_log"'
