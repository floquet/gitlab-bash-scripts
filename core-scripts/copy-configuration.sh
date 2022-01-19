#! /bin/bash
printf '%s\n' "$(date), $(tput bold)${BASH_SOURCE[0]}$(tput sgr0)"


# ${config_repo}: /Volumes/repos/bitbucket/mac-configurations
# ${dir_config}: Macmini8,1-(xiuhcoatl)/darwin 21.2.0/Monterey-12.1
export dir_inits=${configuration}/.config
mkdir -p ${dir_inits}
echo "copying configuration data to \${dir_inits} = ${dir_inits}"

# # C O P Y
rsync -am ${HOME}/*.sh      ${dir_inits}       &
rsync -am ${HOME}/*.txt     ${dir_inits}       &
rsync -am ${HOME}/.*.sh     ${dir_inits}       &
rsync -am ${HOME}/.git*     ${dir_inits}       &
rsync -am ${HOME}/.vim*     ${dir_inits}       &
rsync -am ${HOME}/.profile  ${dir_inits}       &

export dir_inits=${configuration}/.info
mkdir -p ${dir_inits}
rsync -am ${HOME}/.info/.   ${dir_inits}/.     &

wait

export here=${PWD} # tag directory for return trip
cd ${myBitbucket}/mac-configurations # enter
echo "git add -A . (${config_repo})"
      git add -A . # add new files
echo "git commit -m '${moniker} ${owner} ${dist}-${release} $(date +%Y-%m-%d\ %H:%M)'"
      git commit -m "${moniker} ${owner} ${dist}-${release} $(date +%Y-%m-%d\ %H:%M)"
echo ${PWD} # display repo location
cd ${here} # return to inital directory
