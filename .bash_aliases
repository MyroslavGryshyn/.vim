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
alias gc='git commit'

alias gentags='ctagsp -R *'

alias ssh0251='ssh mgryshyn@vm30bsd0251.ibqa.sgg.cisco.com'
alias ssh0024='ssh mgryshyn@vm30bsd0024.ibqa.sgg.cisco.com'
alias ssh0024t='ssh testuser@vm30bsd0024.ibqa.sgg.cisco.com'
alias ssh0248='ssh mgryshyn@vm30bsd0248.ibqa.sgg.cisco.com'
alias sshesa='ssh rtestuser@vm30esa0006.ibqa.sgg.cisco.com'
alias sshadmin='ssh admin@vm30esa0006.ibqa.sgg.cisco.com'
alias ssh380admin='ssh admin@c380q21.ibqa.sgg.cisco.com'
alias ssh380='ssh rtestuser@c380q21.ibqa.sgg.cisco.com'
alias sshdo_root='ssh root@146.185.168.143'
alias sshdo='ssh mero@146.185.168.143'

alias hg='history | grep'
alias pg='ps aux | grep'
alias fgrep='find . | grep'
alias pyrun='python manage.py runserver'
alias pytest='python manage.py test'
alias pyman='python manage.py '

alias st='ssh rtestuser@esa003.auto.sgg.cisco.com'
alias sshesa026='ssh rtestuser@vm30esa0026.ibqa.sgg.cisco.com'
