#! /bin/bash
printf '%s\n' "$(date), $(tput bold)${BASH_SOURCE[0]}$(tput sgr0)"

# export partition=`env | grep SLURM_JOB_PARTITION | awk -F'=' '{print $2}'`
# if [ -z ${partition} ]
#     then
#         export partition="log.in"
# fi

export node_name=`echo $(uname -n) | awk -F'.' '{print $1}'` # pn1249300.lanl.gov -> pn1249300
export    whoami="${host_name}, node ${node_name}"
export    prefix="${host_name}-${partition}-${node_name}"

# # node-queries
export   ego="${node_queries}/${host_name}"
export    id="${ego}/${partition}-${node_name}"  # ccscs/ccscs2
export vault="${id}/dir-configuration"

alias show_names="echo '\${host_name} = ${host_name}'; echo '\${partition} = ${partition}'; echo '\${node_name} = ${node_name}'; echo '\${prefix}    = ${prefix}'; echo '\${ego}       = ${ego}'; echo '\${id}        = ${id}'; echo '\${vault}     = ${vault}'"

echo "attempting to mkdir ${vault}"
mkdir -p ${vault}

# # Kerberos
export moniker="dantopa"
export me="${moniker}@lanl.gov"   # for scp and such

alias k="echo 'kinit -f ${me}';kinit -f ${me}"  # forward ticket

# # S S H
export myssh="ssh -l ${moniker} -XY"   # forward X11

# # Yellow network
alias  trinititey="echo '${myssh} tt-fey.lanl.gov';${myssh} tt-fey.lanl.gov"

alias      darwin="echo '${myssh} darwin-fe.lanl.gov';${myssh} darwin-fe.lanl.gov"
alias     capulin="echo '${myssh} cp-fey.lanl.gov';${myssh} cp-fey.lanl.gov"
alias          ga="echo '${myssh} ga-fey';${myssh} ga-fey"
alias          ml="echo '${myssh} ml-fey';${myssh} ml-fey"
alias  moonlighty="echo '${myssh} ml-fey';${myssh} ml-fey"
alias moonlighty1="echo '${myssh} ml-fey1';${myssh} ml-fey1"
alias moonlighty2="echo '${myssh} ml-fey2';${myssh} ml-fey2"
alias          pi="echo '${myssh} pi-fey';${myssh} pi-fey"
alias      pintoy="echo '${myssh} pi-fey';${myssh} pi-fey"
alias          sn="echo '${myssh} sn-fey';${myssh} sn-fey"
alias       snowy="echo '${myssh} sn-fey';${myssh} sn-fey"
alias      snowy1="echo '${myssh} sn-fey1';${myssh} sn-fey1"
alias      snowy2="echo '${myssh} sn-fey2';${myssh} sn-fey2"
alias          wf="echo '${myssh} wf-fey';${myssh} wf-fey"
alias       wolfy="echo '${myssh} wf-fey';${myssh} wf-fey"
alias      wolfy1="echo '${myssh} wf-fey1';${myssh} wf-fey1"
alias      wolfy2="echo '${myssh} wf-fey2';${myssh} wf-fey2"

# # S E R V E R S
alias         cc2="${myssh} ccscs2"
alias         cc3="${myssh} ccscs3"
alias         cc4="${myssh} ccscs4"
alias         cc5="${myssh} ccscs5"
alias         cc6="${myssh} ccscs6"
alias         cc7="${myssh} ccscs7"
alias         cc8="${myssh} ccscs8"

alias         cctc="${myssh} ccs-tc"

# alias pet2="${myssh} petaca2" # sudo privledges
# alias pet3="${myssh} petaca3" # sudo privledges

# scp -r llvm* $now
# dantopa@lanl.gov@ml-fey1:spack.mirror/.

printf '%s\n' "directory of core scripts = \${core} = ${core}"
