#! /usr/bin/env bash
printf "%s\n" "$(date), $(tput bold)${BASH_SOURCE[0]}$(tput sgr0)"

# If you want to use any of the CDF command-line utilitites (e.g. cdfedit,
# cdfexport, etc.), we strongly encourage you to set the CDF environment
# variables defined in the CDF definition files.  Once the environment variables
# defined, you can invoke the CDF utility of interest just by typing the utility
# name. Otherwise, you'll have to specify the full path of the utility.
#
# If you use TCSH or CSH, run the following command:
#
#     source /home/dantopa/apps/cdf-3.8.0/bin/definitions.C
#
#
# If you use BASH or BSH, run the following command:
#
#     . /home/dantopa/apps/cdf-3.8.0/bin/definitions.B
#
#
# If you use KSH, run the following command:
#
#     . /home/dantopa/apps/cdf-3.8.0/bin/definitions.K

source ${HOME}/apps/cdf-3.8.0/bin/definitions.B
export CDF_LIB="${HOME}/apps/cdf-3.8.0/lib"
