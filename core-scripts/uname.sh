#! /bin/bash
printf '%s\n' "$(date), $(tput bold)${BASH_SOURCE[0]}$(tput sgr0)"

export my_log="${configuration}/uname-variables.txt"
write_standard_header "uname variables"            "${my_log}"
echo "-m   machine hardware name:               $(uname -m)"   >> ${my_log}
echo "-n   network node hostname:               $(uname -n)"   >> ${my_log}
# echo "-i   hardware platform:     $(uname -i)"   >> ${my_log}
echo "-p   machine processor architecture name: $(uname -p)"   >> ${my_log}
echo "-r   operating system release:            $(uname -r)"   >> ${my_log}
echo "-s   operating system name:               $(uname -s)"   >> ${my_log}
echo "-v   operating system version:            $(uname -v)"   >> ${my_log}
# echo "-svr kernel name:           $(uname -svr)" >> ${my_log}
echo ""                                          >> ${my_log}
echo "uname -a:"                                 >> ${my_log}
uname -a                                         >> ${my_log}
echo ""                                          >> ${my_log}
echo "\${BASH_SOURCE[0]} = ${BASH_SOURCE[0]}"    >> ${my_log}

# UNAME(1)                                                          General Commands Manual                                                         UNAME(1)
#
# NAME
#      uname – Print operating system name
#
# SYNOPSIS
#      uname [-amnprsv]
#
# DESCRIPTION
#      The uname utility writes symbols representing one or more system characteristics to the standard output.
#
#      The following options are available:
#
#      -a      Behave as though all of the options -mnrsv were specified.
#
#      -m      print the machine hardware name.
#
#      -n      print the nodename (the nodename may be a name that the system is known by to a communications network).
#
#      -p      print the machine processor architecture name.
#
#      -r      print the operating system release.
#
#      -s      print the operating system name.
#
#      -v      print the operating system version.
#
#      If no options are specified, uname prints the operating system name as if the -s option had been specified.
#
# SEE ALSO
#      hostname(1), machine(1), sw_vers(1), uname(3)
#
# STANDARDS
#      The uname utility conforms to IEEE Std 1003.2-1992 (“POSIX.2”).  The -p option is an extension to the standard.
#
# macOS 12.1                                                           November 9, 1998                                                           macOS 12.1
# (END)
#
