# # shared folders from windows laptops on LAN
# sudo yum install -y nmap nfs-utils

# # recoll desktop file search and required file processing libs
# sudo yum install -y perl-image perl perl-image-base perl-Image-* antiword catppt lyx pstotext python-epub python-midi python-mutagen unrtf untex xls2csv catdoc recoll

# editors, note takers, dev env
#sudo yum install -y git hg git-hg nano meld anki xchat ghex gksudo python ipython python-devel python-yaml python-jinja2 gcc-c++  libpng-devel gnome-alternative-status-menu gnome-tweak-tool pygtk2-devel 

# # octave/matlab
# sudo yum install -y octave octave-general octave-general octave-specfun octave-struct octave-control octave-communications octave-optim octave-miscellaneous octave-image octave-gsl octave-symbolic

# # admin \
# sudo yum install -y liveusb-creator liveusb-creator gparted unetbootin
#
# # ansible (the ansible yum repo is pretty up-to-date)
# sudo yum install -y ansible
#
# # admin
# sudo yum install -y python-scipy scipy blas openblas-devel 
#
# # image processing
# sudo yum install -y f-spot LibRaw perl-Image-ExifTool ufraw dcraw darktable dcraw ufraw-gimp gimp gimp-xsane ImageMagick opencv opencv-devel opencv-python
#
# # networking services/daemons
# ddclient zlib-devel openssl-devel sqlite-devel bzip2-devel 
#
# # LAMP
# httpd httpd-devel mysql-server mysql-devel
#
# # android
# android-tools-adb android-tools Tkinter tkinter 
#
# # Media
# libdvdread libdvdcss libdvdnav gstreamer-plugins-ugly gstreamer-plugins-bad 

# Django
#sudo yum install -y postgresql postgresql-libs postgresql-devel psycopg

# # scikit
# sudo yum install -y gfortran gcc-gfortran python-scikit-learn libxml2-devel libxslt1-devel libpqxx-devel 
#
# # other
# sudo yum install -y whois ruby qbittorrent tk tk-dev tkinter tkinter-dvel tkinter-devel tkinter-dev tk-devel gdk agg agg-devel libpam0g-dev libpam0g pdfgrep gmp-devel gmp gmpy gmp, mpfr, mpc gmp, mpfr-devel, mpc-devel gmp mpfr-devel mpc-devel mpfr-devel mpir-devel libdvdread libdvdcss libdvdnav gstreamer-plugins-ugly gstreamer-plugins-bad acrobat-reader prolog gprolog wxPython pypy ansible blender libvpx.x86_64 libvpx pango krb5-libs audit-libs openssl-libs sqlitenss-softokn-freebl libvpx --skip-broken pango libvpx rabbitmq rabbitmq-server redis rubygem-heroku-api rubygem-heroku-api gimp-fourier gimp-fourier-plugin gtk+ ufraw-gimp 
#
# # dev
# sudo yum install -y parcellite rpl sed 

curl -O http://s.insynchq.com/builds/insync-1.0.28.31731-1.x86_64.rpm
sudo yum -y --nogpgcheck localinstall insync*.*.rpm 

#!/bin/sh
sudo yum install -y openssh-server openssh-clients git

curl https://raw.github.com/pypa/pip/master/contrib/get-pip.py | sudo python

sudo pip install --upgrade virtualenvwrapper paramiko PyYAML jinja2 httplib2

# install ansible src
mkdir -p $HOME/src
cd $HOME/src
git clone git://github.com/ansible/ansible.git
cd ansible
source hacking/env-setup

# move the localhost ssh port and configure selinux to allow that port
sudo mkdir -p /etc/ansible/
echo '127.0.0.1' | sudo tee -a /etc/ansible/hosts
sudo semanage port -a -t ssh_port_t -p tcp 27182 
sudo sed -e 's/^[#]\?[ ]\?Port.*$/Port 27182/g' -i /etc/ssh/sshd_config
#sudo sed -e 's/^#[ ]\?ListenAddress[ ]0[.].*$/ListenAddress 0.0.0.0\nListenAddress 127.0.0.1/g' -i /etc/ssh/sshd_config
#echo 'AllowUsers hobs ansible root' | sudo tee -a /etc/ssh/sshd_config
#sudo service sshd restart

# make sure this computer and user can ssh to itself!
touch $HOME/.ssh/authorized_keys
chmod 700 ~/.ssh && chmod 600 ~/.ssh/*
cat $HOME/.ssh/id_rsa.pub >> $HOME/.ssh/authorized_keys 
sudo sysctl restart sshd

# finally, install the dotfiles ansible workspace in a ~/ansible_workspace folder
export ANSIBLE_WORKSPACE=$HOME/ansible_workspace 
mkdir -p $ANSIBLE_WORKSPACE
cd $ANSIBLE_WORKSPACE
git clone git@github.com:hobson/dotfiles.git

