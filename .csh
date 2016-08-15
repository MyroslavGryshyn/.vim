if ( $?prompt ) then

  if($?tcsh) then
    bindkey "^W" backward-delete-word
    bindkey -k up history-search-backward
    bindkey -k down history-search-forward
  endif

  set prompt="`hostname -s`:${user} \!] "
  set filec
  set notify
  set history = 2000

  alias cli /data/bin/runas admin /data/bin/cli.sh
  alias ts  /data/bin/ts
  alias ll  ls -la
  alias hr  /data/bin/heimdall_svc recycle
  alias hs  /data/bin/heimdall_svc status
  alias h  /data/bin/heimdall_svc
endif

if ( -e /etc/phoebe.conf ) then
    # This reads in settings from phoebe.conf. The format of it is a
    # reduced Bourne-shell syntax with simple assignments and everything
    # else is a comment.
    eval `sed -n -e '/^#/d' -e 's/\(.*\)=\(.*\)/setenv \1 \2;/p' \
         < /etc/phoebe.conf`
endif
# /usr/local/bin/bash
