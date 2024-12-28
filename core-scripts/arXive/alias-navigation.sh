#! /usr/bin/env bash

# Script generated on: Sat Dec 14 17:00:39 MST 2024
# aliases for navigating repositories.
# Relies on symlink for navigation, e.g..
# Example: ln -s /Users/dantopa/repos-xiuhcoatl/github ~/GitHub
# Example: ln -s /Users/dantopa/repos-xiuhcoatl/bitbucket ~/Bitbucket

# Print script start information
printf "%s\n" "$(date), $(tput bold)${BASH_SOURCE[0]}$(tput sgr0)"

# Generate navigation aliases
function generate_navigation_aliases() {
    # Define GitHub and Bitbucket directories
    local github_dirs=("achates" "f" "gitlab-bash-scripts" "jop" "phoenix" "sharing" "vault-fortran" "vault-latex")
    local bitbucket_dirs=("articles" "books-ams" "books-cup" "books-other" "books-springer" "mac-configurations" "oeuvre" "presentations")

    # Create GitHub aliases
    for dir in "${github_dirs[@]}"; do
        alias "go${dir}"="cd ~/GitHub/$dir"
    done

    # Create Bitbucket aliases
    for dir in "${bitbucket_dirs[@]}"; do
        alias "go${dir//-/_}"="cd ~/Bitbucket/$dir"
    done

    # Top-level aliases
    alias gogithub="cd ~/GitHub"
    alias gobitbucket="cd ~/Bitbucket"
}

# Execute navigation alias generation
generate_navigation_aliases
