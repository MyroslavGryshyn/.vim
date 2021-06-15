# You may need to manually set your language environment
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="agnoster"

# source "/usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git vi-mode pip pyenv python django sudo zsh-syntax-highlighting zsh-autosuggestions z web-search)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin"
export PATH="/Applications/Postgres.app/Contents/Versions/11/bin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

export PROJECT_HOME=$HOME/Dev
export WORKON_HOME=$HOME/.virtualenvs
export EDITOR=vim

if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    source /usr/local/bin/virtualenvwrapper.sh
fi

export DJANGO_LIVE_TEST_SERVER_ADDRESS="localhost:9000"

bindkey -M viins 'jj' vi-cmd-mode

set -o vi
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.key-binding.zsh ] && source ~/.key-binding.zsh

export FZF_DEFAULT_COMMAND='ag -g "" --hidden'
_fzf_compgen_path() {
  ag -g "" "$1"
}

alias tmux="TERM=xterm-256color tmux"

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/scripts/base16-ocean.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Enable Ctrl-v to edit command line
autoload -U edit-command-line
bindkey '^v' edit-command-line

# Emacs style
zle -N edit-command-line

# Git utils
# ====================================================================================

is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}

fzf-down() {
  fzf --height 50% "$@" --border
}

# Select changed files in git repo
gj() {
  is_in_git_repo || return
  git -c color.status=always status --short |
  fzf-down -m --ansi --nth 2..,.. \
    --preview '(git diff --color=always -- {-1} | sed 1,4d; cat {-1}) | head -500' |
  cut -c4- | sed 's/.* -> //'
}

# Select git branch
gi() {
  is_in_git_repo || return
  git branch -a --color=always | grep -v '/HEAD\s' | sort |
  fzf-down --ansi --multi --tac --preview-window right:70% \
    --preview 'git log --oneline --graph --date=short --pretty="format:%C(auto)%cd %h%d %s" $(sed s/^..// <<< {} | cut -d" " -f1) | head -'$LINES |
  sed 's/^..//' | cut -d' ' -f1 |
  sed 's#^remotes/##'
}

# Select git tag
gt() {
  is_in_git_repo || return
  git tag --sort -version:refname |
  fzf-down --multi --preview-window right:70% \
    --preview 'git show --color=always {} | head -'$LINES
}

# Select git commit hash
gh() {
  is_in_git_repo || return
  git log --date=short --format="%C(green)%C(bold)%cd %C(auto)%h%d %s (%an)" --graph --color=always |
  fzf-down --ansi --no-sort --reverse --multi --bind 'ctrl-s:toggle-sort' \
    --header 'Press CTRL-S to toggle sort' \
    --preview 'grep -o "[a-f0-9]\{7,\}" <<< {} | xargs git show --color=always | head -'$LINES |
  grep -o "[a-f0-9]\{7,\}"
}

# Checkout git commit
fzf-checkout() {
  local commits commit
  commits=$(git log --graph --color=always --format="%C(auto)%h%d %s %C(241)%C(bold)%cr %C(auto)%C(blue)%cn") &&
    commit=$(echo "$commits" | fzf-down --ansi --no-sort --reverse --tiebreak=index) &&
    git checkout $(echo "$commit" | grep -o "[a-f0-9]\{7,\}")
}
bindkey -s '^g^o' 'fzf-checkout\n'

# Checkout git branch
fzf-branch() {
    local branches branch
    branches=$(git branch -a --color=always | grep -v HEAD | sort) &&
        branch=$(echo "$branches" |
    fzf-down --ansi --tac -d $(( 2 + $(wc -l <<< "$branches") )) +m +s) &&
        git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}
bindkey -s '^b' 'fzf-branch\n'

# Browse git commits
fzf-show() {
    is_in_git_repo || return
    git log --graph --color=always \
        --format="%C(auto)%h%d %s %C(241)%C(bold)%cr %C(auto)%C(blue)%cn" "$@" |
    fzf-down --height 70% --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
        --bind "ctrl-m:execute:
    (grep -o '[a-f0-9]\{7\}' | head -1 |
    xargs -I % sh -c 'git show --color=always % | less') << 'FZF-EOF'
    {}
    FZF-EOF"
}
bindkey -s '^s' 'fzf-show\n'


join-lines() {
  local item
  while read item; do
    echo -n "${(q)item} "
  done
}

bind-git-helper() {
  local char
  for c in $@; do
    eval "fzf-g$c-widget() { local result=\$(g$c | join-lines); zle reset-prompt; LBUFFER+=\$result }"
    eval "zle -N fzf-g$c-widget"
    eval "bindkey '^g^$c' fzf-g$c-widget"
  done
}
bind-git-helper j i t r h
unset -f bind-git-helper
# Other utils
# ====================================================================================
# Kill process
fkill() {
  ps -ef | sed 1d | fzf -m | awk '{print $2}' | xargs kill -${1:-9}
}
# Integration with z
unalias z 2> /dev/null
z() {
  [ $# -gt 0 ] && _z "$*" && return
  cd "$(_z -l 2>&1 | fzf +s --tac --query "$*" | sed 's/^[0-9,.]* *//')"
}

# Search by public IP
function pubip {
  if [ $# -ge 1 ] ; then
    if [ $# -lt 2 ] ; then region=eu-west-1 ; else region=$2 ; fi
      if [ $# -lt 3 ] ; then profile=default ; else profile=$3 ; fi
        aws ec2 describe-instances --query 'Reservations[].Instances[].PublicIpAddress' --output text --instance-ids $1 --region $region --profile $profile
  fi
}

export PYTHON_VERSION=2.7.14
export RUN_ENV=DEV

eval $(thefuck --alias)

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh

export XDG_CONFIG_HOME=$HOME
alias vim="nvim"
alias vi="nvim"

eval "$(pyenv init -)"
# Not sure we need it
# pyenv virtualenvwrapper

export PATH="/usr/local/opt/postgresql@12/bin:$PATH"
export DJANGO_LOCAL=True

source ~/.git-completion.zsh
