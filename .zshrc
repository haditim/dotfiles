export ZSH="/home/hadi/.oh-my-zsh"
plugins=(
  git
#  zsh-syntax-highlighting
  zsh-autosuggestions
  extract
  colored-man-pages
  sudo
  history
  catimg
  npm
  pip
  python
  docker
  docker-compose
  dotenv
)


# delete from caret to line start by ctrl+U
bindkey \^U backward-kill-line

source $ZSH/oh-my-zsh.sh

# different history for each terminal windows
unsetopt share_history

# aliases
alias dotfiles='/usr/bin/git --git-dir=/home/hadi/.dotfiles/ --work-tree=/home/hadi'

## docker (from https://github.com/tcnksm/docker-alias)
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
# Stop all containers
dstop() { docker stop $(docker ps -a -q); }
# Remove all containers
drm() { docker rm $(docker ps -a -q); }
# Stop and Remove all containers
alias drmf='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'
# Remove all images
dri() { docker rmi $(docker images -q); }
# Dockerfile build, e.g., $dbu tcnksm/test
dbu() { docker build -t=$1 .; }
# Show all alias related docker
dalias() { alias | grep 'docker' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/"| sed "s/['|\']//g" | sort; }
# Bash into running container
dbash() { docker exec -it $(docker ps -aqf "name=$1") bash; }
eval "$(starship init zsh)"

# Enable mouse for tmux
set -g mouse on
