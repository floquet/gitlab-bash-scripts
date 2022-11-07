#! /bin/bash -1
printf '%s\n' "$(date), $(tput bold)${BASH_SOURCE[0]}$(tput sgr0)"

export repos_github=""

if [ -d "${github}/animations" ]; then
    export  animations="${github}/animations"
    alias goanimations="cd ${animations}; pwd"
          repos_github="${repos_github} animations"
fi

if [ -d "${github}/builds" ]; then
    export  builds="${github}/builds"
    alias gobuilds="cd ${builds}; pwd"
    repos_github="${repos_github} builds"
fi

if [ -d "${github}/conferences" ]; then
    export  conferences="${github}/conferences"
    alias goconferences="cd ${conferences}; pwd"
           repos_github="${repos_github} conferences"
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

if [ -d "${github}/jop" ]; then
    export   jop="${github}/jop"
    alias  gojop="cd ${jop}; pwd"
    repos_github="${repos_github} jop"
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

if [ -d "${github}/nursery-slide-decks" ]; then
    export d_nursery="${github}/nursery-slide-decks"
    alias  gonursery="cd ${d_nursery}; pwd"
    alias  godtra="cd ${d_nursery}/beamer/dtra; pwd"
    repos_github="${repos_github} d_nursery"
fi

if [ -d "${github}/python" ]; then
    export d_python="${github}/python"
    alias  gopython="cd ${d_python}; pwd"
    repos_github="${repos_github} python"
fi

if [ -d "${github}/reconstructor" ]; then
    export  reconstructor="${github}/reconstructor"
    alias goreconstructor="cd ${reconstructor}; pwd"
             repos_github="${repos_github} reconstructor"
fi

if [ -d "${github}/spacktivity" ]; then
    export   spacktivity="${github}/spacktivity"
    alias  gospacktivity="cd ${spacktivity}; pwd"
    repos_github="${repos_github} spacktivity"
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
