#!/bin/bash

# Ensure raspberry pi is fully up to date
echo "Update Raspberry pi OS"
sudo apt update
echo y | sudo apt full-upgrade

# Linux tools
echo "Installing Linux Tools"
sudo apt-get install ack-grep
sudo apt-get install locate

# If the python version installed is less than 3 set up an alias for it
python_version=`echo "import sys
print(sys.version_info.major)
" | python`

if [ "$python_version" == "2" ]
then
    echo "Creating python 3 alias"
    echo "alias python=python3" >> ~/.bash_aliases
fi

# Resource bash files
source ~/.bashrc

# Add something to download image and change background

# Python bits
echo "Installing and updating Python packages"
pip install --upgrade pip
pip install pymongo
pip install dnspython

# Update background
cd ~
wget https://raw.githubusercontent.com/difuria/Raspberry-Pi-Setup/main/Sorrento%20%5B2019%5D%20-%2010.jpg
background_image='Sorrento [2019] - 10.jpg'
mv "$background_image" Pictures/
pcmanfm --set-wallpaper `pwd`/Pictues/"$background_image"

# Reboot
echo "Rebooting system to ensure changes have taken effect"
sleep(5)
sudo reboot
