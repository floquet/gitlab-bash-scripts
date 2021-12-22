#! /bin/bash
printf '%s\n' "$(date), $(tput bold)${BASH_SOURCE[0]}$(tput sgr0)"

export dirHere=$(pwd)
# git pull
git add -A .
git commit -m "${moniker}-${dist}-${release} $(date)"
# git push

cd ${dirHere}
