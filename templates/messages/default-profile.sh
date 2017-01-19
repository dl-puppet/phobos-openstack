# root prompt vs others
if [ `id -u` -eq 0 ] ; then
        PS1="\[\033[01;36m\][\t] \[\033[01;31m\]\u@\h:\[\033[01;33m\]\w # \[\033[00m\]"
else
        PS1="\[\033[01;36m\][\t] \[\033[01;32m\]\u@\h:\[\033[01;33m\]\w \$ \[\033[00m\]"
fi
export PS1

# EDITOR
[ -x /usr/bin/vim ] && EDITOR="/usr/bin/vim" && export EDITOR && alias vi='vim'

# PAGER
[ -x /usr/bin/less ] && PAGER="/usr/bin/less -R" && export PAGER

# different sets
set -o notify
shopt -s cdspell
shopt -s cdable_vars
shopt -s checkhash
shopt -s checkwinsize
shopt -s mailwarn
shopt -s sourcepath
shopt -s cmdhist
shopt -s extglob

# managing history
set -o histexpand
export HISTCONTROL=ignoredups
export HISTSIZE=5000
BLUE=$(echo -e '\e[0;34m')
NORMAL=$(echo -e '\e[0m')
export HISTTIMEFORMAT="${BLUE}[%Y/%m/%d@%H:%M:%S]${NORMAL} "
export HISTIGNORE=[bf]g:clear:history:ls:screen:*QUALYS*
# write directly to .bash_history
shopt -s histappend histreedit histverify

# some aliases
alias cd..='cd ..'
#alias cp='cp -i'
alias d='ls --color'
alias df='df -h -x supermount'
alias du='du -h'
alias egrep='egrep --color'
alias fgrep='fgrep --color'
alias grep='grep --color'
alias l='ls --color'
alias la='ls -a --color'
alias ll='ls -lhtr --color'
alias ls='ls -F --show-control-chars --color=auto'
alias lsd='ls -d */'
#alias mv='mv -i'
alias p='cd -'
alias rd='rmdir'
#alias rm='rm -i'
alias psc='ps xawf -eo pid,user,cgroup,args'

# server id card by cyayon
alias idcard='cat /etc/issue'
