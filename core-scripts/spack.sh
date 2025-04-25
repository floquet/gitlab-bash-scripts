#!/usr/bin/env bash
printf "%s\n" "$(date), $(tput bold)${BASH_SOURCE[0]}$(tput sgr0)"
# Fri Nov 26 17:45:25 MST 2021
alias l-spack="source ${core}/spack-init.sh"

# # errands
alias   gospack="cd ${mySpack}; pwd"
alias initspack="echo 'source share/spack/setup-env.sh';source share/spack/setup-env.sh; echo 'l-spack'; l-spack"

alias gomirror="cd ${big_spack_mirror}; pwd"

alias genesis="echo 'git clone -c feature.manyFiles=true https://github.com/spack/spack.git' ; git clone -c feature.manyFiles=true https://github.com/spack/spack.git"

# script runners
alias run_reporter="source ${lap}/init/bash/control/spack-reporter.sh"
#alias                 reap=". ${bitbucket}/spack_tools/scripts/reaper.zsh"
alias capture_spack_config=". ${bitbucket}/spack_tools/scripts/reaper.$(basename $SHELL)"
alias    copy_yaml="source ${lap}/init/yaml/copier-yaml.sh"
alias copy_scripts="source ${lap}/init/bash/control/copier.sh"

# configuration commands
alias scgcm="echo 'spack config get compilers'; spack config get compilers"
alias scgcn="echo 'spack config get config'   ; spack config get config"
alias scgmi="echo 'spack config get mirrors'  ; spack config get mirrors"
alias scgmo="echo 'spack config get modules'  ; spack config get modules"
alias scgpa="echo 'spack config get packages' ; spack config get packages"
alias scgre="echo 'spack config get repos'    ; spack config get repos"

alias scbcm="echo 'spack config get compilers'; spack config blame compilers"
alias scbcn="echo 'spack config get config'   ; spack config blame config"
alias scbmi="echo 'spack config get mirrors'  ; spack config blame mirrors"
alias scbmo="echo 'spack config get modules'  ; spack config blame modules"
alias scbpa="echo 'spack config get packages' ; spack config blame packages"
alias scbre="echo 'spack config get repos'    ; spack config blame repos"
