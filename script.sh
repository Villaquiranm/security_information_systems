cd /home/vagrant ##Move to home directory
echo hola > pass.txt
wget --progress=bar:force http://cyseclabs.com/pub/upstream44.c
sudo apt-get --assume-yes install build-essential  ## gcc compiler
sudo apt-get -y -o Dpkg::Options::="--force-confnew" install linux-image-4.4.0-116-generic
#sudo apt-get -y -o Dpkg::Options::="--force-confnew" remove linux-image-4.4.0-139-generic linux-headers-4.4.0-139-generic
sudo apt-get -y -o Dpkg::Options::="--force-confnew" remove linux-image-$(uname -r) linux-headers-$(uname -r) 
sudo reboot
