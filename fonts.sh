#!/usr/bin/env bash

if [[ $(id -u) -ne 0 ]] ; then echo "Please run as root" ; exit 1 ; fi

echo
echo -e "\033[32mINSTALLING FONTS\033[0m"
echo

FONTS=(
    "ttf-fira-code"
    "noto-fonts"
)

sudo pacman -S "${FONTS[@]}" --noconfirm --needed

echo "Instalando fonte fira-code nerd font..."

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/FiraCode.zip
unzip FiraCode.zip -d ~/.local/share/fonts
fc-cache -fv
rm FiraCode.zip

source fixemoji.sh


echo
echo -e "\033[32mDONE :)\033[0m"
echo



