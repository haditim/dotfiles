export ZSH="/home/$HOME/.oh-my-zsh"
export ZSH_DOTENV_PROMPT=false
export MOZ_ENABLE_WAYLAND=1
plugins=(
  catimg
  colored-man-pages
  docker
  docker-compose
  dotenv
  emacs
  extract
  git
  history
  kubectl
  npm
  pip
  python
  sudo
  zsh-autosuggestions
)

# Delete from caret to line start by ctrl+U
bindkey \^U backward-kill-line

source $ZSH/oh-my-zsh.sh

# Different history for each terminal windows
unsetopt share_history

# Aliases
alias dotfiles='/usr/bin/git --git-dir=/home/user/.dotfiles/ --work-tree=/home/user'

### Some more Docker aliases (others are covered by plugins)
## Processes
alias dps="docker ps"
## Get process included stop container
alias dpa="docker ps -a"
## Get container IP
alias dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"
## Stop all containers
function dstop() { docker stop $(docker ps -a -q); }
## Remove all containers
function drm() { docker rm $(docker ps -a -q); }
## Stop and Remove all containers
alias drmf='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'
## Remove all images
function dri() { docker rmi $(docker images -q); }
## Bash into running container
function dbash() { docker exec -it $(docker ps -aqf "name=$1") bash; }

# Starship
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

# Fuzzy history search
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Fix for TRAMP hanging/not showing the terminal
[ $TERM = "dumb" ] && unsetopt zle && PS1='$ '

# Eat integration
[ -n "$EAT_SHELL_INTEGRATION_DIR" ] && source "$EAT_SHELL_INTEGRATION_DIR/zsh"

# Set different defaults if in emacs
if [[ ${INSIDE_EMACS:-no} != 'no' ]]; then
    export EDITOR=emacsclient
    export VISUAL=emacsclient
    export PAGER=cat

    alias magit="emacsclient -ne '(magit-status)'"

    function man() { emacsclient -ne "(man \"$1\")"; }
fi
