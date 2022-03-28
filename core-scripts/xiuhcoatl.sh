#! /usr/bin/env bash
printf "%s\n" "$(date), $(tput bold)${BASH_SOURCE[0]}$(tput sgr0)"

alias backupFrom="export backup_from='${HOME}/Mathematica_files/nb/' ; echo 'backup from ${backup_from}'"
alias   backupTo="export backup_to='/Volumes/mathematica/vault-xiuhcoatl-nb' ; echo 'backup to ${backup_to}'"

alias backup_mathematica='backupFrom ; backupTo ; rsync -au --progress --exclude=".*" ${backup_from} ${backup_to}'