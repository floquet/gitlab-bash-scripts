#! /usr/bin/env bash
printf "%s\n" "$(date), $(tput bold)${BASH_SOURCE[0]}$(tput sgr0)"

export dirPyVirtualEnv="${HOME}/scratch/python-virtual-environments"
mkdir -p ${dirPyVirtualEnv}

export dirPyTruth="${dirPyVirtualEnv}/truth"


