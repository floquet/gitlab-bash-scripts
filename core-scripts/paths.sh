#!/bin/sh
printf '%s\n' "$(date), $(tput bold)${BASH_SOURCE[0]}$(tput sgr0)"

# #  B I T B U C K E T
export   config_repo="${bitbucket}/mac-configurations"
export        stools="${bitbucket}/spack-tools"

alias goSpackTools="echo 'cd ${stools}'; cd ${stools}; pwd"

# #  G I T H U B
export          repo_build="${github}/builds"
export repo_results_docker="${repo_build}/results-docker"
export  repo_results_spack="${repo_build}/results-spack"
export repo_scripts_docker="${repo_build}/scripts-docker"
export  repo_scripts_spack="${repo_build}/scripts-spack"

export dir_docker_logger="${repo_results_docker}/docker-logger"
export file_docker_log="${dir_docker_logger}/docker-log.txt"

export         dcker="${github}/docker/unified"
export         astra="${github}/astra-spack-mirror"

alias goAstra="echo 'cd ${astra}'; cd ${astra}; pwd"

alias goResultsDocker="echo 'cd ${repo_results_docker}'; cd ${srepo_results_dockertools}; pwd"
alias goScriptsDocker="echo 'cd ${repo_scripts_docker}'; cd ${repo_scripts_docker};       pwd"
alias  goResultsSpack="echo 'cd ${repo_results_spack}';  cd ${repo_results_spack};        pwd"
alias  goScriptsSpack="echo 'cd ${repo_scripts_spack}';  cd ${repo_scripts_spack};        pwd"

# #  S P A C K
alias    goSPack="echo 'cd ${local_spack}'; cd ${local_spack}; pwd"
alias reap-spack="echo 'source ${repo_scripts_spack}/reaper/test-reaper.sh'; source ${repo_scripts_spack}/reaper/test-reaper.sh"

# #  C O N S T R U T O R S
export dir_config="${machine}-(${moniker})/${os}/${dist}-${release}"
