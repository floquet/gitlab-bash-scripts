#! /bin/bash
printf '%s\n' "$(date), $(tput bold)${BASH_SOURCE[0]}$(tput sgr0)"

alias ml="module list"
alias ma="module available"

# alias maa="module -t --redirect avail | grep ${1}"

# dump available modules in a file
export my_log="${locker}/modules-available.txt"
write_standard_header "modules available" "${my_log}"
module available          >> ${my_log} 2>&1  &

# dump loaded modules in a file
export my_log="${locker}/modules-list.txt"
write_standard_header "module list" "${my_log}"
module list        >> ${my_log}  2>&1  &
