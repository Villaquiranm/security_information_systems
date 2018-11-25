cd /home/vagrant ##Move to home directory

##Download exploit
wget --progress=bar:force http://cyseclabs.com/pub/upstream44.c
## Install gcc compiler
sudo apt-get --assume-yes install build-essential
# install vulnerable kernel version and desinstall old one
# this command is complex because we need to force the package manager
# to keep the current package configuration...
# if not it will ask us to choose a configuration
# that is clearly not possible while buildind the Vagrant container
sudo apt-get -y -o Dpkg::Options::="--force-confnew" install linux-image-4.4.0-116-generic
sudo apt-get -y -o Dpkg::Options::="--force-confnew" remove linux-image-$(uname -r) linux-headers-$(uname -r)
# Reboot machine, this is necessary to charge the vulnerable kernel
sudo reboot
