#!/usr/bin/env bash
printf "%s\n" "$(date), $(tput bold)${BASH_SOURCE[0]}$(tput sgr0)"

# alias.sh
#if [ "${ALIAS_SH_LOADED:-0}" -eq 1 ]; then
#    echo "alias.sh already loaded"
#    return
#fi
#export ALIAS_SH_LOADED=1

# Log the sourcing for debugging
echo "alias.sh sourced by ${BASH_SOURCE[1]} at $(date)" >> ~/alias_debug.log

# Script generated on: Wed Dec 25 18:13:21 MST 2024
# This script defines aliases for navigating directories and managing tasks.
# To use a symlink for navigation, ensure you create the symlink correctly.
# Example: ln -s /Users/dantopa/repos-xiuhcoatl/github ~/GitHub
# Example: ln -s /Users/dantopa/repos-xiuhcoatl/bitbucket ~/Bitbucket

echo "Defining alias_tasker function..."

# Function to write alias assignments to a file
function alias_tasker() {
    # Verify that locker and alias file are properly defined
    if [ -z "$locker" ]; then
        echo "Error: locker variable is not set. Please define it before running this script."
        return 1
    fi

    local alias_file="$locker/$1"

    # Ensure target directory exists
    mkdir -p "$(dirname "$alias_file")"

    # Calls write_alias_assignments for a given file
    write_alias_assignments "$alias_file"

    # List all functions and aliases in the script
    {
        echo "\n# Script Routines and Actions"
        declare -F | awk '{print "Function: " $NF}'
        alias | awk '{print "Alias: " $0}'
    } >> "$alias_file"
}
echo "Defining write_alias_assignments function..."

# Function to write alias assignments with a standard header
function write_alias_assignments() {
    write_standard_header "alias assignments" "$1"
    echo "alias:" >> "$1"
    alias >> "$1"
}

# Alias for deleting log files
alias del-log='find . -name "*.log" -type f -delete'
echo "Defining grep-related functions..."

# Grep on specific file types
function g-tex() {
    echo "grep -inr --include=*.tex {$1}"
    grep -inr --include=*.tex "$1"
}

function g-fortran() {
    echo "grep -inr --include=*.f08 {$1}"
    grep -inr --include=*.f08 "$1"
}

function g-general() {
    echo "grep -inr --include=*.f* {$1}"
    grep -inr --include=*.f* "$1"
}
echo "Defining generate_navigation_aliases function..."

# Generate directory navigation aliases for the given structure
function generate_navigation_aliases() {
    # Define base directories for alias generation
    local github_dirs=(
        "achates"
        "f"
        "genesis"
        "gitlab-bash-scripts"
        "jop"
        "phoenix"
        "sharing"
        "vault-fortran"
        "vault-latex"
    )

    local bitbucket_dirs=(
        "articles"
        "books-ams"
        "books-cup"
        "books-other"
        "books-springer"
        "mac-configurations"
        "oeuvre"
        "presentations"
        "strange"
    )

    # Create GitHub navigation aliases
    for dir in "${github_dirs[@]}"; do
        alias_name="go${dir}"  # Simple alias name based on directory
        alias "$alias_name"="cd ~/GitHub/$dir"
    done

    # Create Bitbucket navigation aliases
    for dir in "${bitbucket_dirs[@]}"; do
        alias_name="go${dir//-/_}"  # Replace hyphens with underscores for alias names
        alias "$alias_name"="cd ~/Bitbucket/$dir"
    done

    # Define alias for new-presentation
    #alias new-presentation='$HOME/genesis/scripts/new-presentation.sh'

    # Define alias for new-presentation
    # he $HOME variable is correctly expanded in both single (') and double (") quotes. However, using double quotes ensures that any further expansion or substitution within the command will work correctly.
    # By prefixing the command with bash, you ensure the script runs in the Bash shell regardless of the user's default shell
    alias new-presentation="bash $HOME/genesis/scripts/new-presentation.sh"

    # Additional top-level navigation aliases
    alias gogithub="cd ~/GitHub"
    alias gobitbucket="cd ~/Bitbucket"
}
echo "Generating navigation aliases..."

# Generate navigation aliases
generate_navigation_aliases

# Define alias for new-presentation
alias new-pres='$HOME/genesis/scripts/new-pres.sh'
alias new-docs='$HOME/genesis/scripts/new-docs.sh'

# Example alias for printing alias commands to a log
alias contents_alias='echo "write list of alias commands to \${my_log} = ${my_log}"'

# Ensure locker variable is initialized for alias_tasker
locker="${locker:-$HOME/.alias_logs}"
echo "end of alias.sh"


