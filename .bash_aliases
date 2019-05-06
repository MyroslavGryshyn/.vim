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
alias pyshell='python manage.py shell'
alias pyman='python manage.py '

alias pipr='pip install -r requirements.txt'

alias ipy="python -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()'"


alias micebook-dev="ssh -i ~/.ssh/micebook-development.pem ubuntu@ec2-54-154-228-174.eu-west-1.compute.amazonaws.com"
alias micebook-stage="ssh -i ~/.ssh/micebook-development.pem ubuntu@ec2-54-154-228-174.eu-west-1.compute.amazonaws.com"

alias gl="git log --oneline --graph --date=short --pretty"
alias leo="cd ~/tmp/LeoPort/ && ./gradlew run && cd -"

alias eth="/Users/mero/.virtualenvs/playground/bin/python /Users/mero/Dev/playground/crypto.py"
# alias remap80="echo '
# rdr pass inet proto tcp from any to any port 80 -> 127.0.0.1 port 8080
# ' | sudo pfctl -ef -"
