#! /bin/bash
printf '%s\n' "$(date), $(tput bold)${BASH_SOURCE[0]}$(tput sgr0)"

# https://gcc.gnu.org/onlinedocs/gfortran/Option-Summary.html
# https://gcc.gnu.org/onlinedocs/gfortran/Error-and-Warning-Options.html
# https://gcc.gnu.org/wiki/GFortran/News#GCC7
export cppflags4="-g -Wall -Wextra -Og -pedantic -fmax-errors=5"
# export cppflags45=${cppflags4}' -fcheck=all -fcheck=recursive -fcheck=do -fcheck=pointer -fno-protect-parens ' # ERRMSG in allocations, NEWUNIT,ISO_FORTRAN_ENV data types
export cppflags45="${cppflags4}" # ERRMSG in allocations, NEWUNIT,ISO_FORTRAN_ENV data types
# 4.6 quad real
export cppflags47="${cppflags45}" # polymorphic class arrays, single image coarrays, -Ofast
export cppflags48="${cppflags47}" # unlimited polymorphic variables, assumed types
export  cppflags5="${cppflags48} -fdiagnostics-color=auto" # OpemMP fully implemented
export  cppflags6="${cppflags5}" # Submodules fully supoorted
export  cppflags7="${cppflags6}"
export   cppflags=${cppflags7}

alias  echocpp="echo $cppflags"
