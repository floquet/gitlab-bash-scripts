#! /bin/bash
printf '%s\n' "$(date), $(tput bold)${BASH_SOURCE[0]}$(tput sgr0)"

function alias_tasker(){
    write_alias_assignments ${configuration}/${1}
    write_alias_assignments        ${locker}/${1}
}
function write_alias_assignments (){
    write_standard_header "alias assignments"    ${1}
    echo "alias:"                             >> ${1}
    alias                                     >> ${1}
}

alias_tasker "alias-assignments.txt"

alias contents_alias='echo "write list of alias commands to \${my_log} = ${my_log}"'
