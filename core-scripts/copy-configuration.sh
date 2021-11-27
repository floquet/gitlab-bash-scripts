#! /bin/bash
printf '%s\n' "$(date), $(tput bold)${BASH_SOURCE[0]}$(tput sgr0)"

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
cd ${config_repo} # enter repo
git add -A . # add new files
git commit -m "${HOST} ${USER} $(date +%Y-%m-%d-%H-%M)"
echo ${PWD} # display repo location
cd ${here} # return to inital directory
