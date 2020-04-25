#! /bin/bash -1
printf '%s\n' "$(date), $(tput bold)${BASH_SOURCE[0]}$(tput sgr0)"

export repos_github=""

if [ -d "${github}/build-issues" ]; then
    export  builds="${github}/docker"
    alias gobuilds="cd ${ddocker}; pwd"
    repos_github="${repos_github} builds"
fi

if [ -d "${github}/catalog-spack" ]; then
    export  catalog="${github}/catalog-spack"
    alias gocatalog="cd ${catalog}; pwd"
    repos_github="${repos_github} catalog"
fi

if [ -d "${github}/cuda" ]; then
    export  cuda="${github}/cuda"
    alias gocuda="cd ${cuda}; pwd"
    repos_github="${repos_github} cuda"
fi

if [ -d "${github}/docker" ]; then
    export  ddocker="${github}/docker"
    alias goddocker="cd ${ddocker}; pwd"
    repos_github="${repos_github} docker"
fi

if [ -d "${github}/gitlab-bash-scripts" ]; then
    export  gbs="${github}/gitlab-bash-scripts"
    alias gogbs="cd ${gbs}; pwd"
    repos_github="${repos_github} gbs"
fi

if [ -d "${github}/hydro" ]; then
    export  hydro="${github}/hydro"
    alias gohydro="cd ${hydro}; pwd"
    repos_github="${repos_github} hydro"
fi

if [ -d "${github}/LLNL-bash" ]; then
    export  lbash="${github}/LLNL-bash"
    alias golbash="cd ${lbash}; pwd"
    repos_github="${repos_github} lbash"
fi

if [ -d "${github}/modern-fortran" ]; then
    export  mfortran="${github}/modern-fortran"
    alias gomfortran="cd ${mfortran}; pwd"
    repos_github="${repos_github} mfortran"
fi

if [ -d "${github}/nimbus" ]; then
    export  nimbus="${github}/nimbus"
    alias gonimbus="cd ${nimbus}; pwd"
    repos_github="${repos_github} nimbus"
fi

if [ -d "${github}/python" ]; then
    export d_python="${github}/python"
    alias  gopython="cd ${d_python}; pwd"
    repos_github="${repos_github} python"
fi

if [ -d "${github}/topa-development" ]; then
    export  topa="${github}/topa-development"
    alias gotopa="cd ${topa}; pwd"
    repos_github="${repos_github} topa"
fi

if [ -d "${github}/yaml-library" ]; then
    export  yaml_library="${github}/yaml-library"
    alias goyaml="cd ${yaml_library}; pwd"
    repos_github="${repos_github} yaml_library"
fi
