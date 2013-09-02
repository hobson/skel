# install.sh
# Bash script for creating symlinks from Ubuntu or Centos system into skel folder files
# so that system can be updated with a git pull


ln -s "$HOME/skel/ubuntu/home/hobs/.virtualenvs/postactivate" "$HOME/.virtualenvs/"
ln -s "$HOME/skel/ubuntu/home/hobs/.virtualenvs/preactivate" "$HOME/.virtualenvs/"
ln -s "$HOME/src/skel/ubuntu/home/hobs/.bashrc" "$HOME/.bashrc"

