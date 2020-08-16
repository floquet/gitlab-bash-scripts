#! /bin/bash
printf '%s\n' "$(date), $(tput bold)${BASH_SOURCE[0]}$(tput sgr0)"

<<<<<<< HEAD
export dirDockerLocker="${ddocker}"
=======
alias dimage="echo 'docker images'; docker images"
>>>>>>> fb359f8e13528df8eea7910b47971bd7a9a5970b

function quaxolotl(){
    echo "docker run -it -v /Volumes/Chaac:/Chaac -v /Volumes/Opochtli:/Opochtli ${1}"
          docker run -it -v /Volumes/Chaac:/Chaac -v /Volumes/Opochtli:/Opochtli ${1}
}

function xiuhcoatl(){
    echo "docker run -it -v /Users/dantopa/Dropbox:/Dropbox -v /Volumes/Metztli:/Metztli -v /Volumes/Tlaloc:/Tlaloc ${1}"
          docker run -it -v /Users/dantopa/Dropbox:/Dropbox -v /Volumes/Metztli:/Metztli -v /Volumes/Tlaloc:/Tlaloc ${1}
}
