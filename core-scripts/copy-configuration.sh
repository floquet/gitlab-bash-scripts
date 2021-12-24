#! /bin/bash
printf '%s\n' "$(date), $(tput bold)${BASH_SOURCE[0]}$(tput sgr0)"

export  configuration="${repos}/bitbucket/initialization-scripts/${platform}/${moniker}/${drive}/${owner}/${dist}/${release}/"
export  configuration="${locker}"
mkdir -p ${configuration}
echo "copying configuration files to \${configuration} = ${configuration}"

# # C O P Y
cp ${HOME}/${bash_file}     ${configuration} &
cp ${HOME}/${extras}        ${configuration} &
cp ${HOME}/.vimrc           ${configuration} &
cp ${HOME}/.gitconfig       ${configuration} &
cp ${HOME}/.gitignore_local ${configuration} &

wait

export here=${PWD} # tag directory for return trip
    cd ${config_repo} # enter
echo "git add -A . (${config_repo})"
      git add -A . # add new files
echo "git commit -m '${moniker} ${owner} ${dist}-${release} $(date +%Y-%m-%d %H-%M)'"
      git commit -m "${moniker} ${owner} ${dist}-${release} $(date +%Y-%m-%d %H-%M)"
echo ${PWD} # display repo location
cd ${here} # return to inital directory
