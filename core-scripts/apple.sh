#!/usr/bin/env bash
printf "%s\n" "$(date), $(tput bold)${BASH_SOURCE[0]}$(tput sgr0)"

#alias another_mathematica='open -n /Volumes/Macintosh\ HD/Applications/Wolfram/Mathematica\ 13.0.0.app'  # launch second kernel
alias another_mathematica='open -n /Volumes/Macintosh\ HD/Applications/Mathematica.app'  # launch second kernel
alias backup_mathematica="echo 'rsync -au --progress --exclude=".*" ${HOME}/Mathematica_files/nb/ /Volumes/atacama/nb/' ; rsync -au --progress --exclude=".*" ${HOME}/Mathematica_files/nb/ /Volumes/atacama/nb/"
alias mm_backup="rsync -au --progress --exclude=".*" ${HOME}/Mathematica_files/nb/. ${github}/experiment-mathematica/nb/."
#alias mm_backup="rsync -au --progress --exclude=".*" ${HOME}/Mathematica_files/. ${github}/experiment-mathematica/."

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

# ** M A C O S   S Y S T E M   D E T A I L S **
# Extract macOS version, codename, and Darwin kernel version

os_version=$(sw_vers -productVersion)       # macOS version (e.g., 15.1.1)
kernel_version=$(uname -r)                  # Darwin kernel version

# Extract macOS codename dynamically using the AWK trick
os_codename=$(awk '/SOFTWARE LICENSE AGREEMENT FOR macOS/ { 
    match($0, /macOS [A-Za-z]+/); 
    if (RSTART) print substr($0, RSTART+6, RLENGTH-6) 
}' "/System/Library/CoreServices/Setup Assistant.app/Contents/Resources/en.lproj/OSXSoftwareLicense.rtf")

# Export macOS system details
export os="darwin-${kernel_version}"        # Kernel version with Darwin prefix
export dist="${os_codename}"                # macOS codename (e.g., Sequoia)
export release="${os_version}"              # macOS version
export build=$(sw_vers -buildVersion)       # macOS build number

# Print the macOS system details as confirmation
printf "macOS %s %s, Darwin %s\n" "$dist" "$release" "$kernel_version"

