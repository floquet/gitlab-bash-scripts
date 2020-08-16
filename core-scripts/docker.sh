#! /bin/bash
printf '%s\n' "$(date), $(tput bold)${BASH_SOURCE[0]}$(tput sgr0)"

alias dimage="echo 'docker images'; docker images"
export dirDockerLocker="${ddocker}"

function quaxolotl(){
    echo "docker run -it -v /Volumes/Chaac:/Chaac -v /Volumes/Opochtli:/Opochtli ${1}"
          docker run -it -v /Volumes/Chaac:/Chaac -v /Volumes/Opochtli:/Opochtli ${1}
}

function xiuhcoatl(){
    echo "docker run -it -v /Users/dantopa/Dropbox:/Dropbox -v /Volumes/Metztli:/Metztli -v /Volumes/Ometecuhtli:/Ometecuhtli -v /Volumes/Tlaloc:/Tlaloc ${1}"
          docker run -it -v /Users/dantopa/Dropbox:/Dropbox -v /Volumes/Metztli:/Metztli -v /Volumes/Ometecuhtli:/Ometecuhtli -v /Volumes/Tlaloc:/Tlaloc ${1}
}
