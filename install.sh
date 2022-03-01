#!/bin/sh

NOCOLOR='\033[0m'
YELLOW='\033[1;33m'

# shellcheck disable=SC3000-SC4000
source center.sh

center_text "${YELLOW} BASIC SYS CONFIG ${NOCOLOR}" "=" 5
sudo pacman -Syu
sudo pacman -S --needed base-devel 
sudo pacman -S curl wget unzip 

center_text "${YELLOW} FIX EMOJIS ${NOCOLOR}" "=" 5
pacman -S noto-fonts-emoji --needed
sudo chmod +x ./fixemoji.sh
sudo ./fixemoji.sh

center_text "${YELLOW} GIT ${NOCOLOR}" "=" 5
sudo pacman -S git
git config --global user.email "lucasalvesrego.contato@gmail.com"
git config --global user.name "devlulcas"
git config --global color.ui true

center_text "${YELLOW} FOLDERS ${NOCOLOR}" "=" 5
chmod +x ./foldersetup.sh
./foldersetup.sh

center_text "${YELLOW} YAY AUR HELPER ${NOCOLOR}" "=" 5
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

center_text "${YELLOW} ZSH ++ OH MY ZSH ${NOCOLOR}" "=" 5
sudo pacman -S zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

center_text "${YELLOW} VIM ${NOCOLOR}" "=" 5
sudo pacman -S nvim 
echo "alias vim=\"nvim\"" > ~/.zshrc

center_text "${YELLOW} PYTHON ${NOCOLOR}" "=" 5
sudo pacman -S python

center_text "${YELLOW} PIP ${NOCOLOR}" "=" 5
sudo pacman -S python-pip

center_text "${YELLOW} NODE ${NOCOLOR}" "=" 5
sudo pacman -S nodejs

center_text "${YELLOW} NPM ${NOCOLOR}" "=" 5
sudo pacman -S npm

center_text "${YELLOW} APACHE ${NOCOLOR}" "=" 5
sudo pacman -S apache 

center_text "${YELLOW} PHP ${NOCOLOR}" "=" 5
sudo pacman -S php

center_text "${YELLOW} COMPOSER ${NOCOLOR}" "=" 5
sudo pacman -S composer

center_text "${YELLOW} JAVA JRE ${NOCOLOR}" "=" 5
sudo pacman -S jre-openjdk

center_text "${YELLOW} JAVA JDK ${NOCOLOR}" "=" 5
sudo pacman -S jdk-openjdk

center_text "${YELLOW} VSCODE ${NOCOLOR}" "=" 5
yay -S visual-studio-code-bin 

center_text "${YELLOW} VSCODE EXTENSIONS ${NOCOLOR}" "=" 5
chmod +x ./vscodeext.sh
./vscodeext.sh

center_text "${YELLOW} INTELIJJ ${NOCOLOR}" "=" 5
sudo pacman -S intellij-idea-community-edition

center_text "${YELLOW} ANDROID STUDIO ${NOCOLOR}" "=" 5
yay -S android-studio

center_text "${YELLOW} FIREFOX ${NOCOLOR}" "=" 5
sudo pacman -S firefox 

center_text "${YELLOW} BRAVE ${NOCOLOR}" "=" 5
yay -S brave-bin

center_text "${YELLOW} VLC ${NOCOLOR}" "=" 5
sudo pacman -S vlc 

center_text "${YELLOW} GPARTED ${NOCOLOR}" "=" 5
sudo pacman -S gparted 
