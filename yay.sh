#!/usr/bin/env bash

# Check for sudo access
if [ "$EUID" -ne 0 ] then 
    echo
    echo -e "\033[32mINSTALLING YAY AUR PACKAGE MANAGER\033[0m"
    echo

    # Install yay
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    cd ..
    rm -rf yay

    echo
    echo -e "\033[32mDONE :)\033[0m"
    echo

    exit
fi

echo -e "\033[33m!!! Please DO NOT run that script as root !!!\033[0m"