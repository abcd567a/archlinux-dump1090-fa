#!/bin/bash
BUILD_FOLDER=${PWD}
sudo pacman -Sy --needed git binutils make gcc glibc fakeroot pkgconf autoconf

cd ${BUILD_FOLDER}/archlinux-dump1090-fa
makepkg -si
