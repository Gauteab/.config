export TERM="xterm-256color"
export EDITOR="nvim"
export CONFIG="$HOME/.config"

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
#  fzf-z
)

source $ZSH/oh-my-zsh.sh
source ~/.profile
# source ~/dotfiles/elm-cli-extra.sh

# Vi Mode
bindkey -v

# Aliases
alias vi="nvim"
# alias vim="nvim"
alias gitit="git add --all && git commit && git push"
alias zshrc="vi ~/$CONFIG/zshrc && source ~/.zshrc"
alias vimrc="vi ~/$CONFIG/nvim/init.vim"

alias l='clear; exa -la --group-directories-first'
alias ls='exa'
alias tree='exa -l -T'

alias skim='open -a "Skim"'
alias timel='python3 ~/uio/Timelisteskript/timeliste.py Gaute Berge IN2000 16-11-1996'
alias pdfviewer='open -a "Google Chrome" -n --args "chrome-extension://gfbliohnnapiefjpjlpjnehglfpaknnc/pages/pdf_viewer.html"'

alias talon-repl='~/.talon/.venv/bin/repl'
alias talon-log='tail -f ~/.talon/talon.log'
alias talon-pip='~/.talon/bin/pip'



# Functions

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

# use fzf with 'z'
unalias z 2> /dev/null
z() {
  [ $# -gt 0 ] && _z "$*" && return
  cd "$(_z -l 2>&1 | fzf --height 40% --nth 2.. --reverse --inline-info +s --tac --query "${*##-* }" | sed 's/^[0-9,.]* *//')"
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

eval "$(starship init zsh)"

# zplug "zsh-users/zsh-syntax-highlighting", defer:2


# [[ $TERM != "screen" ]] && exec tmux

