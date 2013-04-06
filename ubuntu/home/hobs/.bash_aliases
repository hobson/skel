if [ -a /etc/security/hobs/cred.sh ]
    then source /etc/security/hobs/cred.sh
    else echo '.bash_aliases was unable to find the reuired security/hobs/cred.sh config file'
fi

alias dj='ssh hobson@hobsonlane.com -t "cd ~/hobsonlane.com/ ; bash"'


# Failed attempt to mount the dreamhost shared folder once the network had booted up
# delayed_mount&

# for octave "edit command", m-file script editing
# EDITOR='xterm -e scite -save.session'

# for octave, python, and other text files
EDITOR='xterm gedit'

# from http://www.dephyr.com/browse.php?u=Oi8vd3d3LmNvbW1hbmRsaW5lZnUuY29tL2NvbW1hbmRzL3RhZ2dlZC8yOS9oaXN0b3J5&b=13
# delete the last line that was added to your history (credentials or other security information inadvertently added to command history
alias histdelete='history -d $((HISTCMD-2)) && history -d $((HISTCMD-1))' 

alias sshlc='ssh -p $PORT_LIFERCLUB hobs@liferclub.com'
alias sshslice='ssh -p $PORT_LIFERCLUB hobs@liferclub.com'
alias free='free -m'
alias update='sudo aptitude update'
alias install='sudo aptitude -y install'
#alias search='aptitude search'
alias search='recoll -t'
alias upgrade='sudo aptitude -y safe-upgrade'
alias remove='sudo aptitude remove'
alias rsynclc="rsync -htv -e \"ssh -p $PORT_LIFERCLUB\""
alias scplc="scp -v -P $PORT_LIFERCLUB"
alias pwd='pwd -P'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
# alias ls='ls -h'
# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias lh='ls -h'
# | doesn't work on some versions of bash/dash
# alias lss="command -p ls -al --sort=size | tr -s '\t' | tr -s ' ' | cut -d ' ' -f 5,8"
alias df='df -h'
alias calc='calc.sh'
alias cd..='cd ..'

#alias homefiles="sudo mlocate -i \$(echo \"\$HOME\")/"
#alias homelocate='homefiles | grep -i'
alias herefiles="sudo mlocate -i \$(echo \"\$PWD\")/"
alias herelocate='herefiles | grep -i'
alias locatehere='herelocate'
alias locatecd='herelocate'
alias cdlocate='herelocate'
dolocate () { echo "${1} $(herefiles | grep -i ${2} | head -n 1 | xargs -n 1 -d '\n')" | env bash; }
locatedo () { echo "${2} $(herefiles | grep -i ${1} | head -n 1 | xargs -n 1 -d '\n')" | env bash; }
alias sulocate='sudo mlocate -i'
alias slocate='sudo mlocate -i'

#lsgrep () { g=$2;d=$1; if [ $# == 1 ]; then d='.';g=$1;fi; ls -R | grep "${g}"; }
lsgrep () { g=$2;d=$1; if [ $# == 1 ]; then d='.';g=$1;fi; find "${d}" -type f -print | grep "${g}"; }
 
alias newdb='sudo source newdb.sh'
alias mansearch='man -k'
alias manfind='mansearch'
alias searchman='mansearch'
alias findman='mansearch'
#alias tagim='tagim.py'
manopt () { man $1 | egrep -A 11 -B 1 "^\s**.*\s\-\-$2|^\s**\-$2"; } # actHL: if [len($2)>1]; then grep regex1; else grep regex2;
#alias manopt="man -P cat ${1} 1> /dev/null > ~/tmp/.manopt.tmp.txt;egrep -A 10 -B 1 '^\s**\-${2}' ~/tmp/.manopt.tmp.txt"
# && and & behave differently
# && is really a binary AND, so each side is evaluated one at a time, from left to right
# the "newsite-env/bin/activate" won't "stick" if it is followed anywhere down the line by a & rather than an &&
# even if it is immediately followed by a semicolon (;)
# man and info about bash seem to indicate that & is used at the end of a statement
# && seems to mean "do the first command then do the second command", whereas
# & seems to mean "spawn a new task to do the first command then do the second command within the current session"
# it's probably better to explicity spawn tasks using nice, especially for aliases, where arguments are hard to pass into the script otherwise
#alias gonewsite="source ${SAFEHOME}/bin/gonewsite.sh" 
#alias godevsite="source ${SAFEHOME}/bin/godevsite.sh" 
#alias gopinax="source ${SAFEHOME}/bin/gonewsite_script ${SAFEHOME}"
#alias gopinax="godevsite"
#alias godev="godevsite"
#alias gosrc="source gosrcsite.sh"
#alias go="source gosrcsite.sh"
alias go="cd ~/src/totalgood.com/pinax1site/ && source activate && python manage.py runserver";
alias gofresh="cd ~/src/totalgood.com/pinaxfresh/;source activate;python manage.py runserver;"
# WARN: don't ever call this start! it interferes with upstart
#alias startsrc="source gosrcsite.sh"

alias newdatabase="source ${SAFEHOME}/newsite-env/bin/activate;cd ${SAFEHOME}/newsite/;manage.py dumpdata --format=json --indent=2 > rateit/fixtures/initial_data.bak.json; manage.py reset_db --noinput;manage.py syncdb --noinput;sudo apache2ctl restart"
alias newmodel="source ${SAFEHOME}/newsite-env/bin/activate;cd ${SAFEHOME}/newsite/;sudo /etc/init.d/apache2 restart;manage.py syncdb --noinput;"
# actHL: trying to figure out how to do command line arguments in aliases, but this, oddly, doesn't work:
# alias myecho="echo 'hello ' $1 'world'"
gobookmark () { cd $(grep ${1} ${SAFEHOME}/.gtk-bookmarks | sed "s/file:\/\///" | xargs -n 1 -d '\n'); }
alias gb='gobookmark'
alias cdbm='gobookmark'
alias gobm='gobookmark'
alias cdbookmark='gobookmark'
alias Exit='exit'
alias cd="pushd $1 1> /dev/null" # to redirect all messages to null (including stderr) us "&> /dev/null"
alias back="popd $1 1> /dev/null"
alias bd="back"
alias pd="pushd $1 1> /dev/null" # the arguments [-n] [+N | -N] don't seem to work with these aliases
alias pwd='pwd -P'
alias pgrep='sudo pgrep -lf'
alias a2ensite='sudo a2ensite $1;sudo apache2ctl reload'
alias a2ctl='sudo apache2ctl'
alias apache2ctl='sudo apache2ctl'
alias newdb='${SAFEHOME}/bin/newdb.sh'
alias newdatabase='${SAFEHOME}/bin/newdb.sh'
# WARNING: this will conflict with the lv package lgrep command that encodes/decodes multilingual strings
#alias lgrep='command -p grep -E -l `find . -type f -print`'
# use a function rather than an alias when you need to use command line argument substitution
#rgrep () { command -p find . -type f -name "$2" -exec command -p grep "$1" ; }
# command means to ignore any aliases when selecting the command to run
bgedit () { command -p gedit "$@" & } # -p alters PATH so that only default linux commands are used
#sedit () { eval "sudo gedit $@" & } # doesn't work

# this allows you to type "ls | clip" to copy a directory list to the gtk clipboard to be pasted later with shift-ctrl-v
alias clip="xclip -selection c"
#alias copy="xclip -selection c"  # might get confused with cp
# this allows you to type "paste" to paste the gtk clipboard contents to /dev/stdout
#alias paste="pasteClipboard.py" 





#fc() { builtin fc -l -n "$@" > "fc.$DATE.sh" && gedit "fc.$DATE.sh" &; }

#alias bzr='sudo bzr'
#alias python=ipython # probably not a good idea, since wsgi and other applications will want to run python without all the interactive features to slow it down, but only way I could figure out to get django the command "manage.py shell

export BZR_EDITOR='nano'
#export BZR_EMAIL="Hobson Lane <hobsonlane@gmail.com>"

alias todo="sudo ${SAFEHOME}/bin/todo.sh"

alias yicc="sudo ${YIIFRAMEWORK}/yiic"
alias md5='openssl dgst -md5'
alias sha='openssl dgst -sha'
alias sha1='openssl dgst -sha1'
alias dgst='openssl dgst'

# git log and diff summary aliases
alias gitdiff='git log|grep commit|cut -d " " -f2|head -n 1|tail -n 1|xargs -n 1 git diff -R'
alias gitdiff-1='git log|grep commit|cut -d " " -f2|head -n 2|tail -n 1|xargs -n 1 git diff -R'
alias gitdiff-2='git log|grep commit|cut -d " " -f2|head -n 3|tail -n 1|xargs -n 1 git diff -R'
alias gitdiff-3='git log|grep commit|cut -d " " -f2|head -n 4|tail -n 1|xargs -n 1 git diff -R'
alias gitsum='git log|grep commit|cut -d " " -f2|head -n 1|tail -n 1|xargs -n 1 git diff -R --summary'
alias gitsum-1='git log|grep commit|cut -d " " -f2|head -n 2|tail -n 1|xargs -n 1 git diff -R --summary'
alias gitsum-2='git log|grep commit|cut -d " " -f2|head -n 3|tail -n 1|xargs -n 1 git diff -R --summary'
alias gitsum-3='git log|grep commit|cut -d " " -f2|head -n 4|tail -n 1|xargs -n 1 git diff -R --summary'
## need to reverse the order of the arguments
alias gitlog-1="git log --reverse|grep commit|cut -d ' ' -f2|tail -n 2|head -n 2|xargs echo|sed -e 's/\s/../'|xargs -n 1 git log --summary"
alias gitlog-2="git log --reverse|grep commit|cut -d ' ' -f2|tail -n 3|head -n 2|xargs echo|sed -e 's/\s/../'|xargs -n 1 git log --summary"
alias gitlog-3="git log --reverse|grep commit|cut -d ' ' -f2|tail -n 4|head -n 2|xargs echo|sed -e 's/\s/../'|xargs -n 1 git log --summary"
alias gitcd='cd $(git remote -v | grep -o -m1 "/[\w/]+")'


