#! /usr/bin/env bash
printf "%s\n" "$(date), $(tput bold)${BASH_SOURCE[0]}$(tput sgr0)"

# https://stackoverflow.com/questions/8855896/specify-directory-where-gfortran-should-look-for-modules
# https://stackoverflow.com/questions/38274242/specifying-directories-during-fortran-compilation
# https://stackoverflow.com/questions/41753060/gfortran-include-directory-with-subroutines
# https://stackoverflow.com/questions/13521847/makefile-to-compile-fortran-source-files-in-different-directories
# https://stackoverflow.com/questions/18463947/how-to-compile-multi-folder-fortran-project-having-interfaces-modules-and-subro
alias    mm='echo "make -k"; make -k'
alias   mmm='echo "make clean; make -k; make -k"; make clean; make -k; make -k'
alias mmake='echo "make clean; make"; make clean; make'
