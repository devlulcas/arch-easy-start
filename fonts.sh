#!/usr/bin/env bash

if [[ $(id -u) -ne 0 ]] ; then echo "Please run as root" ; exit 1 ; fi

echo
echo -e "\033[32mINSTALLING FONTS\033[0m"
echo

sudo pacman -S ttf-fira-code --noconfirm --needed

sudo pacman -S nerd-fonts-fira-code --noconfirm --needed

sudo pacman -S noto-fonts --noconfirm --needed

source fixemoji.sh

echo
echo -e "\033[32mDONE :)\033[0m"
echo



