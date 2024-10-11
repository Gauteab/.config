export TERM="xterm-256color"
export EDITOR="nvim"
export CONFIG="~/.config"

# == ZSH ==
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=6'

# == ZSH Plugins ==
plugins=(
  git
  z
  zsh-syntax-highlighting
  zsh-autosuggestions
  colored-man-pages
  extract
  web-search
  npm
)

source $ZSH/oh-my-zsh.sh
source ~/.profile
# source ~/dotfiles/elm-cli-extra.sh

# Vi Mode
bindkey -v

# 
# Aliases
#
alias v="nvim"
alias zshrc="nvim $CONFIG/zshrc && source ~/.zshrc"
alias vimrc="nvim $CONFIG/nvim/init.vim"

alias l='clear; exa -la --group-directories-first'
alias ls='exa'
alias tree='exa -l -T'

alias skim='open -a "Skim"'
alias timel='python3 ~/uio/Timelisteskript/timeliste.py Gaute Berge IN2000 16-11-1996'
alias pdfviewer='open -a "Google Chrome" -n --args "chrome-extension://gfbliohnnapiefjpjlpjnehglfpaknnc/pages/pdf_viewer.html"'

alias talon-repl='~/.talon/.venv/bin/repl'
alias talon-log='tail -f ~/.talon/talon.log'
alias talon-pip='~/.talon/bin/pip'

alias nrd='npm run dev'
alias bi='brew install'

alias gcd='git checkout dev'
alias gcob='git checkout $(git branch | fzf)'
alias gdta='GIT_EXTERNAL_DIFF=difft git diff'

export function ti() {
    terraform init -backend-config="${1:-dev}.gcs.tfbackend" -reconfigure
}


#
# Functions
#

function cheat { curl "cheat.sh/$1" }

function hie-fix { # run in stack project to fix an issue with the language server
    gen-hie > hie.yaml
    rm -rf .stack-work
    stack build
}

fkill() { # fkill - kill processes - list only the ones you can kill. Modified the earlier script.
    local pid 
    if [ "$UID" != "0" ]; then
        pid=$(ps -f -u $UID | sed 1d | fzf -m | awk '{print $2}')
    else
        pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
    fi  

    if [ "x$pid" != "x" ]
    then
        echo $pid | xargs kill -${1:-9}
    fi  
}

j() {
  [ $# -gt 0 ] && z "$*" && return
  cd "$(z -l 2>&1 | fzf --height 40% --nth 2.. --reverse --inline-info +s --tac --query "${*##-* }" | sed 's/^[0-9,.]* *//')"
}

# source ~/.fzf.zsh
# bindkey '^X' fzf-cd-widget
# export FZF_DEFAULT_COMMAND='fd --type f '
# export FZF_DEFAULT_COMMAND='fd --hidden --type f --no-ignore-vcs'
# export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# export FZF_ALT_C_COMMAND="fd --hidden --type d"

DISABLE_AUTO_TITLE="true"
set_title() {
    echo -e "\033];$@\007"
}

# watch files an update ~/.names 
# tw src
tw() {
    echo "watching $1"
    fswatch -0 --event Updated $1 | while read -d "" event 
    do
        echo "changed: $event"
        python ~/dotfiles/extract_functions.py $event
    done
}

# move the last $1 files to directory $2
function mvx { ls|tail -$1|while read -r e; do mv $e $2;  done; }

# move the last $1 files to new directory called $2
# e.g: slp-save 5 rich
# to capture that game 5 set
function slp-save { 
    mkdir $2;
    ls *.slp|tail -$1|while read -r e; do mv $e $2;  done; 
}

function haskell-deamon {
    ghcid -r -W \
        -c "stack repl" \
        --restart="./package.yaml" \
        --restart "./stack.yaml"
}

# https://github.com/torifat/npms
function npms() {
  if [ ! -f package.json ]; then
    echo "package.json not found" >&2
  else 
    local command=$(jq '.scripts | keys[]' package.json -r | tr -d '"' | 
    fzf --reverse \
      --preview-window=:wrap \
      --preview "jq '.scripts.\"{}\"' package.json -r | tr -d '\"' | sed 's/^[[:blank:]]*//'")

    if [ -n "$command" ]; then
      eval "npm run $command"
    fi
  fi
}

eval "$(starship init zsh)"

# zplug "zsh-users/zsh-syntax-highlighting", defer:2


# [[ $TERM != "screen" ]] && exec tmux

export function hs() { ghc -e "Prelude.interact ($1)" }
export function lens() { ghc -e "Prelude.interact (show . (toListOf ($1)))" }

export function ei() { elm install $(curl -s --compressed -H "Accept: application/json" https://package.elm-lang.org/search.json | jq '.[].name' -r | fzf --preview 'curl -s --compressed -H "Accept: application/json" https://package.elm-lang.org/packages/{}/latest/elm.json | jq ".summary" -r') }

export function dock() {
  docker $1 $(docker ps -a | fzf --layout=reverse | cut -d " " -f1)
}

export LLVM_SYS_160_PREFIX=$(brew --prefix llvm@16)

export PATH=$PATH:~/roc_nightly-macos_apple_silicon-2024-09-27-aa44e2c284
