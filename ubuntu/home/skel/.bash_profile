# ~/.bash_profile: executed by bash(1) for login shells.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.
echo "Running Hobson's .bash_profile script."
# the default umask is set in /etc/login.defs
#umask 022

# include .bashrc if it exists
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# xnetload -if usb0 -ni -nc -u 4 -a 50

# . $(which byobu-launch)


