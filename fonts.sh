#!/usr/bin/env bash

if [[ $(id -u) -ne 0 ]] ; then echo "Please run as root" ; exit 1 ; fi

echo
echo -e "\033[32mINSTALLING FONTS\033[0m"
echo

FONTS=(
    "ttf-fira-code"
    "nerd-fonts-fira-code"
    "noto-fonts"
)

sudo pacman -S "${FONTS[@]}" --noconfirm --needed

source fixemoji.sh

echo
echo -e "\033[32mDONE :)\033[0m"
echo



