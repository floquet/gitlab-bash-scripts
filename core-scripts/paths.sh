#! /usr/bin/env bash
printf "%s\n" "$(date), $(tput bold)${BASH_SOURCE[0]}$(tput sgr0)"

# Sat Jan 22 15:17:25 MST 2022

# When this script launches, we have values for:
#   platform, moniker, machine, owner
#   repos, bitbucket
#   os, dist, release

# #  C O N S T R U T O R S
export dir_config="${machine}-(${moniker})/${os}/${dist}-${release}"

# #  L O C A L  M A C H I N E
export    locker="${HOME}/.info"
export    extras=".platform-specific.sh"
export   scratch="${HOME}/scratch"

mkdir -p ${locker}

export arXive_PATH="${PATH}"

# #  B I T B U C K E T
export     bitbucket="${repos}/bitbucket"
export   config_repo="${bitbucket}/mac-configurations/${dir_config}/$(uname -n)"
export configuration=${config_repo}
export        stools="${bitbucket}/spack-tools"

mkdir -p ${config_repo}

alias goSpackTools="echo 'cd ${stools}'; cd ${stools}; pwd"
alias gomac="cd ${bitbucket}/mac-configurations; pwd"

# #  G I T H U B
export              github="${repos}/github"
export          repo_build="${github}/builds"
export repo_results_docker="${repo_build}/results-docker"
export  repo_results_spack="${repo_build}/results-spack"
export repo_scripts_docker="${repo_build}/scripts-docker"
export  repo_scripts_spack="${repo_build}/scripts-spack"

#export  spwx="${github}/space-weather"
export dcker="${github}/docker/unified"
export astra="${github}/astra-spack-mirror"

alias         goAstra="echo 'cd ${astra}';               cd ${astra};                     pwd"
alias goResultsDocker="echo 'cd ${repo_results_docker}'; cd ${srepo_results_dockertools}; pwd"
alias goScriptsDocker="echo 'cd ${repo_scripts_docker}'; cd ${repo_scripts_docker};       pwd"
alias  goResultsSpack="echo 'cd ${repo_results_spack}';  cd ${repo_results_spack};        pwd"
alias  goScriptsSpack="echo 'cd ${repo_scripts_spack}';  cd ${repo_scripts_spack};        pwd"

# #  G I T L A B
export        gitlab="${repos}/gitlab"
#export         truth="${gitlab}/truth-magnetosphere"
#export scripts_truth="${truth}/scripts"
export          SpWx="${gitlab}/SpWx"

# #  S P A C K
alias    goSPack="echo 'cd ${local_spack}'; cd ${local_spack}; pwd"
alias reap-spack="echo 'source ${repo_scripts_spack}/reaper/test-reaper.sh'; source ${repo_scripts_spack}/reaper/test-reaper.sh"
