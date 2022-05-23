#!/bin/zsh

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

center_text "${YELLOW} FIRA CODE ${NOCOLOR}" "=" 5
sudo pacman -S ttf-fira-code 

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

center_text "${YELLOW} OH MY ZSH ${NOCOLOR}" "=" 5
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# LANGUAGES

## PYTHON
center_text "${YELLOW} PYTHON ${NOCOLOR}" "=" 5
sudo pacman -S python

center_text "${YELLOW} PIP ${NOCOLOR}" "=" 5
sudo pacman -S python-pip

## NODE
center_text "${YELLOW} NODE ${NOCOLOR}" "=" 5
sudo pacman -S nodejs

center_text "${YELLOW} NPM ${NOCOLOR}" "=" 5
sudo pacman -S npm

## PHP
center_text "${YELLOW} APACHE ${NOCOLOR}" "=" 5
sudo pacman -S apache 

center_text "${YELLOW} PHP ${NOCOLOR}" "=" 5
sudo pacman -S php php-apache 

center_text "${YELLOW} COMPOSER ${NOCOLOR}" "=" 5
sudo pacman -S composer

## JAVA
center_text "${YELLOW} JAVA JRE ${NOCOLOR}" "=" 5
sudo pacman -S jre-openjdk

center_text "${YELLOW} JAVA JDK ${NOCOLOR}" "=" 5
sudo pacman -S jdk-openjdk

## GO
center_text "${YELLOW} GO LANG ${NOCOLOR}" "=" 5
sudo pacman -S go

center_text "${YELLOW} GO TOOLS ${NOCOLOR}" "=" 5
sudo pacman -S go-tools

## ELIXIR
center_text "${YELLOW} ELIXIR ${NOCOLOR}" "=" 5
sudo pacman -S elixir

## RUST
center_text "${YELLOW} RUST ${NOCOLOR}" "=" 5
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# EDITORES
center_text "${YELLOW} VSCODE ${NOCOLOR}" "=" 5
yay -S visual-studio-code-bin 

center_text "${YELLOW} VSCODE EXTENSIONS ${NOCOLOR}" "=" 5
chmod +x ./vscodeext.sh
./vscodeext.sh

center_text "${YELLOW} VIM ${NOCOLOR}" "=" 5
sudo pacman -S nvim 
echo "alias vim=\"nvim\"" > ~/.zshrc

# NAVEGADORES
center_text "${YELLOW} FIREFOX ${NOCOLOR}" "=" 5
sudo pacman -S firefox 

center_text "${YELLOW} BRAVE ${NOCOLOR}" "=" 5
yay -S brave-bin

# UTILIDADES
center_text "${YELLOW} DOCKER ${NOCOLOR}" "=" 5
sudo pacman -S docker
sudo systemctl start docker
sudo systemctl enable docker

center_text "${YELLOW} VLC ${NOCOLOR}" "=" 5
sudo pacman -S vlc 

center_text "${YELLOW} GPARTED ${NOCOLOR}" "=" 5
sudo pacman -S gparted 

