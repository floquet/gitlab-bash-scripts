#! /bin/bash
printf "%s\n" "$(date), $(tput bold)${BASH_SOURCE[0]}$(tput sgr0)"

alias bye="echo 'uname -n ; lsb_release -a; exit'; uname -n; lsb_release -a; exit"
# https://superuser.com/questions/121627/how-to-get-elements-from-list-in-bash/121628
alias session="echo $(uname -a) | cut -d' ' -f2"
alias boo="list=$(uname -a); set -- list"
alias dimage="echo 'docker images'; docker images"

export centos_version="7.9.2009"
export dirDockerLocker="${ddocker}"
export dirDropbox="${repo}/spacktivity/mirror"
export file_docker_log="${repo_results_docker}/vm-log-book.txt"
alias mirrorBigSpackMirror="echo 'spack mirror add local_filesystem file://${big_spack_mirror}';spack mirror add local_filesystem file://${big_spack_mirror}"

#alias reap="${rgaddr}/repos/bitbucket/spack_tools/scripts/reaper.bash"
#alias reap="echo '${rgaddr}/repos/bitbucket/spack_tools/scripts/reaper.bash; git -C ${stools} commit -m ''test'''; ${rgaddr}/repos/bitbucket/spack_tools/scripts/reaper.bash; git -C ${stools} commit -m ''test''"
#export generics="${ddocker}/unified/generics/"

function xiuhcoatlDocker(){
# myDocker ubuntu:22.04
    echo "docker run -it -v /Users/dantopa/Dropbox:/Dropbox -v /Volumes/Metztli:/Metztli -v /Volumes/Infernum:/Infernum -v /Volumes/Paradisum:/Paradisum -v /Volumes/Purgatorium:/Purgatorium -v /Volumes/atacama:/atacama -v /Volumes/gobi:/gobi -v /Volumes/sonoran:/sonoran -v /Volumes/repos:/repos -v /Volumes/spacktivity:/spacktivity ${1}"
    docker run -it \
 -v /Users/dantopa/Dropbox:/Dropbox \
 -v /Volumes/Metztli:/Metztli \
 -v /Volumes/Infernum:/Infernum  \
 -v /Volumes/Paradisum:/Paradisum  \
 -v /Volumes/Purgatorium:/Purgatorium  \
 -v /Volumes/atacama:/atacama  \
 -v /Volumes/gobi:/gobi  \
 -v /Volumes/sonoran:/sonoran  \
 -v /Volumes/repos:/repos  \
 -v /Volumes/spacktivity:/spacktivity  ${1}
}

function xiuhcoatlDockerTime {
# myDocker ubuntu:22.04
    echo "docker run -it -v /etc/localtime:/etc/localtime -v /Users/dantopa/Dropbox:/Dropbox -v /Volumes/Metztli:/Metztli -v /Volumes/Infernum:/Infernum -v /Volumes/Paradisum:/Paradisum -v /Volumes/Purgatorium:/Purgatorium -v /Volumes/atacama:/atacama -v /Volumes/gobi:/gobi -v /Volumes/sonoran:/sonoran -v /Volumes/repos:/repos -v /Volumes/spacktivity:/spacktivity ${1}"
    docker run -it                     \
 -v /etc/localtime:/etc/localtime       \
 -v /Users/dantopa/Dropbox:/Dropbox    \
 -v /Volumes/Metztli:/Metztli          \
 -v /Volumes/Infernum:/Infernum        \
 -v /Volumes/Paradisum:/Paradisum      \
 -v /Volumes/Purgatorium:/Purgatorium  \
 -v /Volumes/atacama:/atacama          \
 -v /Volumes/gobi:/gobi                \
 -v /Volumes/sonoran:/sonoran          \
 -v /Volumes/repos:/repos              \
 -v /Volumes/spacktivity:/spacktivity  ${1}
}

function quaxolotlDocker(){
# volume_ext set in .quaxolotl.sh as /Volumes/T7-Touch
    echo "docker run -it -v ${volume_ext}/Dropbox:/Dropbox -v ${volume_ext}/repos:/repos -v ${volume_ext}/spacktivity:/spacktivity ${1}"
    docker run -it \
 -v ${volume_ext}/Dropbox:/Dropbox \
 -v ${volume_ext}/repos:/repos  \
 -v ${volume_ext}/spacktivity:/spacktivity  ${1}
}

function quaxolotlDockerTime(){
# volume_ext set in .quaxolotl.sh as /Volumes/T7-Touch
    echo "docker run -it -v /etc/localtime:/etc/localtime -v ${volume_ext}/Dropbox:/Dropbox -v ${volume_ext}/repos:/repos -v ${volume_ext}/spacktivity:/spacktivity ${1}"
    docker run -it \
 -v /etc/localtime:/etc/localtime   \
 -v ${volume_ext}/Dropbox:/Dropbox \
 -v ${volume_ext}/repos:/repos     \
 -v ${volume_ext}/spacktivity:/spacktivity  ${1}
}

function ehecoatlDockerTime(){
# volume_ext set in .quaxolotl.sh as /Volumes/T7-Touch
    echo "docker run -it -v /etc/localtime:/etc/localtime -v ${HOME}/Dropbox:/Dropbox -v ${volume_ext}/repos:/repos -v ${volume_ext}/spacktivity:/spacktivity ${1}"
    docker run -it \
 -v /etc/localtime:/etc/localtime         \
 -v ${HOME}/Dropbox:/Dropbox              \
 -v /Users/${USER}:/${USER}               \
 -v ${volume_ext}/repos:/Tlaloc-repos     \
 -v ${volume_ext}/spacktivity:/spactivity  ${1}
}

# docker_logger
if [[ ${owner} == "docker" ]]; then
    # echo "" >> ${file_docker_log}
    echo "$(date +%Y-%m-%d\ %H:%M:%S) ${dist}-${release}, network node hostname = $(uname -n), ${machine}-(${moniker})"  >> ${file_docker_log}
fi
