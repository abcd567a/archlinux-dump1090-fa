#!/bin/bash
set -e

SRC_URL=https://github.com/abcd567a/archlinux-dump1090-fa/raw/master
INST_DIR=/usr/share/dump1090-fa-builder
USR=`whoami`
echo ""
echo -e "\e[1;95mIf NOT already installed, \e[1;32mthen will install following Build Tools: \e[39m"
echo ""
echo -e "\e[1;95m    git fakeroot make pkgconf gcc debugedit \e[39m"
echo ""
sleep 3
sudo pacman --needed -S git fakeroot make pkgconf gcc debugedit

echo ""
echo -e "\e[1;95mCreating dedicated folder \e[39m" ${INST_DIR} "\e[39m"
echo -e "\e[1;32mThis folder will hold cloned source-code and built package \e[39m"
sleep 3

if [[ -d ${INST_DIR} ]]; then
   echo -e "\e[32mRenaming existing folder" \"${INST_DIR}\" "by adding prefix \"old\" \e[39m"
   sudo mv ${INST_DIR} ${INST_DIR}-old-$RANDOM
fi

sudo mkdir ${INST_DIR}
sudo chown ${USR} ${INST_DIR}

echo ""
echo -e "\e[1;32mDownloading necessary files from Github \e[39m"
echo ""
sleep 3
sudo wget -O ${INST_DIR}/PKGBUILD ${SRC_URL}/PKGBUILD
sudo chmod 666 ${INST_DIR}/PKGBUILD
sudo wget -O ${INST_DIR}/dump1090-fa.install ${SRC_URL}/dump1090-fa.install
sudo wget -O ${INST_DIR}/rtl-sdr.rules ${SRC_URL}/rtl-sdr.rules
echo ""
echo -e "\e[1;95mBuilding package dump1090-fa \e[39m"
echo ""
sleep 2
cd ${INST_DIR}
makepkg -si OPTIONS=-debug

echo ""
echo ""
echo -e "\e[1;95mCloned source-code and built package are located in \e[0;39m"
echo -e "\e[1;95mdedicated folder \e[39m" ${INST_DIR} "\e[0;39m"
echo -e ""





