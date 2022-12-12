export ZSH="/home/hadi/.oh-my-zsh"
export ZSH_DOTENV_PROMPT=false
export MOZ_ENABLE_WAYLAND=1
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
  kubectl
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
function dstop() { docker stop $(docker ps -a -q); }
# Remove all containers
function drm() { docker rm $(docker ps -a -q); }
# Stop and Remove all containers
alias drmf='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'
# Remove all images
function dri() { docker rmi $(docker images -q); }
# Dockerfile build, e.g., $dbu tcnksm/test
function dbu() { docker build -t=$1 .; }
# Show all alias related docker
function dalias() { alias | grep 'docker' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/"| sed "s/['|\']//g" | sort; }
# Bash into running container
function dbash() { docker exec -it $(docker ps -aqf "name=$1") bash; }
eval "$(starship init zsh)"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
fi

function pyclean() { find . -type f -name '*.py[co]' -delete -o -type d -name __pycache__ -delete -o -type d -name .mypy_cache -exec rm -r {} + }

# libvterm serttings for emacs' vterm
function vterm_printf(){
    if [ -n "$TMUX" ] && ([ "${TERM%%-*}" = "tmux" ] || [ "${TERM%%-*}" = "screen" ] ); then
        # Tell tmux to pass the escape sequences through
        printf "\ePtmux;\e\e]%s\007\e\\" "$1"
    elif [ "${TERM%%-*}" = "screen" ]; then
        # GNU screen (screen, screen-256color, screen-256color-bce)
        printf "\eP\e]%s\007\e\\" "$1"
    else
        printf "\e]%s\e\\" "$1"
    fi
}

vterm_prompt_end() {
    vterm_printf "51;A$(whoami)@$(hostname):$(pwd)";
}
setopt PROMPT_SUBST
PROMPT='%{$(vterm_printf)%}'$PROMPT'%{$(vterm_prompt_end)%}'

# Tilix settings
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
