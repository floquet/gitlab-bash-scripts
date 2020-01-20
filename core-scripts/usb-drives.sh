#!/bin/zsh
printf '%s\n' "$(date) $(tput bold)${(%):-%N}$(tput sgr0)"

export    u_Tlaltecuhtli="/Volumes/Tlaltecuhtli/"
export u_Huitzilopochtli="/Volumes/Huitzilopochtli/"

export    u_Infernum="/Volumes/Infernum/"
export   u_Paradisum="/Volumes/Paradisum/"
export u_Purgatorium="/Volumes/Purgatorium/"

alias    goTlaltecuhtli="cd ${u_Tlaltecuhtli};    pwd"
alias goHuitzilopochtli="cd ${u_Huitzilopochtli}; pwd"

alias    goInfernum="cd ${u_Infernum};    pwd"
alias   goParadisum="cd ${u_Paradisum};   pwd"
alias goPurgatorium="cd ${u_Purgatorium}; pwd"

#alias contents_usb_drives='echo "ALIAS public_key"'
