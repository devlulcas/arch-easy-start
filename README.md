![LINUX](https://img.shields.io/static/v1?label=SHELL&labelColor=f29f00&message=SH&color=000000&logo=linux&logoColor=ffffff&style=flat-square) ![ARCHLINUX](https://img.shields.io/static/v1?label=POST&labelColor=21dfb3&message=INSTALL&color=000000&logo=ARCHLINUX&logoColor=ffffff&style=flat-square) ![VISUALSTUDIOCODE](https://img.shields.io/static/v1?label=VSCODE&labelColor=2136df&message=EXTENSIONS&color=000000&logo=VISUALSTUDIOCODE&logoColor=ffffff&style=flat-square)

# 🤖 POST INSTALL 🤖

Some files for automating my post install on arch based distros.

I don't know much about shell scripting, so some of these scripts are not mine.

**Not mine:**

- center.sh
- fixemoji.sh

## RUN:

> That one will run scripts that need root and uses pacman.

```sh
chmod +x ./init.sh
sudo ./init.sh
reboot
```

> That one will run scripts that don't need root.

```bash
chmod +x ./aur.sh
./aur.sh
```

## ACTIVATE PLUGINS

```sh
plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
)
```

## SETUP GIT SSH:

```sh
#Op 1
ssh-keygen -t ed25519 -C "example@mail.com"

#Op 2
ssh-keygen -t ecdsa-sk -C "https://github.com/user"

eval "$(ssh-agent -s)"

ssh-add ~/.ssh/id_ed25519

cat ~/.ssh/id_ed25519.pub

```

> On github

```
> Configs / Access / SSH and GPG keys / New SSH key
```
