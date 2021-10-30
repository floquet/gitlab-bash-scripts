#! /bin/bash
printf '%s\n' "$(date), $(tput bold)${BASH_SOURCE[0]}$(tput sgr0)"

mkdir -p ${configuration}
echo "copying configuration files to \${configuration} = ${configuration}"

# # C O P Y
cp ${HOME}/${bash_file} ${configuration} &
cp ${HOME}/${extras}    ${configuration} &
cp ${HOME}/.vimrc       ${configuration} &
cp ${HOME}/.gitconfig   ${configuration} &

#wait
