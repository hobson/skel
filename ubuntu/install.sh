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
curl -O https://linux.dropbox.com/packages/ubuntu/dropbox_2015.02.12_amd64.deb
sudo dpkg -i dropbox_2015.*.*.deb

sudo apt-get update
sudo apt-get upgrade
sudo add-apt-repository ppa:thefanclub/grive-tools
sudo apt-get install dconf-editor usbmount
sudo add-apt-repository ppa:webupd8team/sublime-text-2
sudo apt-get install meld
mkdir -p ~/src
mkdir -p ~/tmp
cd ~/tmp
curl -O https://bootstrap.pypa.io/get-pip.py
sudo python get-pip.py
pip install --upgrade pip
sudo pip install --upgrade virtualenv
sudo pip install --upgrade virtualenvwrapper
curl https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2015.02.12_amd64.deb
sudo dpkg -i dropbox_2015.02.12_amd64.deb
sudo apt-get install libappindicator*
sudo apt-get install libappindicator-dev
sudo apt-get -f install
# sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo cp -a /media/inateck-usbdrive/etc/security/*.env.sh /etc/security
sudo cp -a /media/inateck-usbdrive/etc/security/*.sh /etc/security
sudo meld /etc/ssh/ssh_config /media/inateck-usbdrive/etc/ssh/ssh_config
sudo apt-get install -y openssh-server openssh-blacklist*
apt-file update
openssl-vulnkey -V ~/.ssh/id_rsa

sudo add-apt-repository ppa:webupd8team/sublime-text-2
sudo apt-get update
sudo apt-get install -y sublime-text-2
sudo apt-get install git
subl

sudo apt-get upgrade
sudo apt-get autoremove
sudo apt-get install -y unity-tweak-tool compizconfig-settings-manager
wget -q -O – https://fixubuntu.com/fixubuntu.sh | bash
sudo apt-get install -y gconf-editor
sudo apt-get install -y icedtea-7-plugin
sudo do-release-upgrade
sudo apt-get install -y flashplugin-installer
sudo apt-get install -y ubuntu-restricted-extras
# sudo gsettings reset com.canonical.desktop.interface scrollbar-mode
sudo gsettings set com.canonical.desktop.interface scrollbar-mode normal
sudo apt-get install -y dsyslog
duso apt-get install -y postgresql*
sudo apt-get install pgadmin3
sudo add-apt-repository "deb http://us.archive.ubuntu.com/ubuntu/ saucy universe multiverse"
sudo add-apt-repository "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main"

lsb_release -a
sudo sed s/=lts/=normal/ -i /etc/update-manager/release-upgrades
more /etc/update-manager/release-upgrades
sudo do-release-upgrade

syndaemon -i 2 -k -d
sudo add-apt-repository ppa:atareao/atareao
sudo apt-get update
sudo apt-get install -y touchpad-indicator
sudo apt-get install -y python-dev
sudo apt-get install -y pandoc
sudo apt-get install -y texlive-latex-recommended texlive-xetex texlive-luatex pandoc-citeproc
sudo apt-get install -y libjpeg-dev
sudo apt-get install -y glipper
glipper &
sudo apt-get install -y python-numpy python-scipy python-matplotlib ipython ipython-notebook python-pandas python-sympy python-nose
curl -O http://neuro.debian.net/lists/utopic.us-ca.full
cat utopic.us-ca.full | sudo tee /etc/apt/sources.list.d/neurodebian.sources.list
sudo apt-key adv --recv-keys --keyserver hkp://pgp.mit.edu:80 0xA5D32F012649A5A9
sudo apt-get update
sudo apt-get install -y python-mvpa
sudo apt-get install -y pygtk-* libpng*
sudo apt-get install -y lapack* libatlas* libblas* build-essential gfortran freetype*
mkvirtualenv pug
sudo -H pip install --upgrade markupsafe
pip install --upgrade numpy
pip install --upgrade pandas
pip install --upgrade pip
pip install --upgrade python-qt5
pip install --upgrade ipython[all] Django Django-extensions
pip install --upgrade matplotlib
pip install --upgrade scipy
pip install --upgrade --process-dependency-links numpy scipy scikit-learn --editable /home/hobs/src/pybrain --editable /home/hobs/src/pug-nlp/ --editable /home/hobs/src/pug-ann/ --editable /home/hobs/src/pug-invest --editable /home/hobs/src/pug-dj --editable /home/hobs/src/pug
pip install --upgrade --process-dependency-links --editable /home/hobs/src/pug-nlp/
pip install --upgrade --process-dependency-links --editable /home/hobs/src/pug-ann/
pip install --upgrade --process-dependency-links --editable /home/hobs/src/pug/

sudo touch /forcefsck
sudo apt-get install -F
sudo apt-get update
sudo apt-get upgrade
sudo apt-get autoremove
sudo apt-get upgrade -y
sudo apt-get dist-upgrade
sudo apt-get autoremove
sudo apt-get upgrade dsyslog
sudo apt-get check
sudo apt-get autoclean
sudo apt-get update
sudo apt-get upgrade
pip install -v scikit-learn --allow-external scikit-learn
pip install -v scipy --allow-external scipy
# nano /home/hobs/.virtualenvs/kaggle/local/lib/python2.7/site-packages/matplotlib/mpl-data/matplotlibrc
pip install PySide
sudo apt-get install cmake
sudo do-release-upgrade
sudo pip install --upgrade virtualenvwrapper
workon kaggle
lsblk
ln -s /media/hobs/eeccb85b-2dff-462a-a81f-c94ba6bbf2ee/ /media/inateck-usbdrive/home/
sudo ln -s /media/hobs/eeccb85b-2dff-462a-a81f-c94ba6bbf2ee/ /media/inateck-usbdrive/home/
sudo mkdir /media/fedora-root
sudo mount /dev/mapper/fedora-root /media/fedora-root
sudo mkdir /media/fedora-home
sudo mount /dev/mapper/fedora-home /media/fedora-home
sudo mkdir /media/fedora-swap
sudo mount /dev/fedora-swap /media/fedora-swap
sudo mount /dev/mapper/fedora-swap /media/fedora-swap
sudo apt-get install udev autofs
sudo apt-get install --install-suggests autofs
nano /etc/auto.master
sudo nano /etc/auto.master
udevinfo /dev/sdc1
cd fedora-root/etc
mkdir -p ~/bashrc.bak/etc
cp bash* ~/bashrc.bak/etc/
mkdir ~/fedora-hidden
cp -r .g* ~/fedora-hidden
sudo add-apt-repository ppa:atareao/atareao
sudo apt-get update
sudo apt-get install touchpad-indicator
touchpad-indicator &
exit
sudo nano /etc/grub.d/README
sudo nano /etc/default/grub

sudo apt-get install libcffi cffi python-cffi-dbg python3-cffi-dbg libffi-dev libffi6-dbg libssl-dev libssl-dbg
pip install --upgrade --editable /home/hobs/src/pug-nlp/

/opt/extras.ubuntu.com/touchpad-indicator/bin/touchpad-indicator
cd /opt/extras.ubuntu.com/touchpad-indicator
ls 0al
ls -al
cd bin
ls 0al
ls -al
cd ..
which touchpad-indicator
echo $PATH
cd bin
touchpad-indicator
bg
sudo apt-get install pgadmin3
man useradd
man adduser
useradd --version
adduser --help
adduser -v
useradd -v
useradd -0version
man adduser
adduser pellego
sudo adduser pellego

######################################
# Dependencies for ARAC -- the fast PyBrain Artificial Neural Net Fortran + C lib

sudo apt-get install libatlas-base-dev scons swig

# gtest (google test framework)
cd ~/Downloads/
ls
wget http://googletest.googlecode.com/files/gtest-1.7.0.zip
unzip gtest-1.7.0.zip
cd gtest-1.7.0
./configure
make
sudo cp -a include/gtest /usr/include
sudo cp -a lib/.libs/* /usr/lib/
sudo ldconfig -v | grep gtest

mkdir -p ~/src/installed-and-linked
cd ~/src/installed-and-linked
git clone git://github.com/bayerj/arac.git
cd arac
scons
# sudo ln -s libarac.so /usr/local/lib/libarac.so
# sudo ln -s `pwd`/libarac.so /usr/local/lib/libarac.so
sudo cp libarac.so /usr/lib/
./test-arac

export PYTHONPATH=$PYTHONPATH:`pwd`/src/python

# the atom text editor and IDE
sudo dpkg -i $(curl -w "%{filename_effective}" -LO $(curl -s https://api.github.com/repos/atom/atom/releases | grep browser_download_url | grep '64[.]deb' | head -n 1 | cut -d '"' -f 4))

# make sure the mlocate db indexes encrypted home directories etc
sudo cp /etc/sudoers /etc/sudoers.$(date +%Y-%m-%d--%H_%M_%S).bak
sudo sed 's/[#]?timestamp_timeout\s.*$/timestamp_timeout 30/g' -i /etc/sudoers
