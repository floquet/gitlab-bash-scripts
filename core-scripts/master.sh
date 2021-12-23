#! /bin/bash
printf '%s\n' "$(date), $(tput bold)${BASH_SOURCE[0]}$(tput sgr0)"

# run first - slowest script
source "${core}/info.sh"

# # S C R I P T S
source "${core}/gcc.sh"
source "${core}/git.sh"
source "${core}/ssh.sh"
source "${core}/vim.sh"
source "${core}/make.sh"
source "${core}/bash.sh"
source "${core}/finds.sh"
source "${core}/cmake.sh"
source "${core}/docker.sh"
source "${core}/copy-configuration.sh"  &

source "${core}/c.sh"
source "${core}/fortran.sh"
source "${core}/bookmarks.sh"

# information routines
source "${core}/disk.sh"
source "${core}/info.sh"
source "${core}/uname.sh"               &
source "${core}/spack.sh"
# source "${core}/lstopo.sh"              &
source "${core}/alias.sh"
source "${core}/prompt.sh"
source "${core}/modules.sh"
source "${core}/environment.sh"

wait

echo "commiting configuration copy (e.g. ${bash_file}) to ${bitbucket}/initialization-scripts..."
export spot=$(pwd)
export ymd=$(date +%Y-%m-%d-%H-%M) # timestamp results
cd ${bitbucket}/initialization-scripts
git add -A .
git commit -m "${moniker} ${dist}-${release} /initialization ${ymd}"
cd ${spot}
