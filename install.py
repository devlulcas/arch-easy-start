#!/usr/bin/env python3

import os
import subprocess
from datetime import datetime

'''
The code quality here is not great, but it works.

Maybe I'll come back and refactor it later. Maybe not. ¯\_(ツ)_/¯
'''

class Color:
    RED = '\033[91m'
    GREEN = '\033[92m'
    YELLOW = '\033[93m'
    BLUE = '\033[94m'
    PURPLE = '\033[95m'
    CYAN = '\033[96m'
    WHITE = '\033[97m'
    END = '\033[0m'


def print_message(message):
    terminal_size = os.get_terminal_size()
    separator = "=" * terminal_size.columns
    message = message.center(terminal_size.columns)
    print(f"{Color.YELLOW}{separator}\n{message}\n{separator}{Color.END}\n")


def print_alert(message):
    terminal_size = os.get_terminal_size()
    icon = f"{Color.RED}[{Color.YELLOW}!{Color.RED}]{Color.YELLOW}>>>{Color.END}"

    print(f"{icon} {message}\n")


def print_list_as_table(list):
    terminal_size = os.get_terminal_size()
    largest_item = max(list, key=len)
    number_of_columns = terminal_size.columns // len(largest_item)
    column_width = terminal_size.columns // number_of_columns

    items_with_padding = [f"{item:<{column_width}}" for item in list]

    table = [items_with_padding[i:i + number_of_columns]
             for i in range(0, len(list), number_of_columns)]

    table_rows = [" ".join(row) for row in table]

    print("\n".join(table_rows))

# Helpers


def run_shell_command(command):
    # Commands

    try:
        print(f"{Color.GREEN}Running {Color.BLUE}'{command}'{Color.END}...")
        subprocess.Popen(command, shell=True).wait()
        print(f"{Color.GREEN}Done!{Color.END}")
    except Exception as e:
        error = f"Error running {Color.BLUE}'{command}'{Color.END} - skipping..."
        trace = f"{Color.RED}\n\n{e}\n{Color.END}"
        print_alert(f"{error}{trace}")


def program_exists(program):
    try:
        subprocess.check_output([program, "--version"])
        return True
    except FileNotFoundError:
        return False

# Installers


def skip_or_install(package, from_aur=False):
    if program_exists(package):
        print_alert(f"{package} found, skipping installation...")
    else:
        print_alert(f"{package} not found, installing...")

        if from_aur:
            install_with_yay([package])
        else:
            install_with_pacman([package])


def install_with_pacman(package_list):
    print_message("Installing packages with pacman...")
    print_list_as_table(package_list)

    print_alert("Updating system...")
    run_shell_command("sudo pacman -Syu --noconfirm")

    packages = " ".join(package_list)
    run_shell_command(f"sudo pacman -S --noconfirm --needed {packages}")


def install_with_yay(package_list):
    print_message("Installing packages with yay...")

    if program_exists("yay"):
        print_alert("yay found, skipping installation...")
    else:
        print_alert("yay not found, installing...")
        install_yay()

    print_list_as_table(package_list)
    packages = " ".join(package_list)
    run_shell_command(f"yay -S --noconfirm --needed {packages}")


# Fixes

def fix_emoji():
    print_message("Fixing emoji...")

    run_shell_command("sudo chmod +x fix_emoji.sh")
    run_shell_command("sudo ./fix_emoji.sh")


# Setups

def install_yay():
    print_message("Installing yay...")
    yay_repo = "https://aur.archlinux.org/yay.git"

    if program_exists("git") and program_exists("base-devel"):
        print_alert("git and base-devel found, skipping installation...")
    else:
        print_alert("git or base-devel not found, installing...")
        install_with_pacman(["base-devel", "git"])

    steps = [
        f"git clone {yay_repo}",
        "cd yay && makepkg -si --noconfirm",
        "cd .. && rm -rf yay"
    ]

    for step in steps:
        run_shell_command(step)


def setup_aliases():
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

    def create_alias(alias, command): return f"alias {alias}=\"{command}\"\n"

    mapped_aliases = map(create_alias, aliases.keys(), aliases.values())

    with open("~/.zshrc", "a") as file:
        file.write("\n" + "".join(mapped_aliases))


def setup_git():
    print_message("Setting up git...")

    skip_or_install("git")

    name = input("Enter your name: ")

    email = input("Enter your email: ")

    git_config = [
        f"user.name = {name}",
        f"user.email = {email}",
        "core.editor = nvim",
        "init.defaultBranch = main",
        "alias.lol = log --graph --decorate --pretty=oneline --abbrev-commit --all",
        "color.ui = true"
    ]

    for config in git_config:
        run_shell_command(f"git config --global {config}")


def setup_zsh():
    print_message("Setting up zsh...")

    skip_or_install("git")

    skip_or_install("zsh")

    print_message("Installing oh-my-zsh...")

    install_command = "sh -c \"$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)\""

    run_shell_command(install_command)

    run_shell_command("chsh -s $(which zsh)")

    install_oh_my_zsh_plugins()

    setup_aliases()


def install_oh_my_zsh_plugins():
    print_message("Installing oh-my-zsh plugins...")

    if program_exists("zsh"):
        print_alert("zsh found, skipping installation...")
    else:
        print_alert("zsh not found, installing...")
        install_with_pacman(["zsh"])

    if program_exists("git"):
        print_alert("git found, skipping installation...")
    else:
        print_alert("git not found, installing...")
        install_with_pacman(["git"])

    plugins = {
        "zsh-autosuggestions": "https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions",
        "zsh-syntax-highlighting": "https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
    }

    for plugin in plugins:
        print_alert(f"Installing {plugin}...")
        run_shell_command(f"git clone {plugin}")

    # add plugins to .zshrc
    to_replace = "plugins=(git)"
    new_plugins = " ".join(plugins.keys())
    replacement = f"plugins=(git {new_plugins})"
    sed_command = f"sed -i 's/{to_replace}/{replacement}/g' ~/.zshrc"
    run_shell_command(sed_command)


def setup_vim():
    print_message("Installing astro-nvim...")

    skip_or_install("git")

    skip_or_install("neovim")

    print_alert("Backing up old config...")
    date_as_string = datetime.now().strftime("%d-%m-%Y-%H-%M-%S")
    backup_path = f"~/.config/nvim-backup-{date_as_string}"
    run_shell_command(f"mv ~/.config/nvim {backup_path}")

    print_alert("Installing astro-nvim...")
    astro_repo = "https://github.com/AstroNvim/AstroNvim"
    run_shell_command(f"git clone --depth 1 {astro_repo} ~/.config/nvim")


def setup_terminal():
    setup_zsh()

    print_message("Installing kitty...")

    skip_or_install("kitty", from_aur=True)

    print_alert("Installing kitty-themes...")

    themes_repo = "https://github.com/dexpota/kitty-themes.git"
    run_shell_command(f"git clone {themes_repo} ~/.config/kitty-themes")
    run_shell_command("cp ~/.config/kitty-themes/themes/* ~/.config/kitty/")

    print_alert("Setting default kitty theme...")

    default_theme_path = "~/.config/kitty/kitty-themes/themes/Dark_Pastel.conf"
    run_shell_command(f"ln -s {default_theme_path} ~/.config/kitty/theme.conf")


def download_dotfiles():
    print_message("Downloading dotfiles...")

    skip_or_install("git")

    dot_files_repo = "https://github.com/devlulcas/dot-files.git"
    os.system(f"git clone {dot_files_repo} ~/dot-files")


def setup_wm():
    pass

# Setup programming languages


def setup_javascript():
    print_message("Installing Node...")

    skip_or_install("curl")

    print_alert("Installing pnpm first...")
    run_shell_command("curl -fsSL https://get.pnpm.io/install.sh | sh -")

    print_alert("Installing node...")
    run_shell_command("pnpm env use --global lts")

    print_alert("Installing yarn...")
    run_shell_command("pnpm install -g yarn")

    print_message("Installing Deno...")
    run_shell_command("curl -fsSL https://deno.land/x/install/install.sh | sh")


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

    install_with_yay(yay)

    setup_git()

    setup_terminal()

    fix_emoji()

    setup_javascript()

    setup_vim()

    download_dotfiles()

    setup_wm()

    # Finish
    print_message("Done!")


# Run the main function

start = datetime.now()

main()

end = datetime.now()

time_taken = end - start

print_message(
    f"Finished in {time_taken.total_seconds():.2f} seconds / {time_taken.microseconds} microseconds")
