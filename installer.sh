#!/bin/bash

CYAN='\033[0;36m'

if (( $EUID != 0 )); then
    echo -e "${CYAN}Bitte führen sie dieses Skript als Root aus!"
    exit
fi

clear


block(){
# Update the package list
sudo apt update

# Install Apache2 package
sudo apt install apache2 -y

# Enable Apache2 on system startup
sudo systemctl enable apache2

# Start Apache2 service
sudo systemctl start apache2

# Check Apache2 status
sudo systemctl status apache2
}

block1(){
    while true; do
        read -p "Sind Sie sicher, dass Sie Apache2 auf ihrem Gerät/Server installieren möchten? [y/n]? " yn
        case $yn in
            [Yy]* ) block; break;;
            [Nn]* ) exit;;
            * ) echo "Bitte antworten mit Ja [y] oder Nein [n]";;
        esac
    done
}

block1
