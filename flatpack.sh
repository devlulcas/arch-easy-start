#!/bin/zsh

NOCOLOR='\033[0m'
YELLOW='\033[1;33m'

# shellcheck disable=SC3000-SC4000
source center.sh

center_text "${YELLOW} FLATPACK ${NOCOLOR}" "=" 5
sudo pacman -S flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
sudo pacman -Syu

center_text "${YELLOW} INSOMNIA ${NOCOLOR}" "=" 5
flatpak install flathub rest.insomnia.Insomnia
flatpak run rest.insomnia.Insomnia

center_text "${YELLOW} DISCORD ${NOCOLOR}" "=" 5
flatpak install flathub com.discordapp.Discord
flatpak run com.discordapp.Discord