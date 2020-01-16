#! /bin/bash -1
printf '%s\n' "$(date), $(tput bold)${BASH_SOURCE[0]}$(tput sgr0)"

export repos_bitbucket=""

if [ -d "${bitbucket}/bottom" ]; then
    export  bottom="${bitbucket}/bottom"
    alias gobottom="cd ${bottom}; pwd"
    repos_bitbucket="${repos_bitbucket} bottom"
fi

if [ -d "${bitbucket}/ert" ]; then
    export  ert="${bitbucket}/ert"
    alias goert="cd ${ert}; pwd"
    repos_bitbucket="${repos_bitbucket} ert"
fi

if [ -d "${bitbucket}/fortran-alpha" ]; then
    export  fortrana="${bitbucket}/fortran-alpha"
    alias gofortrana="cd ${fortrana}; pwd"
    repos_bitbucket="${repos_bitbucket} fortrana"
fi

if [ -d "${bitbucket}/icons" ]; then
    export  icons="${bitbucket}/icons"
    alias goicons="cd ${icons}; pwd"
    repos_bitbucket="${repos_bitbucket} icons"
fi

if [ -d "${bitbucket}/initialization-scripts" ]; then
    export  iscripts="${bitbucket}/initialization-scripts"
    alias goiscripts="cd ${iscripts}; pwd"
    repos_bitbucket="${repos_bitbucket} iscripts"
fi

if [ -d "${bitbucket}/latexery" ]; then
    export  latexery="${bitbucket}/latexery"
    alias golatexery="cd ${latexery}; pwd"
    repos_bitbucket="${repos_bitbucket} latexery"
fi

if [ -d "${bitbucket}/LANL" ]; then
    export          lanl="${bitbucket}/LANL"
    export least_squares="${lanl}/fortran/least-squares"
    alias         golanl="cd ${lanl}; pwd"
    alias        goleast="cd ${least_squares}; pwd"
    alias         gomods="cd ${least_squares}/module-library; pwd"
    alias       gocircle="cd ${least_squares}/circle; pwd"
    repos_bitbucket="${repos_bitbucket} lanl"
fi

if [ -d "${bitbucket}/LLNL-lap" ]; then
    export     llap="${bitbucket}/LLNL-lap"
    alias    gollap="cd ${bottom}; pwd"
    repos_bitbucket="${repos_bitbucket} llap"
fi

if [ -d "${bitbucket}/mac-bash" ]; then
    export  mac_bash="${bitbucket}/mac-bash"
    alias gomac="cd ${mac_bash}; pwd"
    repos_bitbucket="${repos_bitbucket} mac_bash"
fi

if [ -d "${bitbucket}/python" ]; then
    export mypython="${bitbucket}/python"
    alias  gopython="cd ${mypython}; pwd"
    repos_bitbucket="${repos_bitbucket} mypython"
fi

if [ -d "${bitbucket}/top" ]; then
    export  top="${bitbucket}/top"
    alias gotop="cd ${top}; pwd"
    repos_bitbucket="${repos_bitbucket} top"
fi
