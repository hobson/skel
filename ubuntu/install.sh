# install.sh
# Bash script for creating symlinks from Ubuntu or Centos system into skel folder files
# so that system can be updated with a git pull


ln -s "$HOME/skel/ubuntu/home/hobs/.virtualenvs/postactivate" "$HOME/.virtualenvs/postactivate"
ln -s "$HOME/skel/ubuntu/home/hobs/.virtualenvs/preactivate" "$HOME/.virtualenvs/preactivate"

ln -s "$HOME/src/skel/ubuntu/home/hobs/.bashrc" "$HOME/.bashrc"

sudo add-apt-repository ppa:thefanclub/grive-tools
sudo apt-get update -y
sudo apt-get install -y grive-tools

mkdir ~/tmp
cd ~/tmp
wget https://linux.dropbox.com/packages/ubuntu/dropbox_2015.02.12_amd64.deb
sudo apt-get install dropbox_2015.02.12_amd64.deb

