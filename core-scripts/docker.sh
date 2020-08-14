#! /bin/bash
printf '%s\n' "$(date), $(tput bold)${BASH_SOURCE[0]}$(tput sgr0)"

alias dimage="echo 'docker images'; docker images"

function quaxolotl(){
    echo "docker run -it -v /Volumes/Chaac:/Chaac -v /Volumes/Opochtli:/Opochtli -v /Users/dantopa/Dropbox:/Dropbox ${1}"
          docker run -it -v /Volumes/Chaac:/Chaac -v /Volumes/Opochtli:/Opochtli -v /Users/dantopa/Dropbox:/Dropbox ${1}
}

function xiuhcoatl(){
    echo "docker run -it -v /Volumes/Tlaloc:/Tlaloc -v /Volumes/Ometecuhtli:/Ometecuhtli -v /Users/dantopa/Dropbox:/Dropbox -v /Users/dantopa/repos:/repos ${1}"
          docker run -it -v /Volumes/Tlaloc:/Tlaloc -v /Volumes/Ometecuhtli:/Ometecuhtli -v /Users/dantopa/Dropbox:/Dropbox -v /Users/dantopa/repos:/repos ${1}
}
