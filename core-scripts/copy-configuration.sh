#! /usr/bin/env bash
printf "%s\n" "$(date), $(tput bold)${BASH_SOURCE[0]}$(tput sgr0)"

# ${config_repo}: /Volumes/repos/bitbucket/mac-configurations
# ${dir_config}: Macmini8,1-(xiuhcoatl)/darwin 21.2.0/Monterey-12.1
export dir_inits=${config_repo}
mkdir -p ${config_repo}/.info

# # C O P Y
rsync -am ${HOME}/*.sh      ${config_repo}  2>/dev/null &
#rsync -am ${HOME}/*.txt     ${config_repo}  2>/dev/null &
rsync -am ${HOME}/.*.sh     ${config_repo}              &
rsync -am ${HOME}/.git*     ${config_repo}              &
rsync -am ${HOME}/.vim*     ${config_repo}              &
rsync -am ${HOME}/.info/.   ${config_repo}/.info        &

wait
echo "threads completed for copy-configuration.sh write to ${config_repo} ..."

export here=${PWD} # tag directory for return trip
cd ${bitbucket}/mac-configurations # enter
echo "\${PWD} = ${PWD}"
echo "git add -A . " #"(${config_repo})"
      git add -A . # add new files
echo "git commit -m '${moniker} ${owner} ${dist}-${release} $(date +%Y-%m-%d\ %H:%M)'"
      git commit -m "${moniker} ${owner} ${dist}-${release} $(date +%Y-%m-%d\ %H:%M)"
echo ${PWD} # display repo location
cd ${here} # return to inital directory
