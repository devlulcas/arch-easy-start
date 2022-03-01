#!/bin/sh

NOCOLOR='\033[0m'
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHTGRAY='\033[0;37m'
DARKGRAY='\033[1;30m'
LIGHTRED='\033[1;31m'
LIGHTGREEN='\033[1;32m'
YELLOW='\033[1;33m'
LIGHTBLUE='\033[1;34m'
LIGHTPURPLE='\033[1;35m'
LIGHTCYAN='\033[1;36m'
WHITE='\033[1;37m'

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