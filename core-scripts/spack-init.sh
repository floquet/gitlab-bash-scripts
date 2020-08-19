#! /bin/bash
printf '%s\n' "$(date), $(tput bold)${BASH_SOURCE[0]}$(tput sgr0)"

# #  A L I A S
alias sp="cd ${SPACK_ROOT}; pwd"
alias esp="echo '\${SPACK_ROOT}:'; echo '${SPACK_ROOT}'"
alias clone_spack="git clone https://github.com/spack/spack"
alias copy_yaml=". ${lap}/init/yaml/copier-yaml.sh"
alias copy_scripts=". ${lap}/init/bash/control/copier.sh"
alias run_reporter=". ${lap}/init/bash/control/spack-reporter.sh"
alias  sf="spack find"
alias sfl="spack find -ldf"

alias scgcm="echo 'spack config get compilers'; spack config get compilers"
alias scgcn="echo 'spack config get config'   ; spack config get config"
alias scgmi="echo 'spack config get mirrors'  ; spack config get mirrors"
alias scgmo="echo 'spack config get modules'  ; spack config get modules"
alias scgpa="echo 'spack config get packages' ; spack config get packages"
alias scgre="echo 'spack config get repos'    ; spack config get repos"

alias scbcm="echo 'spack config blame compilers'; spack config blame compilers"
alias scbcn="echo 'spack config blame config'   ; spack config blame config"
alias scbmi="echo 'spack config blame mirrors'  ; spack config blame mirrors"
alias scbmo="echo 'spack config blame modules'  ; spack config blame modules"
alias scbpa="echo 'spack config blame packages' ; spack config blame packages"
alias scbre="echo 'spack config blame repos'    ; spack config blame repos"

alias graf="echo 'git remote add floquet https://github.com/floquet/spack.git'; git remote add floquet https://github.com/floquet/spack.git"
alias feed_spack_mirror="echo 'rsync -vauh ${SPACK_ROOT}/var/spack/cache/_source-cache/. ${big_spack_mirror}/_source-cache/.'; \
                               rsync -vauh ${SPACK_ROOT}/var/spack/cache/_source-cache/. ${big_spack_mirror}/_source-cache/."

# # quick edits
alias  vhcm="vim ${HOME}/.spack/compilers.yaml"
alias vhlcm="vim ${HOME}/.spack/linux/compilers.yaml"

export thisArch=$(spack arch)
export dir_yaml="${SPACK_ROOT}/etc/spack/defaults"

alias   vcp="vim ${dir_yaml}/compilers.yaml"
alias   vcn="vim ${dir_yaml}/config.yaml"
alias   vmi="vim ${dir_yaml}/mirrors.yaml"
alias   vmo="vim ${dir_yaml}/modules.yaml"
alias   vpa="vim ${dir_yaml}/packages.yaml"

alias sli="spack location --install"

## modules
alias reft="echo 'spack module tcl  refresh --delete-tree -y'; spack module tcl  refresh --delete-tree -y"
alias refl="echo 'spack module lmod refresh --delete-tree -y'; spack module lmod refresh --delete-tree -y"

alias modt="echo 'spack module tcl  refresh --delete-tree -y'; spack module tcl  refresh --delete-tree -y"
alias modl="echo 'spack module lmod refresh --delete-tree -y'; spack module lmod refresh --delete-tree -y"

alias mu="echo 'module load lmod'; module load lmod; echo 'module use ${SPACK_ROOT}/share/spack/lmod/$(spack arch)/Core'; module use ${SPACK_ROOT}/share/spack/lmod/$(spack arch)/Core"
# alias fix_module_path="ep; echo ''; module unuse ${SPACK_ROOT}/share/spack/modules/$(spack arch); ep; echo ''; module use ${SPACK_ROOT}/share/spack/lmod/$(spack arch)/Core/; ep; echo ''"

function foo(){
    list="compilers config mirrors modules packages repos"
    for l in ${list}; do
        echo ""                        >> ${1}
        echo  spack config blame ${l}
        echo "spack config blame ${l}" >> ${1}
              spack config blame ${l}  >> ${1}
    done
}

# alias contents_spack='echo "ALIAS  fix_module_path ref sil sml sp scgcm scgcn scgmi scgmo scgpa scgre spack_here spack_https spack_set spack_shell spack_ssh spack_try svicompilers svimodules svimirrors"; echo "EXPORT spack_mirror_draco spack_mirror_scratch"'


