#! /bin/bash
printf '%s\n' "$(date), $(tput bold)${BASH_SOURCE[0]}$(tput sgr0)"
# Fri Nov 26 17:45:25 MST 2021

# # exports
export dir_yaml="${SPACK_ROOT}/etc/spack/defaults"
export thisArch=$(spack arch)

# #  spack shortcuts
alias  sp="cd ${SPACK_ROOT}; pwd"
alias esp="echo '\${SPACK_ROOT}:'; echo '${SPACK_ROOT}'"
alias sfl="echo 'spack find -ldf'; spack find -ldf"
alias  sf="echo 'spack find'; spack find"
alias  si="echo 'spack info'; spack info"

# # captures
alias move_to_mirror="export dirSource='${SPACK_ROOT}/var/spack/cache/_source-cache/archive'; export dirSink='${big_spack_mirror}/_source-cache/archive'; echo '\${dirSource} = ${dirSource}';echo '\${dirSink} = ${dirSink}'; echo 'rsync -vauh ${dirSource} ${dirSink}'; rsync -vauh ${dirSource} ${dirSink}"
alias feed_spack_mirror="echo 'rsync from \${SPACK_ROOT} = ${SPACK_ROOT}'; echo 'rsyn to   \${big_spack_mirror} = ${big_spack_mirror}'; rsync -vauh ${SPACK_ROOT}/var/spack/cache/_source-cache/archive/. ${big_spack_mirror}/_source-cache/archive/."
export dirReapers="${vrepos}/bitbucket/spack-tools/scripts/reapers"
alias reapzsh="echo 'source ${dirReapers}/modern-reaper.zsh'; source ${dirReapers}/modern-reaper.zsh"
alias reapbsh="echo 'source ${dirReapers}/modern-reaper.sh';  source ${dirReapers}/modern-reaper.sh"
alias yaml_cat='mkdir -p "${github}/catalog-spack/${host_name}/${thisArch}/${SPACK_ROOT}; export dir_to="${github}/catalog-spack/${host_name}/${thisArch}/${SPACK_ROOT}"; rsync -zarv --prune-empty-dirs --include "*/" --include="*compilers.yaml" --include="*config.yaml" --include="*mirrors.yaml" --include="*modules.yaml" --include="*packages.yaml" --include="*repos.yaml" --exclude="*" "${SPACK_ROOT}/." "${dir_to}"; rsync -zarv --prune-empty-dirs --include "*/" --include="*compilers.yaml" --include="*config.yaml" --include="*mirrors.yaml" --include="*modules.yaml" --include="*packages.yaml" --include="*repos.yaml" --exclude="*" "${HOME}/.spack/." "${dir_to}"'

# # quick edits
alias  vhcm="vim ${HOME}/.spack/compilers.yaml"
alias vhlcm="vim ${HOME}/.spack/linux/compilers.yaml"
alias   vcp="vim ${dir_yaml}/compilers.yaml"
alias   vcn="vim ${dir_yaml}/config.yaml"
alias   vmi="vim ${dir_yaml}/mirrors.yaml"
alias   vmo="vim ${dir_yaml}/modules.yaml"
alias   vpa="vim ${dir_yaml}/packages.yaml"

alias graf="echo 'git remote add floquet https://github.com/floquet/spack.git'; git remote add floquet https://github.com/floquet/spack.git"

## modules
alias reft="echo 'spack module tcl  refresh --delete-tree -y'; spack module tcl  refresh --delete-tree -y"
alias refl="echo 'spack module lmod refresh --delete-tree -y'; spack module lmod refresh --delete-tree -y"

alias modt="echo 'spack module tcl  refresh --delete-tree -y'; spack module tcl  refresh --delete-tree -y"
alias modl="echo 'spack module lmod refresh --delete-tree -y'; spack module lmod refresh --delete-tree -y"

alias mu="echo 'module load lmod'; module load lmod; echo 'module use ${SPACK_ROOT}/share/spack/lmod/$(spack arch)/Core'; module use ${SPACK_ROOT}/share/spack/lmod/$(spack arch)/Core"
alias fix_module_path="ep; echo ''; module unuse ${SPACK_ROOT}/share/spack/modules/$(spack arch); ep; echo ''; module use ${SPACK_ROOT}/share/spack/lmod/$(spack arch)/Core/; ep; echo ''"

# alias contents_spack='echo "ALIAS  fix_module_path ref sil sml sp scgcm scgcn scgmi scgmo scgpa scgre spack_here spack_https spack_set spack_shell spack_ssh spack_try svicompilers svimodules svimirrors"; echo "EXPORT spack_mirror_draco spack_mirror_scratch"'

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
