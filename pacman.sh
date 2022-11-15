#!/usr/bin/env bash

if [[ $(id -u) -ne 0 ]] ; then echo "Please run as root" ; exit 1 ; fi

echo
echo -e "\033[32mINSTALLING PACMAN PACKAGES\033[0m"
echo

PACMAN_PACKAGES=(
    # Programming Languages and Tools
    # > Python
    "python"
    "python-pip"
    # > NodeJS
    "nodejs"
    "npm"
    # > Go
    "go"
    # > Rust
    "rustup"
    # > Java
    "jdk-openjdk"
    "jre-openjdk"
    "java-openjfx"
    # > PHP
    "php"
    "composer"
    "php-apache"
    # > Lua
    "lua"
    "luarocks"
    # > Elixir
    "elixir"
    # > Dart
    "dart"
    # > Kotlin
    "kotlin"
    
    # Utils
    "htop"
    "neofetch"
    "neovim"
    "tmux"
    "fzf"
    "bat"
    "exa"
    "ripgrep"
    "fd"

    # Media
    "vlc"
    "imagemagick"

    # Browsers
    "firefox"
    "chromium"
    "brave-bin"

    # Editors
    "neovim"

    # Bluetooth
    "bluez"
    "bluez-utils"
    "bluez-firmware"
    "bluedevil"
    "pulseaudio-bluetooth"
)

for PACMAN_PKG in "${PACMAN_PACKAGES[@]}"; do
    echo
    echo -e "\033[33mInstalling ${PACMAN_PKG}\033[0m"
    echo
    sudo pacman -S "$PACMAN_PKG" --noconfirm --needed
    echo -e "\033[32mNice!\033[0m"
done

echo
echo -e "\033[32mDONE :)\033[0m"
echo