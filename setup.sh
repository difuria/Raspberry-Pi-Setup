#!/bin/bash

# Ensure raspberry pi is fully up to date
echo "Update Raspberry pi OS"
sudo apt update
sudo apt full-upgrade -y
# Remove any redundant packages
sudo apt autoremove -y

# Linux tools
echo "Installing Linux Tools"
sudo apt-get install ack-grep -y
sudo apt-get install gh -y
sudo apt-get install locate -y
sudo apt-get install vim -y
sudo apt-get install zsh -y

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

# Python bits
echo "Installing and updating Python packages"
pip install --upgrade pip
pip install pipenv

# HEIC isn't viewable with the current packages
sudo apt install heif-gdk-pixbuf

sudo updatedb

# Reboot
echo "Rebooting system to ensure changes have taken effect"
sleep 5
sudo reboot
