#! /usr/bin/env bash
printf "%s\n" "$(date) , $(tput bold)${BASH_SOURCE[0]}$(tput sgr0)"

# Sequential: Core environment setup
source "${core}/paths.sh"
source "${core}/bash.sh"

# Parallel execution of independent scripts
(
    source "${core}/gcc.sh" &
    source "${core}/git.sh" &
    source "${core}/ssh.sh" &
    source "${core}/vim.sh" &
    source "${core}/grep.sh" &
    source "${core}/make.sh" &
    source "${core}/finds.sh" &
    source "${core}/cmake.sh" &
    source "${core}/python.sh" &
    source "${core}/docker.sh" &
    source "${core}/alias-navigation.sh" &
    source "${core}/disk.sh" &
    source "${core}/uname.sh" &
    source "${core}/spack.sh" &
    source "${core}/lstopo.sh" &
    source "${core}/c.sh" &
    source "${core}/fortran.sh" &
    source "${core}/bookmarks.sh" &
    source "${core}/modules.sh" &
    source "${core}/macports.sh" &
) &

# Sequential execution of dependent or environment-modifying scripts
echo "Waiting for all background processes to complete..."
wait
echo "All background processes have completed."

source "${core}/logs.sh" create
source "${core}/copy-configuration.sh"
source "${core}/alias.sh"
source "${core}/prompt.sh"
source "${core}/environment.sh"

# Summary output
echo "user account = $(whoami)"
echo "\${SHELL} = ${SHELL}"
echo "gcc --version:"
gcc --version

