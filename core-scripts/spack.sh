#! /bin/bash
printf '%s\n' "$(date), $(tput bold)${BASH_SOURCE[0]}$(tput sgr0)"

alias l-spack=". ${core}/spack-init.sh"

# # errands
alias  gospack="cd ${mySpack}; pwd"
alias initspack="echo '. share/spack/setup-env.sh';. share/spack/setup-env.sh; echo 'l-spack'; l-spack"

alias gomirror="cd /usr/projects/draco/vendors/spack.mirror; pwd"
alias gomirrorx="cd /scratch/vendors/spack.mirror; pwd"

alias genesis="git clone https://github.com/spack/spack"
