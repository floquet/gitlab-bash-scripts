#!/usr/bin/env bash
printf "%s\n" "$(date), Running ${BASH_SOURCE[0]}"

# sym.sh - Script to manage symbolic links for environment setup

# Create a symbolic link for the GitHub directory
ln -sf "${HOME}/repos-xiuhcoatl/github" "${HOME}/GitHub"
ln -sf "${HOME}/repos-xiuhcoatl/bitbucket" "${HOME}/Bitbucket"
ln -sf "${HOME}/Library/CloudStorage/GoogleDrive-dantopa@gmail.com" "${HOME}/Google Drive"
ln -sf "${HOME}/Dropbox/_mm" "${HOME}/Mathematica_files"
ln -sf "${HOME}/github/genesis" "${HOME}/genesis"

# Display symbolic links in the home directory
ls -l "${HOME}" | grep "->"

echo "Symbolic link setup complete."

