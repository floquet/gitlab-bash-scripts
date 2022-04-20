#! /usr/bin/env bash
printf "%s\n" "$(date), $(tput bold)${BASH_SOURCE[0]}$(tput sgr0)"

# rsync -uan  --progress --exclude=".git" . /Volumes/T7-Touch/repos/bitbucket/x-vault-projects/
