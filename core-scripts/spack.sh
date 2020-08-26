#! /bin/bash
printf '%s\n' "$(date), $(tput bold)${BASH_SOURCE[0]}$(tput sgr0)"

alias l-spack=". ${core}/spack-init.sh"

# # errands
alias  gospack="cd ${mySpack}; pwd"
alias initspack="echo '. share/spack/setup-env.sh';. share/spack/setup-env.sh; echo 'l-spack'; l-spack"

alias gomirror="cd ${big_spack_mirror}; pwd"

alias genesis="echo 'git clone https://github.com/spack/spack'; git clone https://github.com/spack/spack"

alias yaml_cat='mkdir -p "${github}/catalog-spack/${host_name}/${thisArch}/${SPACK_ROOT}"; \
 export dir_to="${github}/catalog-spack/${host_name}/${thisArch}/${SPACK_ROOT}"; \
 rsync -zarv --prune-empty-dirs --include "*/" --include="*compilers.yaml" --include="*config.yaml" --include="*mirrors.yaml" --include="*modules.yaml" --include="*packages.yaml" --include="*repos.yaml" --exclude="*" "${SPACK_ROOT}/."  "${dir_to}"; \
 rsync -zarv --prune-empty-dirs --include "*/" --include="*compilers.yaml" --include="*config.yaml" --include="*mirrors.yaml" --include="*modules.yaml" --include="*packages.yaml" --include="*repos.yaml" --exclude="*" "${HOME}/.spack/." "${dir_to}" \
 spack find      > ${dir_to}/find.txt;
 spack find -ldf > ${dir_to}/find-ldf.txt;
 spack compilers > ${dir_to}/compilers.txt;
 module avail   2> ${dir_to}/modules.txt
 cd "${github}/catalog-spack" \
 git add -A . \
 git commit -m "${host_name} $(date +%Y-%m-%d)" \
 cd - ;'

alias capture_spack_config=". /Volumes/${raingod}/repos/bitbucket/spack_tools/scripts/reeper.$(basename $SHELL)"
