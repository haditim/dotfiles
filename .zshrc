export ZSH="/home/hadi/.oh-my-zsh"
plugins=(
  git
  zsh-syntax-highlighting
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

# Powerline theme
ZSH_THEME="powerlevel9k/powerlevel9k"

# Powerline colors and styles
POWERLEVEL9K_COLOR_SCHEME='dark'
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_PROMPT_ADD_NEWLINE=false
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
POWERLEVEL9K_RVM_FOREGROUND="249"
POWERLEVEL9K_RVM_VISUAL_IDENTIFIER_COLOR="red"
POWERLEVEL9K_VIRTUALENV_BACKGROUND="239"
POWERLEVEL9K_VIRTUALENV_FOREGROUND="white"
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND='239'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND='white'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_VCS_HIDE_TAGS='false'
POWERLEVEL9K_STATUS_OK_IN_NON_VERBOSE=true
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_VCS_SHORTEN_LENGTH=7
POWERLEVEL9K_VCS_SHORTEN_MIN_LENGTH=12
POWERLEVEL9K_VCS_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_VCS_SHORTEN_DELIMITER=".."
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%F{blue}\u256D\u2500%f"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{blue}\u2570> "
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(ssh root_indicator dir dir_writable)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status virtualenv vcs command_execution_time)
HIST_STAMPS="dd/mm/yyyy"
DISABLE_UPDATE_PROMPT=true
POWERLEVEL9K_MODE='awesome-fontconfig'

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
