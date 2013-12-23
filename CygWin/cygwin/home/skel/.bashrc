# To the extent possible under law, the author(s) have dedicated all 
# copyright and related and neighboring rights to this software to the 
# public domain worldwide. This software is distributed without any warranty. 
# You should have received a copy of the CC0 Public Domain Dedication along 
# with this software. 
# If not, see <http://creativecommons.org/publicdomain/zero/1.0/>. 

# base-files version 4.1-1

# ~/.bashrc: executed by bash(1) for interactive shells.

# The latest version as installed by the Cygwin Setup program can
# always be found at /etc/defaults/etc/skel/.bashrc

# Modifying /etc/skel/.bashrc directly will prevent
# setup from updating it.

# The copy in your home directory (~/.bashrc) is yours, please
# feel free to customise it to create a shell
# environment to your liking.  If you feel a change
# would be benifitial to all, please feel free to send
# a patch to the cygwin mailing list.

# User dependent .bashrc file

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# Shell Options
#
# See man bash for more options...
#
# Don't wait for job termination notification
# set -o notify
#
# Don't use ^D to exit
set -o ignoreeof
#
# Use case-insensitive filename globbing
shopt -s nocaseglob
#
# Make bash append rather than overwrite the history on disk
shopt -s histappend
#
# When changing directory small typos can be ignored by bash
# for example, cd /vr/lgo/apaache would find /var/log/apache
shopt -s cdspell

# Completion options
#
# These completion tuning parameters change the default behavior of bash_completion:
#
# Define to access remotely checked-out files over passwordless ssh for CVS
# COMP_CVS_REMOTE=1
#
# Define to avoid stripping description in --option=description of './configure --help'
COMP_CONFIGURE_HINTS=1
#
# Define to avoid flattening internal contents of tar files
COMP_TAR_INTERNAL_PATHS=1
#
# Uncomment to turn on programmable completion enhancements.
# Any completions you add in ~/.bash_completion are sourced last.
[[ -f /etc/bash_completion ]] && . /etc/bash_completion

# History Options
#
# Don't put duplicate lines in the history.
# export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
#
# Ignore some controlling instructions
# HISTIGNORE is a colon-delimited list of patterns which should be excluded.
# The '&' is a special pattern which suppresses duplicate entries.
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit'
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls' # Ignore the ls command as well
#
# Whenever displaying the prompt, write the previous line to disk
# export PROMPT_COMMAND="history -a"

# Aliases
#
# Some people use a different file for aliases
if [ -f "${HOME}/.bash_aliases" ]; then
   source "${HOME}/.bash_aliases"
fi
#
# Some example alias instructions
# If these are enabled they will be used instead of any instructions
# they may mask.  For example, alias rm='rm -i' will mask the rm
# application.  To override the alias instruction use a \ before, ie
# \rm will call the real rm not the alias.
#
# Interactive operation...
# alias rm='rm -i'
# alias cp='cp -i'
# alias mv='mv -i'
#
# Default to human readable figures
# alias df='df -h'
# alias du='du -h'
#
# Misc :)
# alias less='less -r'                          # raw control characters
# alias whence='type -a'                        # where, of a sort
alias grep='grep --color'                     # show differences in colour
alias egrep='egrep --color=auto'              # show differences in colour
alias fgrep='fgrep --color=auto'              # show differences in colour
#
# Some shortcuts for different directory listings
alias ls='ls -hF --color=tty'                 # classify files in colour
alias dir='ls --color=auto --format=vertical'
# alias vdir='ls --color=auto --format=long'
alias ll='ls -l'                              # long list
alias la='ls -A'                              # all but . and ..
alias l='ls -CF'                              #

# Umask
#
# /etc/profile sets 022, removing write perms to group + others.
# Set a more restrictive umask: i.e. no exec perms for others:
# umask 027
# Paranoid: neither group nor others have any perms:
# umask 077

# Functions
#
# Some people use a different file for functions
if [ -f "${HOME}/.bash_functions" ]; then
   source "${HOME}/.bash_functions"
fi
#
# Some example functions:
#
# a) function settitle
# settitle () 
# { 
#   echo -ne "\e]2;$@\a\e]1;$@\a"; 
# }
# 
# b) function cd_func
# This function defines a 'cd' replacement function capable of keeping, 
# displaying and accessing history of visited directories, up to 10 entries.
# To use it, uncomment it, source this file and try 'cd --'.
# acd_func 1.0.5, 10-nov-2004
# Petar Marinov, http:/geocities.com/h2428, this is public domain
cd_func ()
{
  local x2 the_new_dir adir index
  local -i cnt

  if [[ $1 ==  "--" ]]; then
    dirs -v
    return 0
  fi

  the_new_dir=$1
  [[ -z $1 ]] && the_new_dir=$HOME

  if [[ ${the_new_dir:0:1} == '-' ]]; then
    #
    # Extract dir N from dirs
    index=${the_new_dir:1}
    [[ -z $index ]] && index=1
    adir=$(dirs +$index)
    [[ -z $adir ]] && return 1
    the_new_dir=$adir
  fi

  #
  # '~' has to be substituted by ${HOME}
  [[ ${the_new_dir:0:1} == '~' ]] && the_new_dir="${HOME}${the_new_dir:1}"

  #
  # Now change to the new dir and add to the top of the stack
  pushd "${the_new_dir}" > /dev/null
  [[ $? -ne 0 ]] && return 1
  the_new_dir=$(pwd)

  #
  # Trim down everything beyond 11th entry
  popd -n +11 2>/dev/null 1>/dev/null

  #
  # Remove any other occurence of this dir, skipping the top of the stack
  for ((cnt=1; cnt <= 10; cnt++)); do
    x2=$(dirs +${cnt} 2>/dev/null)
    [[ $? -ne 0 ]] && return 0
    [[ ${x2:0:1} == '~' ]] && x2="${HOME}${x2:1}"
    if [[ "${x2}" == "${the_new_dir}" ]]; then
      popd -n +$cnt 2>/dev/null 1>/dev/null
      cnt=cnt-1
    fi
  done

  return 0
}

alias cd=cd_func


#!/bin/bash
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

echo "Running customized ~/.bashrc script: '$0' ......."

## These are already set in /etc/bash.bashrc, so commented out here
## don't put duplicate lines in the history. See bash(1) for more options
## don't overwrite GNU Midnight Commander's setting of `ignorespace'.
## HL: allow 1,000,000 history lines (including timestamp comment lines, etc)
#HISTTIMEFORMAT="%Y-%m-%d %H:%M:%S " # trailing space makes history log look nicer
## allow 100K lines
#HISTFILESIZE=1000000
#HISTSIZE=HISTFILESIZE
## WARNING: don't forget to put the HISTSIZE lines above in /etc/bashrc too, otherwise a cron-launched shell will truncate your history file
#HISTCONTROL=${HISTCONTROL}+ignoredups
## ... or force ignoredups and ignorespace
#HISTCONTROL=ignoreboth

#  append the history file after each session
#  allow failed command substittution to be re-edited
#  command substitions are first presented to user before execution
shopt -s histappend histreedit histverify

# prevent users from modifying these variables
# bu
# readonly HISTFILE
#readonly HISTFILESIZE
#readonly HISTSIZE
#readonly HISTCONTROL
#readonly HISTIGNORE
#readonly HISTTIMEFORMAT

# from stackoverflow to append pwd:
# export PROMPT_COMMAND='hpwd=$(history 1); hpwd="${hpwd# *[0-9]*  }"; if [[ ${hpwd%% *} == "cd" ]]; then cwd=$OLDPWD; else cwd=$PWD; fi; hpwd="${hpwd% ### *} ### $cwd"; history -s "$hpwd";'
# appends the pwd, but not the date, and my HISTTIMEFORMAT screws it up:
# export PROMPT_COMMAND='hpwd=$(history 1); hpwd="${hpwd# *[0-9]*  }"; if [[ ${hpwd%% *} == "cd" ]]; then cwd=$OLDPWD; else cwd=$PWD; fi; hpwd="${hpwd% ### *} ### $cwd"; history -s "$hpwd";'

# allow ctrl-S for history navigation (with ctrl-R)
# stty -ixon

# make sure commands are logged immediately upon execution to a separate history file
#export PROMPT_COMMAND="history -a;$PROMPT_COMMAND" # though there shouldn't be anything in PROMPT_COMMAND yet
# this is modeled after http://www.dslreports.com/forum/r22481881-
#export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND ; }"'echo $$ $USER "$(history 1)" >> ~/.bash_history_audit'

# history -c # clears the current command history
# history -r # restores/retrieves the current history list from a file (default file is .bash_history?)
# export HISTSIZE=0 # stops saving history for this session
# unset HISTSIZE # stops saving history for this session
# history -w history-list.txt # export history to a file
# history -a history-list.txt # append the current history to an existing history file previously created with -w or -a
# history -r history-list.txt # retreive commands from a file and place in your current history list

# could probably also record the pwd (cwd) using the variable that is storing the directories for back and pushd and popd or $PWD
#echo "Prompt command: '${PROMPT_COMMAND}'" # /etc/bash.bashrc already contains a prompt command that saves/syncs history
# export PROMPT_COMMAND='echo "# cd $PWD" >> ~/.bash_history; '$PROMPT_COMMAND
export PROMPT_COMMAND='echo "# cd $PWD" >> ~/.bash_history_forever; '$PROMPT_COMMAND
export PROMPT_COMMAND="history -a; history -c; history -r; history 1 >> ~/.bash_history_forever; $PROMPT_COMMAND"
readonly PROMPT_COMMAND

# more history securing suggestions: 
#   sudo chown root:user ~/.bash_history_audit
#   sudo chmod 620 ~/.bash_history_audit
#   chattr +a ~/.bash_history_audit

# in an interactive terminal, execute a directory name as if you'd preceded it with "cd "
shopt -s autocd
# directory mispellings in a cd command are automatically corrected
# this can be dangerous in a script that cd's to a directory and then does an rm -rf *
shopt -s cdspell
# if the string after a cd command is not a valid directory, 
# then assume it's a variable name and try to cd to the directory indicated in the variable
shopt -s cdable_vars
# source command uses $PATH to search for scripts (set by default already)
shopt -s sourcepath
# command completion won't search $PATH for an empty command pattern
shopt -s no_empty_cmd_completion
# multiline commands are stored in a single history entry
shopt -s cmdhist
# (...) = (pattern1|pattern2|...)
# enables glob syntax like: ?(...) = 0/1, *(...) = >=0, +(...) = >=1, @(...) = OR, !(...) = NOT-OR
shopt -s extglob        # Necessary for programmable completion.
# indexes all executable commands on the path with a hashtable and checks it before doing a full path search for a command
# shopt -s checkhash
# apache style **/ and ** syntax in glob patterns
shopt -s globstar


#export GDFONTPATH="/usr/share/fonts/truetype/ttf-bitstream-vera"
#export GNUPLOT_DEFAULT_GDFONT="Vera.ttf"
export GDFONTPATH="/usr/share/fonts/truetype/ttf-dejavu"
export GNUPLOT_DEFAULT_GDFONT="DejaVuSans.ttf"
# yii stuff
export webroot="/var/www"
export wwwroot="/var/www"
#export YIIFRAMEWORK="${HOME}/src/yii-read-only/framework"
#export YIIROOT="${HOME}/src/yii-read-only"


# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS
shopt -s checkwinsize


# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

function parse_git_branch {
 git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/*[ \t]\(.*\)/\1/'
}

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

PS1="$PS1\[\033[00;32m\]\$(parse_git_branch)\[\033[00m\]
\$ "

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ${HOME}/.dircolors && eval "$(dircolors -b ${HOME}/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias pgrep='grep --color=auto --perl-regexp'
    alias fgrep='fgrep --color=auto --fixed-strings'
    alias egrep='egrep --color=auto --extended-regexp'
fi

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ${HOME}/.bash_aliases ]; then
    source ${HOME}/.bash_aliases
fi

## enable programmable completion features (you don't need to enable
## this, if it's already enabled in /etc/bash.bashrc and /etc/profile
## sources /etc/bash.bashrc).
#if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
#    . /etc/bash_completion
#fi

# already done in /etc/bash.bashrc

# HL: shell variable containing list of paths to append to PATH
MOREUSERPATHS=("." "/usr/share/fslint/fslint" "${HOME}/bin" "${HOME}/bin/python-scripts" "/usr/local/heroku/bin")
for p in ${MOREUSERPATHS[*]}; do # Interestingly indexing with [*] or [@] seem to do the same thing.
 if [ -d ${p} ] ; then
     echo "Adding to '$p' to \$PATH"
     export PATH="${p}:${PATH}"
 else
   echo "       Unable to add $p to \$PATH."
 fi
done

##export PYTHONPATH="$USER/.ipython'
#MOREUSERPYTHONPATHS=("$HOME/bin/python-scripts" "$HOME/src/tagim" "$HOME/src/tagim/tg" "$HOME/src/pyexiv2" )
#for p in ${MOREUSERPYTHONPATHS[*]}; do # Interestingly indexing with [*] or [@] seem to do the same thing.
#  if [ -d ${p} ] ; then
#      echo "Adding to PYTHONPATH -- $p"
#      export PYTHONPATH="${p}:${PYTHONPATH}"
#  else
#    echo "Error: Couldn't find $p !!!!!!!!"
#    echo "       Unable to add $p to PYTHONPATH."
#  fi
#done

export HOBSTIMEFORMAT="%Y-%m-%d-%H-%M-%S"
export DATE=`date +"${HOBSTIMEFORMAT}"`


echo "Finished running $USER's customized bash configuration script:  '$0'."



# ### Added by the Heroku Toolbelt
# export PATH="/usr/local/heroku/bin:$PATH"


# INSERTED BY get-django.sh on 2013-10-02-13-32-16

export PROJECT_HOME="$HOME/src"
export WORKON_HOME="$HOME/.virtualenvs"
source /usr/bin/virtualenvwrapper.sh
# END INSERTION BY get-django.sh


