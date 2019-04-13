#! /bin/bash

Colour='\033[1;31m'
Color_Off='\033[0m'

echo -e "${Colour}By using this script, you'll adjust the password, update the system and install the stable UniFi controller of your choice.\nUse CTRL+C to cancel the script\n\n${Color_Off}"

# echo -e "${Colour}\nChange your password:\nThe initial default password for rapbian is 'raspberry' \n\nYou can press enter if you don't want to enter a new password\n${Color_Off}"
# passwd

echo -e "${Colour}\n\nThe system will now upgrade all the software and firmware, as well as clean up old/unused packages.\n${Color_Off}"
sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get autoremove && sudo apt-get autoclean

echo -e "${Colour}\n\nBefore installing the UniFi Controller, it will first install OpenJDK 8.\n${Color_Off}"
sudo apt-get install openjdk-8-jre-headless -y

# echo -e "${Colour}\n\nIn order to fix an issue which can cause a slow start for the UniFi controller, haveged is installed.\n${Color_Off}"
# sudo apt-get install haveged -y


echo -e "${Colour}\n\nNow to actually install the UniFi Controller....\n${Color_Off}"

echo -e "${Colour}Add a new source to the list of sources from which packages can be obtained with 'apt'\n${Color_Off}"
echo 'deb http://www.ubnt.com/downloads/unifi/debian stable ubiquiti' | sudo tee /etc/apt/sources.list.d/100-ubnt-unifi.list

echo -e "${Colour}\n\nAdd the GPG keys\n${Color_Off}"
sudo wget -O /etc/apt/trusted.gpg.d/unifi-repo.gpg https://dl.ubnt.com/unifi/unifi-repo.gpg

echo -e "${Colour}\n\nUpdate the package list and install UniFi controller\n${Color_Off}"
sudo apt-get update
sudo apt-get install unifi -y

echo -e "\033[1;37m \n\nCreated by https://github.com/Arsenull\n${Color_Off}"
