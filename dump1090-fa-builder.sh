#!/bin/bash

DL_DIR=archlinux-dump1090-fa
INST_DIR=/usr/share/dump1090-fa-assets
USR=`whoami`
echo ""
echo -e "\e[1;32mInstalling (if not already installed) following Build Tools \e[39m"
echo ""
echo -e "\e[1;95m    git fakeroot make pkgconf gcc debugedit \e[39m"
echo ""
sleep 3
sudo pacman --needed -S git fakeroot make pkgconf gcc debugedit

echo ""
echo -e "\e[1;95mCreating dedicated folder \e[39m" ${INST_DIR} "\e[39m"
echo -e "\e[1;32mThis folder will hold cloned source-code and built package \e[39m"
sleep 3
sudo mkdir ${INST_DIR}
sudo chown ${USR} ${INST_DIR}
echo ""
echo -e "\e[1;32mCloning source-code of dump1090-fa \e[39m"
echo ""
sleep 3
git clone https://github.com/abcd567a/${DL_DIR} ${INST_DIR}/${DL_DIR}
echo ""
echo -e "\e[1;95mBuilding package dump1090-fa \e[39m"
echo ""
sleep 2
cd ${INST_DIR}/${DL_DIR}
makepkg -si

echo ""
echo ""
echo -e "\e[1;95mCloned source-code and built package are located in \e[0;39m"
echo -e "\e[1;95mdedicated folder \e[39m" ${INST_DIR} "\e[0;39m"
echo -e ""





