#!/usr/bin/env bash

if [[ $(id -u) -ne 0 ]] ; then echo "Please run as root" ; exit 1 ; fi

echo
echo -e "\033[32mINSTALLING BASIC PACKAGES\033[0m"
echo

BASIC_PACKAGES=(
    # Base
    "base-devel"
    "git"
    "zsh"
    "wget"
    "curl"
    "zip"
    "unzip"
)

for BASIC_PKG in "${BASIC_PACKAGES[@]}"; do
    echo
    echo -e "\033[33mInstalling ${BASIC_PKG}\033[0m"
    echo
    sudo pacman -S "$BASIC_PKG" --noconfirm --needed
    echo -e "\033[32mNice!\033[0m"
done

source git.sh

source fonts.sh

source pacman.sh

chsh -s $(which zsh)

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

source aliases.sh




