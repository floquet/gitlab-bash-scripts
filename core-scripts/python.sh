#! /usr/bin/env bash
printf "%s\n" "$(date), $(tput bold)${BASH_SOURCE[0]}$(tput sgr0)"

export dirPyVirtualEnv="${HOME}/scratch/python-virtual-environments"
mkdir -p ${dirPyVirtualEnv}

export dirPyTruth="${dirPyVirtualEnv}/truth"
alias goVirtual="echo 'python -m venv ${dirPyTruth}' ; python -m venv ${dirPyTruth}"
alias vactivate="echo 'source ${dirPyTruth}/bin/activate' ; source ${dirPyTruth}/bin/activate"
