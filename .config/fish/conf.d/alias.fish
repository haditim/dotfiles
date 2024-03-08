# git
abbr -a gs  git status -sb
abbr -a ga  git add
abbr -a gc  git commit
abbr -a gcm git commit -m
abbr -a gca git commit --amend
abbr -a gcl git clone
abbr -a gco git checkout
abbr -a gp  git push
abbr -a gpl git pull
abbr -a gl  git l
abbr -a gd  git diff
abbr -a gds git diff --staged
abbr -a gr  git rebase -i HEAD~15
abbr -a gf  git fetch
abbr -a gfc git findcommit
abbr -a gfm git findmessage
abbr -a gco git checkout
abbr -a gt git log --oneline --graph --decorate --all   # git tree
abbr -a gfs "git rev-list --all --objects | git cat-file --batch-check='%(objectname) %(objecttype) %(objectsize) %(rest)' | grep blob | sort -k3nr | head -n 20"  # git file sizes


# ls
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'

# misc
alias reload='exec fish'

# dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# docker
# Get latest container ID
alias dl="docker ps -l -q"
# Get container process
alias dps="docker ps"
# Get process included stop container
alias dpa="docker ps -a"
# Get images
alias di="docker images"
# Get container IP
alias dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"
# Run deamonized container, e.g., $dkd base /bin/echo hello
alias dkd="docker run -d -P"
# Run interactive container, e.g., $dki base /bin/bash
alias dki="docker run -i -t -P"
# Execute interactive container, e.g., $dex base /bin/bash
alias dex="docker exec -i -t"
# Docker logs follow
alias dlf="docker logs -f"
# Docker logs follow tail
alias dlt="docker logs -f -n 100"
# Stop all containers
function dstop
    docker stop $(docker ps -a -q)
end
# Remove all containers
function drm
    docker rm $(docker ps -a -q)
end
# Stop and Remove all containers
alias drmf='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'
# Remove all images
function dri
    docker rmi $(docker images -q)
end
# Dockerfile build, e.g., $dbu tcnksm/test
function dbu
    docker build -t=$1 .
end
# Bash into running container
function dbash
    docker exec -it $(docker ps -aqf "name=$1") bash
end
alias dco="docker compose"

# python
function pyclean
    find . -type f -name '*.py[co]' \
    -delete -o -type d -name __pycache__ \
    -delete -o -type d -name .mypy_cache -exec rm -r {} +
end

# Emacs with a new deamon if not exist
alias em="emacsclient -c -a="" -nw"
# Magit (Emacs git client)
alias magit="emacsclient -c -a="" -nw -e '(magit-status)'"
