#! /bin/bash
printf '%s\n' "$(date), $(tput bold)${BASH_SOURCE[0]}$(tput sgr0)"

alias bye="echo 'lsb_release -a; exit'; lsb_release -a; exit"
alias dimage="echo 'docker images'; docker images"

export dirDockerLocker="${ddocker}"
export dirDropbox="/Dropbox/2nd-generation/spacktivity/new-mirror"
alias   mirrorDropbox="echo 'spack mirror add local_filesystem file://${dirDropbox}';spack mirror add local_filesystem file://${dirDropbox}"
alias mirrorXiuhcoatl="echo 'spack mirror add local_filesystem file://${HOME}${dirDropbox}'; spack mirror add local_filesystem file://${HOME}${dirDropbox}"
alias mirrorQuaxolotl="echo 'spack mirror add local_filesystem file:///Chaac/cloud${dirDropbox}'; spack mirror add local_filesystem file:///Chaac/cloud${dirDropbox}"

#alias reap="${rgaddr}/repos/bitbucket/spack_tools/scripts/reaper.bash"
alias reap="echo '${rgaddr}/repos/bitbucket/spack_tools/scripts/reaper.bash; git -C ${stools} commit -m ''test'''; ${rgaddr}/repos/bitbucket/spack_tools/scripts/reaper.bash; git -C ${stools} commit -m ''test''"

function quaxolotl(){
    echo "docker run -it -v /Volumes/Chaac:/Chaac -v /Volumes/Opochtli:/Opochtli ${1}"
          docker run -it -v /Volumes/Chaac:/Chaac -v /Volumes/Opochtli:/Opochtli ${1}
}

function quaxolotlx(){
    echo "docker run -it -v /Volumes/Chaac:/Chaac ${1}"
          docker run -it -v /Volumes/Chaac:/Chaac ${1}
}

function xiuhcoatl(){
    echo "docker run -it -v /Users/dantopa/Dropbox:/Dropbox -v /Volumes/Metztli:/Metztli -v /Volumes/Ometecuhtli:/Ometecuhtli -v /Volumes/Tlaloc:/Tlaloc ${1}"
          docker run -it -v /Users/dantopa/Dropbox:/Dropbox -v /Volumes/Metztli:/Metztli -v /Volumes/Ometecuhtli:/Ometecuhtli -v /Volumes/Tlaloc:/Tlaloc ${1}
}
