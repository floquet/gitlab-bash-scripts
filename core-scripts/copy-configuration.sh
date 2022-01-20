#! /bin/bash
printf '%s\n' "$(date), $(tput bold)${BASH_SOURCE[0]}$(tput sgr0)"


# ${config_repo}: /Volumes/repos/bitbucket/mac-configurations
# ${dir_config}: Macmini8,1-(xiuhcoatl)/darwin 21.2.0/Monterey-12.1
export dir_inits=${config_repo}/${dir_config}
mkdir -p ${dir_inits}

# # C O P Y
rsync -am ${HOME}/*.sh      ${dir_inits}       &
rsync -am ${HOME}/.git*     ${dir_inits}       &
rsync -am ${HOME}/.vim*     ${dir_inits}       &
rsync -am ${HOME}/.info/.   ${dir_inits}/.info &

wait

export here=${PWD} # tag directory for return trip
cd ${config_repo} # enter
echo "git add -A . (${config_repo})"
      git add -A . # add new files
echo "git commit -m '${moniker} ${owner} ${dist}-${release} $(date +%Y-%m-%d\ %H:%M)'"
      git commit -m "${moniker} ${owner} ${dist}-${release} $(date +%Y-%m-%d\ %H:%M)"
echo ${PWD} # display repo location
cd ${here} # return to inital directory
