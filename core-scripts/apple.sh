#! /usr/bin/env bash
printf "%s\n" "$(date), $(tput bold)${BASH_SOURCE[0]}$(tput sgr0)"

alias another_mathematica='open -n /Volumes/Macintosh\ HD/Applications/Wolfram/Mathematica\ 11.3.0.0.app'  # launch second kernel
alias backup_mathematica="echo 'rsync -au --progress --exclude=".*" ${HOME}/Mathematica_files/nb/ /Volumes/atacama/nb/' ; rsync -au --progress --exclude=".*" ${HOME}/Mathematica_files/nb/ /Volumes/atacama/nb/"

function profiler_tasker(){
    #write_apple_profiler ${configuration}/${1}
    write_apple_profiler        ${locker}/${1}
}
function write_apple_profiler (){
    write_standard_header "mac profile"          ${1}
    echo "system_profiler SPSoftwareDataType" >> ${1}
    system_profiler SPSoftwareDataType        >> ${1}
    echo ""                                   >> ${1}
    echo "sysctl -a:"                         >> ${1}
    sysctl -a                                 >> ${1}
}

profiler_tasker apple-profiler.txt

# WARNING: The locate database (/var/db/locate.database) does not exist.
# To create the database, run the following command:

#  sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.locate.plist

# http://osxdaily.com/2011/11/02/enable-and-use-the-locate-command-in-the-mac-os-x-terminal/
# Alternatively you can also run the following command and build the database:

# sudo /usr/libexec/locate.updatedb

alias show_hidden="echo 'defaults write com.apple.finder AppleShowAllFiles YES'; echo 'restart finder'; defaults write com.apple.finder AppleShowAllFiles YES"
alias contents_apple='echo "ALIAS another_mathematica"; echo "write system_profile and sysctl to \${my_log} = ${my_log}"'
