#! /usr/bin/env bash
printf "%s\n" "$(date), $(tput bold)${BASH_SOURCE[0]}$(tput sgr0)"

# http://stackoverflow.com/questions/1125968/how-to-force-git-pull-to-overwrite-local-files
alias overwrite="echo 'git reset --hard HEAD'; git reset --hard HEAD"
alias ggit="echo 'git add -A .'; git add -A ."
alias gstatus="echo 'git status'; git status"
alias gpull="echo 'git pull'; git pull"
alias gpush="echo 'git push'; git push"
alias gclean="echo 'git clean -d -f -x; git prune'; git clean -f -x -d; git prune"
alias gcancel="echo 'git checkout -- .' ; git checkout -- ."
alias ghash="echo 'git rev-parse HEAD' ; git rev-parse HEAD"

# https://stackoverflow.com/questions/783811/getting-git-to-work-with-a-proxy-server
#alias get_git_proxies='echo "http proxy: "; git config --global --get http.proxy; echo "https proxy: "; git config --global --get https.proxy'
alias set_git_proxies='git config --global http.proxy http://proxyout.ertcorp.com:8080; git config --global https.proxy http://proxyout.ertcorp.com:8080'
#alias git_clone='echo "git clone https://github.com/spack/spack"; git clone https://github.com/spack/spack; pwd'
alias mothership="echo 'git remote show origin'; git remote show origin"
alias myurl="git config --get remote.origin.url"
alias gpg_check='git verify-commit HEAD~0; export GPG_SIGNED=$?; echo "verify-commit exit code = \$GPG_SIGNED = $GPG_SIGNED"'

# https://stackoverflow.com/questions/961101/git-find-all-uncommitted-locals-repos-in-a-directory-tree
# find . -type d -name '.git' | while read dir ; do sh -c "cd $dir/../ && echo -e \"\nGIT STATUS IN ${dir//\.git/}\" && git status -s" ; done

alias floquet="echo 'git remote add floquet https://github.com/floquet/spack.git'; git remote add floquet https://github.com/floquet/spack.git"

alias sweep_repos="echo '. \${core}/git-puller.sh'; . ${core}/git-puller.sh"

# 1Password: PAT-github-xiuhcoatl
# Configure Git to securely store credentials (e.g., PAT) in the macOS Keychain, 
# enabling automatic authentication for future Git operations.
# git config --global credential.helper osxkeychain

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
    echo "Setting Git configurations for Daniel Topa..."

    # Set user details
    git config --global user.name "Daniel Topa"
    git config --global user.email "dantopa@gmail.com"

    # General preferences
    git config --global pull.rebase false      # Disable rebase on pull
    git config --global push.default simple   # Simplify push behavior
    git config --global color.ui true         # Enable colored output
    git config --global rerere.enabled true   # Enable reuse of recorded resolutions
    git config --global core.editor "vim"     # Set default editor
    git config --global merge.tool "meld"     # Set default merge tool

    # Use 'main' instead of 'master' as the default branch
    git config --global init.defaultBranch "main"

    # Set default diff and status verbosity
    git config --global core.pager "less -FRX" # Pager for git output

    # Set credential helper for macOS Keychain
    if [[ "$(uname)" == "Darwin" ]]; then
        git config --global credential.helper osxkeychain
    fi

    # Optional: Set up GPG signing if desired (replace KEY_ID with your GPG key ID)
    git config --global commit.gpgSign true
    git config --global user.signingkey "KEY_ID"

    echo "Git configuration for Daniel Topa is complete."
}

function get_git_listing(){
    if [ ! -d .git ]; then
        echo "Error: Not a Git repository."
        return 1
    fi

    if [ -z "$1" ]; then
        echo "Listing all tracked files in the repository..."
        git ls-files
    else
        echo "Searching for tracked files matching pattern: $1"
        git ls-files "$1"
    fi
}

function get_git_proxies(){
    echo "Checking Git proxy settings..."
    
    # Fetch and display the HTTP proxy setting
    local http_proxy
    http_proxy=$(git config --global --get http.proxy)
    if [ -n "$http_proxy" ]; then
        echo "HTTP proxy: $http_proxy"
    else
        echo "HTTP proxy: Not configured"
    fi

    # Fetch and display the HTTPS proxy setting
    local https_proxy
    https_proxy=$(git config --global --get https.proxy)
    if [ -n "$https_proxy" ]; then
        echo "HTTPS proxy: $https_proxy"
    else
        echo "HTTPS proxy: Not configured"
    fi
}

function garbage_collection(){
    list=("$@") # Accept directories as arguments
    echo "* * * Starting git garbage collection on: ${list[@]}"
    pids=() # Array to hold PIDs of background processes

    for r in "${list[@]}"; do
        echo "Cleaning ${r}"

        # Check if the directory exists
        if [ -d "$r" ]; then
            cd "$r" || { echo "Failed to cd into $r"; continue; }

            # Ensure it's a Git repository
            if [ -d .git ]; then
                echo "Running git gc in $(pwd)"

                # Run git garbage collection in the background
                git gc &

                # Capture the PID of the background process
                # Using PIDs ensures we can monitor and wait for each process individually.
                pids+=($!)
            else
                echo "Skipping $r: Not a Git repository."
            fi
        else
            echo "Skipping $r: Directory does not exist."
        fi
    done

    echo "Waiting for garbage collection processes to complete..."

    # Wait for each background process to finish
    for pid in "${pids[@]}"; do
        # `wait $pid` ensures we handle each process individually, 
        # making it possible to detect if any process fails.
        wait "$pid" || echo "Process $pid failed."
    done

    echo "# # # End of git garbage collection on: ${list[@]}"
}

# https://askubuntu.com/questions/674333/how-to-pass-an-array-as-function-argument
function clean_git_repos(){
    local dirHere=$(pwd) # Use local to avoid polluting the environment

    echo "Starting clean_git_repos from: $dirHere"
    
    # Check if repositories are defined
    if [ -z "${repos_bitbucket+x}" ] || [ -z "${repos_gitlab+x}" ] || [ -z "${repos_github+x}" ]; then
        echo "Error: Repository variables are not defined."
        return 1
    fi

    # Run garbage collection for each group of repositories
    garbage_collection "${repos_bitbucket[@]}"
    garbage_collection "${repos_gitlab[@]}"
    garbage_collection "${repos_github[@]}"

    # Explicitly wait for garbage collection processes to complete
    echo "Waiting for all garbage collection processes to finish..."
    wait

    # Return to the original directory
    if ! cd "$dirHere"; then
        echo "Error: Failed to return to $dirHere"
        return 1
    fi
    echo "Finished clean_git_repos"
}



