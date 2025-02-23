#! /usr/bin/env bash
printf "%s\n" "$(date) , $(tput bold)${BASH_SOURCE[0]}$(tput sgr0)"

# run first - slowest script
#source "${core}/info.sh"

# # S C R I P T S
source "${core}/paths.sh"

source "${core}/gcc.sh"
source "${core}/git.sh"
source "${core}/ssh.sh"
source "${core}/vim.sh"
source "${core}/grep.sh"
source "${core}/make.sh"
source "${core}/bash.sh"
source "${core}/finds.sh"
source "${core}/logs.sh" create
source "${core}/cmake.sh"
source "${core}/python.sh"
source "${core}/docker.sh"
source "${core}/alias-navigation.sh"
source "${core}/copy-configuration.sh"  &

source "${core}/c.sh"
source "${core}/fortran.sh"
source "${core}/bookmarks.sh"

# information routines
source "${core}/disk.sh"
source "${core}/uname.sh"               &
source "${core}/spack.sh"
source "${core}/lstopo.sh"              &
source "${core}/alias.sh"
source "${core}/prompt.sh"
source "${core}/modules.sh"
source "${core}/macports.sh"
source "${core}/environment.sh"

wait

echo "user account = $(whoami)"
echo "\${SHELL} = ${SHELL}"
echo "gcc --version:"
gcc --version
