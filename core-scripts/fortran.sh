#! /usr/bin/env bash
printf "%s\n" "$(date), $(tput bold)${BASH_SOURCE[0]}$(tput sgr0)"

# https://gcc.gnu.org/onlinedocs/gfortran/Option-Summary.html
# https://gcc.gnu.org/onlinedocs/gfortran/Error-and-Warning-Options.html
# https://gcc.gnu.org/wiki/GFortran/News#GCC7
export gflags4="-g -ffpe-trap=denormal,invalid,zero -fbacktrace -Wall -Wextra -Waliasing -Wsurprising -Wimplicit-procedure -Wintrinsics-std -Og -pedantic -fmax-errors=5"
# export gflags45=${gflags4}' -fcheck=all -fcheck=recursive -fcheck=do -fcheck=pointer -fno-protect-parens ' # ERRMSG in allocations, NEWUNIT,ISO_FORTRAN_ENV data types
export gflags45="${gflags4} -fcheck=all -fcheck=do -fcheck=pointer -fno-protect-parens" # ERRMSG in allocations, NEWUNIT,ISO_FORTRAN_ENV data types
# 4.6 quad real
export gflags47="${gflags45} -Wfunction-elimination -faggressive-function-elimination" # polymorphic class arrays, single image coarrays, -Ofast
export gflags48="${gflags47} -Wc-binding-type -Wrealloc-lhs-all" # unlimited polymorphic variables, assumed types
export  gflags5="${gflags48} -Wuse-without-only -fdiagnostics-color=auto" # OpemMP fully implemented
export  gflags6="${gflags5}  -Wconversion-extra" # Submodules fully supoorted
export  gflags7="${gflags6}  -finit-derived" # new RANDOM_NUMBER with per-thread state
export  gflags8="${gflags7}"
export  gflags9="${gflags8}"
# export gflags10="${gflags9} -fallocation-dce -fprofile-partial-training -fprofile-reproducible -fprofile-prefix-path -fanalyzer"
export gflags10="${gflags9} -fallocation-dce -fprofile-partial-training  -fanalyzer"
export   gflags="${gflags10}"

export Wflags="-Wall -Warray-temporaries -Wextra -Waliasing -Wsurprising -Wimplicit-procedure -Wintrinsics-std -Wfunction-elimination -Wc-binding-type -Wrealloc-lhs-all -Wuse-without-only -Wconversion-extra"

export fflags="-fno-realloc-lhs -ffpe-trap=denormal,invalid,zero -fbacktrace -fmax-errors=5 -fcheck=all -fcheck=do -fcheck=pointer -fno-protect-parens -faggressive-function-elimination -fdiagnostics-color=auto -finit-derived"

export allflags="${Wflags} ${fflags}"

# export cflags="${gflags} -fcoarray=lib"
# export crayflags="-g -fbacktrace"

# export nagflags="-g -C=all -colour -compatible -f2008 -free -gc -gline -info -nan -O2 -pg -time -v -V"

alias  echogf="echo $gflags"
alias  echocf="echo $cflags"

#  #  C O M P I L E
# export fortran_compiler_gnu="gfortran"
# export fortran_compiler_caf="caf"
# export fortran_compiler_mpi_gnu="mpif90"
# export fortran_compiler_mpi_cray="ftn"

# To make openmpi-default's wrappers the default (what you get when you execute 'mpicc' etc.) please run:
alias wrappersFortran="echo 'sudo port select --set mpi openmpi-mp-fortran'; sudo port select --set mpi openmpi-mp-fortran"

# # F U N C T I O N S
function gf(){
  echo "gcc compilation flags: "$gflags;
  echo "gfortran $gflags $1.f08 -o $1"
  gfortran $gflags $1.f08 -o $1
}

# function nf(){
#   echo "nag compilation flags: "$nagflags;
#   nagfor $nagflags $1.f08 -o $1
# }

# function intelf(){
#   echo "intel compilation flags: "$intelflags;
#   ifor $intelflags -Tf $1.f08 -o $1
# }

# function cf(){
#   caf $gflags -fcoarray=lib $1.f08 -o $1
# }

# function mp(){
#   mpifort -fcoarray=lib $1.f08 -L/opt/local/lib/ -lcaf_mpi -o $1
# }
