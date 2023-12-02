#!/bin/bash
BUILD_FOLDER=${PWD}
sudo pacman -S --needed git fakeroot
cd ${BUILD_FOLDER}/archlinux-dump1090-fa
makepkg -si


