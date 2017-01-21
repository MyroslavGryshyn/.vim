#Use up 2 or up 3 instead of ../..
upup(){ DEEP=$1; [ -z "${DEEP}" ] && { DEEP=1; }; for i in $(seq 1 ${DEEP}); do cd ../; done; }
alias up='upup'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# git aliases
alias gs='git status'
alias gc='git commit -am'
alias gch='git checkout'

alias gentags='ctagsp -R *'

alias hg='history | grep'
alias pg='ps aux | grep'
alias fgrep='find . | grep'
alias pyrun='python manage.py runserver'
alias pytest='python manage.py test'
alias pyshell='python manage.py shell'
alias pyman='python manage.py '

alias pipr='pip install -r requirements.txt'
