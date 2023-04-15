#!/usr/bin/env python3

import os


def print_message(message):
    print("\n=====================================\n")
    print(message)
    print("\n=====================================\n")


def create_aliases():
    print_message("Creating aliases...")

    aliases = {
        "vim": "nvim",
        "vi": "nvim",
        "cat": "bat",
        "ls": "exa --icons",
        "ll": "exa --icons -l",
        "la": "exa --icons -la",
        "l": "exa --icons -l",
        "tree": "exa --tree --icons",
        "grep": "rg",
    }

    for alias, command in aliases.items():
        os.system(f"alias {alias}=\"{command}\"")


def install_with_pacman(package_list):
    packages = " ".join(package_list)
    os.system(f"sudo pacman -S --noconfirm --needed {packages}")


def install_with_yay(package_list):
    packages = " ".join(package_list)
    os.system(f"yay -S --noconfirm --needed {packages}")


def setup_git():
    print_message("Setting up git...")

    name = input("\nEnter your name: ")

    email = input("\nEnter your email: ")

    git_config = [
        f"user.name = {name}",
        f"user.email = {email}",
        "core.editor = nvim",
        "init.defaultBranch = main",
        "alias.lol = log --graph --decorate --pretty=oneline --abbrev-commit --all",
        "color.ui = true"
    ]

    for config in git_config:
        os.system(f"git config --global {config}")


def fix_emoji():
    print_message("Fixing emoji...")

    os.system("chmod +x fix_emoji.sh")
    os.system("sudo ./fix_emoji.sh")


def install_yay():
    print_message("Installing yay...")

    os.system("git clone https://aur.archlinux.org/yay.git")
    os.system("cd yay && makepkg -si --noconfirm")
    os.system("cd .. && rm -rf yay")


def install_oh_my_zsh():
    print_message("Installing oh-my-zsh...")

    bash_command = "sh -c \"$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)\""

    os.system(bash_command)


def install_pnpm():
    print_message("Installing pnpm...")

    os.system("curl -fsSL https://get.pnpm.io/install.sh | sh -")


def install_oh_my_zsh_plugins():
    print_message("Installing oh-my-zsh plugins...")

    plugins = [
        "https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions",
        "https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
    ]

    for plugin in plugins:
        os.system(f"git clone {plugin}")

    # Add plugins to .zshrc

    os.system(
        "sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/g' ~/.zshrc")

def install_astro_nvim():
    print_message("Installing astro-nvim...")

    os.system("git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim")

def download_dotfiles():
    print_message("Downloading dotfiles...")

    os.system("git clone https://github.com/devlulcas/dot-files.git ~/dot-files")

def main():
    print_message("Installing packages...")

    yay = [
        "visual-studio-code-bin",
        "discord",
        "google-chrome",
        "insomnia-bin",
        "beekeeper-studio"
    ]

    pacman = [
        # General
        "base-devel",
        "git",
        "zsh",
        "wget",
        "curl",
        "zip",
        "unzip",

        # Fonts
        "ttf-fira-code",
        "noto-fonts",
        "noto-fonts-emoji",
        "ttf-nerd-fonts-symbols-2048-em-mono",

        # Terminal utilities
        "htop",
        "neofetch",
        "tmux",
        "fzf",
        "bat",
        "exa",
        "ripgrep",
        "fd",
        "zoxide",
        "gdu",
        "bottom",

        # Development
        "python",
        "python-pip",
        "nodejs",
        "npm",
        "go",
        "rustup",
        "jdk-openjdk",
        "jre-openjdk",
        "java-openjfx",
        "php",
        "composer",
        "php-apache",
        "lua",
        "luarocks",
        "elixir",
        "kotlin",
        "sqlite",

        # Media
        "vlc",
        "imagemagick",

        # Browsers
        "firefox",
        "chromium",
        "brave-bin",

        # Editors
        "neovim",

        # Bluetooth
        "bluez",
        "bluez-utils",
        "bluez-firmware",
        "bluedevil",
        "pulseaudio-bluetooth",
    ]

    # Run the install functions

    install_with_pacman(pacman)

    install_yay()

    install_with_yay(yay)

    # Run the setup functions

    create_aliases()

    setup_git()

    fix_emoji()

    install_oh_my_zsh()

    install_pnpm()

    install_oh_my_zsh_plugins()

    # Finish
    print_message("Done!")

    os.system("zsh")


# Run the main function
main()
