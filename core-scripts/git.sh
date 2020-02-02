#! /bin/bash
printf '%s\n' "$(date), $(tput bold)${BASH_SOURCE[0]}$(tput sgr0)"

# http://stackoverflow.com/questions/1125968/how-to-force-git-pull-to-overwrite-local-files
alias overwrite="git reset --hard HEAD"
alias ggit="git add -A ."

# https://stackoverflow.com/questions/783811/getting-git-to-work-with-a-proxy-server
#alias get_git_proxies='echo "http proxy: "; git config --global --get http.proxy; echo "https proxy: "; git config --global --get https.proxy'
alias set_git_proxies='git config --global http.proxy http://proxyout.ertcorp.com:8080; git config --global https.proxy http://proxyout.ertcorp.com:8080'
#alias git_clone='echo "git clone https://github.com/spack/spack"; git clone https://github.com/spack/spack; pwd'
alias mothership="echo 'git remote show origin'; git remote show origin"
alias myurl="git config --get remote.origin.url"
alias gpg_check='git verify-commit HEAD~0; export GPG_SIGNED=$?; echo "verify-commit exit code = \$GPG_SIGNED = $GPG_SIGNED"'

alias floquet="echo 'git remote add floquet https://github.com/floquet/spack.git'; git remote add floquet https://github.com/floquet/spack.git"

alias sweep_repos="echo '. \${core}/git-puller.sh'; . ${core}/git-puller.sh"

# git-aware prompt
# https://scriptingosx.com/2019/07/moving-to-zsh-06-customizing-the-zsh-prompt/
# autoload -Uz vcs_info
# precmd_vcs_info() { vcs_info }
# precmd_functions+=( precmd_vcs_info )
# setopt prompt_subst
# RPROMPT=\$vcs_info_msg_0_
# zstyle ':vcs_info:git:*' formats '%F{240}(%b)%r%f'
# zstyle ':vcs_info:*' enable git

# root@ac0efb9c551b:core-scripts $ . git.sh
# Mon Jan 20 22:46:31 CET 2020, git.sh
# bash: autoload: command not found
# bash: git.sh: line 80: syntax error: unexpected end of file

# # F U N C T I O N S

function sign_gpg(){
    git config --global user.signingkey #1
}

function dantopa(){
    git config --global user.name "Daniel Topa"
    git config --global user.email dantopa@gmail.com
    git config --global push.default simple
    git config --global color.ui true
    git config --global rerere.enabled true
    git config --global core.editor "vim"
    git config --global merge.tool "meld"
}

function get_git_proxies(){
    echo 'http proxy: '
    git config --global --get http.proxy
    echo 'https proxy: '
    git config --global --get https.proxy
}

function get_git_listing(){
    git ls-files $1
}

function garbage_collection(){
    #declare -a myarray=$1
    list=("$@")
    echo "* * * start git garbage collection on ${list[@]}"
    for r in "${list[@]}"; do
        # echo "\${r} = ${r}"
        echo "cleaning ${r}"
        eval cd \$${r}
        #echo "\$(pwd) = $(pwd)"
        git gc &
    done
    echo "# # # end git garbage collection on ${list[@]}"
}

# https://askubuntu.com/questions/674333/how-to-pass-an-array-as-function-argument
function clean_git_repos(){
    export dirHere=$(pwd)

    garbage_collection ${repos_bitbucket}
    garbage_collection ${repos_gitlab}
    garbage_collection ${repos_github}

    wait
    cd ${dirHere}
}
