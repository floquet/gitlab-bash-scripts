#! /bin/bash
printf '%s\n' "$(date), $(tput bold)${BASH_SOURCE[0]}$(tput sgr0)"

alias l-spack=". ${core}/spack-init.sh"

# # errands
alias  gospack="cd ${mySpack}; pwd"
alias initspack="echo '. share/spack/setup-env.sh';. share/spack/setup-env.sh; echo 'l-spack'; l-spack"

alias gomirror="cd /usr/projects/draco/vendors/spack.mirror; pwd"

alias genesis="git clone https://github.com/spack/spack"

alias yaml_cat='export dir_to="${github}/catalog-spack/${host_name}/${thisArch}/${SPACK_ROOT}"; rsync -zarv --prune-empty-dirs --include "*/" --include="*compilers.yaml" --include="*config.yaml" --include="*mirrors.yaml" --include="*modules.yaml" --include="*packages.yaml" --include="*repos.yaml" --exclude="*" "${SPACK_ROOT}/." "${dir_to}"; rsync -zarv --prune-empty-dirs --include "*/" --include="*compilers.yaml" --include="*config.yaml" --include="*mirrors.yaml" --include="*modules.yaml" --include="*packages.yaml" --include="*repos.yaml" --exclude="*" "${HOME}/.spack/." "${dir_to}"'
