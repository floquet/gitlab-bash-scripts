#! /usr/bin/env bash

# Script generated on: $(date)
# This script defines aliases for navigating directories and managing tasks.
# To use a symlink for navigation, ensure you create the symlink correctly.
# Example: ln -s /Users/dantopa/repos-xiuhcoatl/github ~/GitHub
# Example: ln -s /Users/dantopa/repos-xiuhcoatl/bitbucket ~/Bitbucket

# Print script start information
printf "%s\n" "$(date), $(tput bold)${BASH_SOURCE[0]}$(tput sgr0)"

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
    echo "\n# Script Routines and Actions" >> "$alias_file"
    declare -F | awk '{print "Function: " $NF}' >> "$alias_file"
    alias | awk '{print "Alias: " $0}' >> "$alias_file"
}

# Function to write alias assignments with a standard header
function write_alias_assignments() {
    write_standard_header "alias assignments" "$1"
    echo "alias:" >> "$1"
    alias >> "$1"
}

# Alias for deleting log files
alias del-log='find . -name "*.log" -type f -delete'

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

# Generate directory navigation aliases for the given structure
function generate_navigation_aliases() {
    # Define base directories for alias generation
    local github_dirs=(
        "achates"
        "f"
        "gitlab-bash-scripts"
        "jop"
        "phoenix"
        "sharing"
        "sharing copy"
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

    # Additional top-level navigation aliases
    alias gogithub="cd ~/GitHub"
    alias gobitbucket="cd ~/Bitbucket"
}

# Generate navigation aliases
generate_navigation_aliases

# Example alias for printing alias commands to a log
alias contents_alias='echo "write list of alias commands to \${my_log} = ${my_log}"'

# Execute alias_tasker with provided arguments
alias_tasker "alias-assignments"
