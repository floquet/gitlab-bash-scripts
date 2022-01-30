#! /usr/bin/env bash
printf "%s\n" "$(date), $(tput bold)${BASH_SOURCE[0]}$(tput sgr0)"

export    u_Tlaltecuhtli="/Volumes/Tlaltecuhtli/"
export u_Huitzilopochtli="/Volumes/Huitzilopochtli/"

export        u_Chaac="/Volumes/Chaac/"
export       u_Tlaloc="/Volumes/Tlaloc/"
export     u_Opochtli="/Volumes/Opochtli/"
export  u_Ometecuhtli="/Volumes/Ometecuhtli/"
export u_Xochiquetzal="/Volumes/Xochiquetzal/"

export    u_Infernum="/Volumes/Infernum/"
export   u_Paradisum="/Volumes/Paradisum/"
export u_Purgatorium="/Volumes/Purgatorium/"

export u_t7="/Volumes/T7-Touch/"
alias  got7="cd ${u_t7}; pwd"

alias    goTlaltecuhtli="cd ${u_Tlaltecuhtli};    pwd"
alias goHuitzilopochtli="cd ${u_Huitzilopochtli}; pwd"

alias        goChaac="cd ${u_Chaac};        pwd"
alias       goTlaloc="cd ${u_Tlaloc};       pwd"
alias     goOpochtli="cd ${u_Opochtli};     pwd"
alias  goOmetecuhtli="cd ${u_Ometecuhtli};  pwd"
alias goXochiquetzal="cd ${u_Xochiquetzal}; pwd"

alias    goInfernum="cd ${u_Infernum};    pwd"
alias   goParadisum="cd ${u_Paradisum};   pwd"
alias goPurgatorium="cd ${u_Purgatorium}; pwd"
