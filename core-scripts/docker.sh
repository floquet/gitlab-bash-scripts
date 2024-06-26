#! /usr/bin/env bash
printf "%s\n" "$(date), $(tput bold)${BASH_SOURCE[0]}$(tput sgr0)"

# alias bye="echo 'lsb_release -a; exit'; lsb_release -a; echo '\${myVM} = ${myVM}'; echo 'docker commit $(uname -n) \${myVM}'; exit"
alias bye='echo "lsb_release -a; exit"; lsb_release -a; echo "\${myVM} = ${myVM}"; echo "docker commit $(uname -n) \${myVM}"; echo "docker push ${myVM}"; exit'
alias goodbye="echo 'uname -n ; lsb_release -a; exit'; uname -n; lsb_release -a; exit; echo 'docker commit $(uname -n) ${myVM}'"
# https://superuser.com/questions/121627/how-to-get-elements-from-list-in-bash/121628
alias session="echo $(uname -a) | cut -d' ' -f2"
alias boo="list=$(uname -a); set -- list"
alias dimage="echo 'docker images'; docker images"
alias prune="echo 'docker container prune'; docker container prune"
alias dpmyvm="echo 'docker push ${myVM}' ; docker push ${myVM}"
alias mirrorBigSpackMirror="echo 'spack mirror add local_filesystem file://${big_spack_mirror}';spack mirror add local_filesystem file://${big_spack_mirror}"

export centos_version="8.5"
export ubuntu_version="22.04"
export   amzn_version="20230"
export debian_version="11.3"
export    dbase="dantopa/base-centos:${centos_version}"
export dscience="dantopa/science-centos:${centos_version}"
export dirDockerLocker="${ddocker}"
export      dirDropbox="${repo}/spacktivity/mirror"
export file_docker_log="${repo_results_docker}/vm-log-book.txt"

# what container was running?
# docker ps -l

# docker image import ${volume_ext}/Tlaloc/docker-land/tarballs/dantopa-base-centos-7.9.2009.gz test:hope

# docker container prune

# https://docs.docker.com/engine/reference/commandline/save/
# docker save centos:7.9.2009 > centos.tar
# docker load centos.tar

# $ docker commit 256ef1128538 dantopa/centos-7.9:alpha
# $ docker push  dantopa/centos-7.9:alpha

# -docker rmi $(docker images --filter "dangling=true" -q --no-trunc)
# $ docker ps -a

#alias reap="${rgaddr}/repos/bitbucket/spack_tools/scripts/reaper.bash"
#alias reap="echo '${rgaddr}/repos/bitbucket/spack_tools/scripts/reaper.bash; git -C ${stools} commit -m ''test'''; ${rgaddr}/repos/bitbucket/spack_tools/scripts/reaper.bash; git -C ${stools} commit -m ''test''"
#export generics="${ddocker}/unified/generics/"

# dtopa@swe45.local:SpWx $ docker container ls
# CONTAINER ID   IMAGE          COMMAND   CREATED       STATUS       PORTS     NAMES
# 229033ca032d   ubuntu:22.04   "bash"    2 hours ago   Up 2 hours             stoic_wozniak
# dtopa@swe45.local:SpWx $ docker container ls
# CONTAINER ID   IMAGE               COMMAND       CREATED          STATUS         PORTS     NAMES
# 313e56f546b6   spwx-02-amzn:2022   "/bin/bash"   11 seconds ago   Up 8 seconds             inspiring_bardeen
# 229033ca032d   ubuntu:22.04        "bash"        2 hours ago      Up 2 hours               stoic_wozniak
# dtopa@swe45.local:SpWx $ docker commit 313e56f546b6 dantopa/spwx-02-amzn:2022
# sha256:3b0bd641729f382d5a66777b20ca5186fcdd4cd1f5451b352018ccf36dbe4b6e
# dtopa@swe45.local:SpWx $  docker push dantopa/spwx-02-amzn:2022
# The push refers to repository [docker.io/dantopa/spwx-02-amzn]
# 30b6acf122c1: Pushing [=>                                                 ]  23.73MB/1.069GB
# 26fa52930e9c: Pushing [==>                                                ]  12.21MB/270MB
# 81faef12b1ed: Pushing [>                                                  ]  15.37MB/3.464GB
# af1ced3b8ec9: Pushing [==>                                                ]  10.89MB/181.8MB


function xiuhcoatlDocker(){
    docker_logger
# myDocker ubuntu:22.04
    export myVM="${1}"
    #echo "docker run -it -v ${HOME}/Dropbox:/Dropbox -v ${volume_ext}/Metztli:/Metztli -v ${volume_ext}/Infernum:/Infernum -v ${volume_ext}/Paradisum:/Paradisum -v ${volume_ext}/Purgatorium:/Purgatorium -v ${volume_ext}/atacama:/atacama -v ${volume_ext}/docker:/docker -v ${volume_ext}/gobi:/gobi -v ${volume_ext}/sonoran:/sonoran -v ${volume_ext}/repos:/repos -v ${volume_ext}/spacktivity:/spacktivity ${1}"
    echo "docker run -it -v ${HOME}/Dropbox:/Dropbox -v ${volume_ext}/atacama:/atacama -v ${volume_ext}/docker:/docker -v ${volume_ext}/gobi:/gobi -v ${volume_ext}/sonoran:/sonoran -v ${volume_ext}/repos:/repos -v ${volume_ext}/spacktivity:/spacktivity ${1}"
    docker run -it \
 -v ${HOME}/Dropbox:/Dropbox    \
# -v ${volume_ext}/Metztli:/Metztli          \
 -v ${volume_ext}/Infernum:/Infernum        \
 -v ${volume_ext}/Paradisum:/Paradisum      \
 -v ${volume_ext}/Purgatorium:/Purgatorium  \
 -v ${volume_ext}/atacama:/atacama          \
 -v ${volume_ext}/docker:/docker            \
 -v ${volume_ext}/gobi:/gobi                \
 -v ${volume_ext}/sonoran:/sonoran          \
 -v ${volume_ext}/repos:/repos              \
 -v   ${volume_ext}/spacktivity:/spacktivity  ${1}
}

# function xiuhcoatlDockerTime {
# # myDocker ubuntu:22.04
#     export myVM="${1}"
#     echo "docker run -it -v /etc/localtime:/etc/localtime -v ${HOME}/Dropbox:/Dropbox -v ${volume_ext}/Metztli:/Metztli -v ${volume_ext}/Infernum:/Infernum -v ${volume_ext}/Paradisum:/Paradisum -v ${volume_ext}/Purgatorium:/Purgatorium -v ${volume_ext}/atacama:/atacama -v ${volume_ext}/docker:/docker -v ${volume_ext}/gobi:/gobi -v ${volume_ext}/sonoran:/sonoran -v ${volume_ext}/repos:/repos -v ${volume_ext}/spacktivity:/spacktivity ${1}"
#     docker run -it                     \
#  -v /etc/localtime:/etc/localtime      \
#  -v ${HOME}/Dropbox:/Dropbox    \
#  -v ${volume_ext}/Metztli:/Metztli          \
#  -v ${volume_ext}/Infernum:/Infernum        \
#  -v ${volume_ext}/Paradisum:/Paradisum      \
#  -v ${volume_ext}/Purgatorium:/Purgatorium  \
#  -v ${volume_ext}/atacama:/atacama          \
#  -v ${volume_ext}/docker:/docker            \
#  -v ${volume_ext}/gobi:/gobi                \
#  -v ${volume_ext}/sonoran:/sonoran          \
#  -v ${volume_ext}/repos:/repos              \
#  -v ${volume_ext}/spacktivity:/spacktivity  ${1}
# }

function xiuhcoatlDockerTime {
# myDocker ubuntu:22.04
    docker_logger
    export myVM="${1}"
    echo "docker run -it -v /etc/localtime:/etc/localtime -v ${HOME}/Dropbox:/Dropbox -v ${volume_ext}/atacama:/atacama -v ${volume_ext}/docker:/docker -v ${volume_ext}/gobi:/gobi -v ${volume_ext}/sonoran:/sonoran -v ${volume_ext}/repos:/repos -v ${volume_ext}/spacktivity:/spacktivity ${1}"
    docker run -it                     \
 -v /etc/localtime:/etc/localtime      \
 -v ${HOME}/Dropbox:/Dropbox    \
 -v ${volume_ext}/atacama:/atacama          \
 -v ${volume_ext}/docker:/docker            \
 -v ${volume_ext}/gobi:/gobi                \
 -v ${volume_ext}/sonoran:/sonoran          \
 -v ${volume_ext}/repos:/repos              \
 -v ${volume_ext}/spacktivity:/spacktivity  ${1}
}

function quaxolotlDocker(){
    docker_logger
# volume_ext set in .quaxolotl.sh as ${volume_ext}/T7-Touch
    export myVM="${1}"
    echo "docker run -it -v ${volume_ext}/Dropbox:/Dropbox -v ${volume_ext}/repos:/repos -v ${volume_ext}/spacktivity:/spacktivity ${1}"
    docker run -it \
 -v ${volume_ext}/Dropbox:/Dropbox \
 -v ${volume_ext}/repos:/repos  \
 -v ${volume_ext}/spacktivity:/spacktivity  ${1}
}

function quaxolotlDockerTime(){
    docker_logger
# volume_ext set in .quaxolotl.sh as ${volume_ext}/T7-Touch
    export myVM="${1}"
    echo "docker run -it -v /etc/localtime:/etc/localtime -v ${volume_ext}/Dropbox:/Dropbox -v ${volume_ext}/repos:/repos -v ${volume_ext}/spacktivity:/spacktivity ${1}"
    docker run -it \
 -v /etc/localtime:/etc/localtime   \
 -v ${volume_ext}/Dropbox:/Dropbox \
 -v ${volume_ext}/repos:/repos     \
 -v ${volume_ext}/spacktivity:/spacktivity  ${1}
}

function ehecoatlDocker(){
    docker_logger
    # echo "$(date +%Y-%m-%d\ %H:%M:%S) ${dist}-${release}, network node hostname = $(uname -n), ${machine}-(${moniker})"  >> ${file_docker_log}
    export myVM="${1}"
    echo "\${myVM} = ${myVM}"
# volume_ext set in .quaxolotl.sh as ${volume_ext}/T7-Touch
    echo "docker run -it -v ${HOME}/Dropbox:/Dropbox -v ${HOME}/repos:/repos -v ${volume_ext}/:/Tlaloc -v ${volume_ext}/repos:/vrepos -v ${volume_ext}/SpWx:/SpWx -v ${volume_ext}/spacktivity:/spacktivity ${1}"
    docker run -it \
 -v ${HOME}/Dropbox:/Dropbox                  \
 -v ${HOME}/repos:/repos                      \
 -v ${volume_ext}/repos:/vrepos               \
 -v ${volume_ext}/:/Tlaloc                    \
 -v ${volume_ext}/SpWx:/SpWx                  \
 -v ${volume_ext}/spacktivity:/spacktivity  ${1}
}

function ehecoatlDockerTime(){
    docker_logger
    export myVM="${1}"
    echo "\${myVM} = ${myVM}"
# volume_ext set in .quaxolotl.sh as ${volume_ext}/T7-Touch
    export myVM="${1}"
    echo "docker run -it -v /etc/localtime:/etc/localtime -v ${HOME}/Dropbox:/Dropbox -v ${volume_ext}/repos:/repos -v ${volume_ext}/spacktivity:/spacktivity ${1}"
    docker run -it \
 -v /etc/localtime:/etc/localtime             \
 -v ${HOME}/Dropbox:/Dropbox                  \
 -v ${HOME}/repos:/repos                      \
 -v ${volume_ext}/repos:/vrepos               \
 -v ${volume_ext}/:/Tlaloc                    \
 -v ${volume_ext}/SpWx:/SpWx                  \
 -v ${volume_ext}/spacktivity:/spacktivity  ${1}
}

function ehecoatlDockerTimeGitlab(){
    docker_logger
    export myVM="${1}"
    echo "\${myVM} = ${myVM}"
# volume_ext set in .quaxolotl.sh as ${volume_ext}/T7-Touch
    export myVM="${1}"
    echo "docker run -it -v /etc/localtime:/etc/localtime -v ${HOME}/Dropbox:/Dropbox -v ${volume_ext}/repos:/repos -v ${volume_ext}/spacktivity:/spacktivity ${1}"
    docker run -it \
 -v /etc/localtime:/etc/localtime                       \
 -v /Users/${USER}/repos/gitlab/SpWx:/repos/gitlab/SpWx \
 -v ${HOME}/Dropbox:/Dropbox                            \
 -v ${HOME}/repos:/repos                                \
 -v ${volume_ext}/repos:/vrepos                         \
 -v ${volume_ext}/:/Tlaloc                              \
 -v ${volume_ext}/SpWx:/SpWx                            \
 -v ${volume_ext}/spacktivity:/spacktivity  ${1}
}

function docker_logger(){
# docker_logger
if [[ ${owner} == "docker" ]]; then
    export docker_log_tag="$(date +%Y-%m-%d\ %H:%M:%S) ${dist}-${release}, network node hostname = $(uname -n), ${machine}-(${moniker})"
    echo "${docker_log_tag}"  >> ${file_docker_log}
    echo "docker log entry: ${docker_log_tag}"
fi
}

docker_logger
