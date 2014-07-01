#!/usr/bin/env bash
#.bash_aliases

# bash.info 6.6 Aliases: 
#  "If the last character of the alias value is a space or tab character, 
#   then the next command word following the alias is also checked for alias expansion."
# The following command has sudo "honor"/expand aliases (if defined within /etc/.bashrc and /root/.bashrc)
#  e.g. alias rm='rm -i' will make `sudo rm` interractive (which is usually what you want)
# However, intervening options to sudo (like -u or -s) will break the alias expansion.
alias sudo=sudo$'\t'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ${HOME}/.dircolors && eval "$(dircolors -b ${HOME}/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    # alias pgrep='grep --color=auto --perl-regexp'
    alias fgrep='fgrep --color=auto --fixed-strings'
    alias egrep='egrep --color=auto --extended-regexp'
fi

# -I is less likely to interfere than -i (only asks once, and only for more than 3 files)
alias rm='rm -I'