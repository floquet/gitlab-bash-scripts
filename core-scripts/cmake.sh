#! /usr/bin/env bash
printf "%s\n" "$(date), $(tput bold)${BASH_SOURCE[0]}$(tput sgr0)"

export my_log="${configuration}/alias_assignments.txt"

# alias  cmake3="/opt/local/bin/cmake"
alias   again="cd ../; rm -rf build; mkdir build;  cd build"
alias   quick="rm -rf build/ && mkdir build && cd build && cmake .."
alias   spwx-quick='echo "cd ${SpWx}; rm -rf build/ && mkdir build && cd build && cmake3 ../source -DCMAKE_INSTALL_PREFIX=../"; cd ${SpWx}; rm -rf build/ && mkdir build && cd build && cmake3 ../source -DCMAKE_INSTALL_PREFIX=../'
alias quicker="cd ..; quick;  make"

alias crun="cd $DEMO_HOME; cd build; cmake ..; make"

alias contents_cmake='echo "ALIAS again, quick, quicker, crun: EXPORT my_log"'
