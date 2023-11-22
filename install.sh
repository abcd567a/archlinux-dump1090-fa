#!/bin/bash

sudo pacman -Sy --needed git binutils make gcc glibc fakeroot pkgconf autoconf
makepkg -si
