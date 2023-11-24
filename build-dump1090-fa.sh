#!/bin/bash
BUILD_FOLDER=${PWD}
sudo pacman -Sy --needed wget git binutils make gcc glibc fakeroot pkgconf autoconf rtl-sdr lighttpd bladerf
sudo wget -O /etc/udev/rules.d/rtl-sdr.rules https://github.com/abcd567a/temp/raw/main/rtl-sdr.rules

cd ${BUILD_FOLDER}/archlinux-dump1090-fa
makepkg -si


