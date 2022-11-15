#!/usr/bin/env bash

echo
echo -e "\033[32mINSTALLING AUR PACKAGES\033[0m"
echo

YAY_PACKAGES=(
    "visual-studio-code-bin"
    "discord"
    "google-chrome"
)

for YAY_PKG in "${YAY_PACKAGES[@]}"; do
    echo
    echo -e "\033[34mInstalling ${YAY_PKG}\033[0m"
    echo
    yay -S "$YAY_PKG" --noconfirm --needed
    echo -e "\033[32mNice!\033[0m"
done

source vscodeext.sh

echo
echo -e "\033[32mDONE :)\033[0m"
echo