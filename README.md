![LINUX](https://img.shields.io/static/v1?label=SHELL&labelColor=f29f00&message=SH&color=000000&logo=linux&logoColor=ffffff&style=flat-square) ![ARCHLINUX](https://img.shields.io/static/v1?label=POST&labelColor=21dfb3&message=INSTALL&color=000000&logo=ARCHLINUX&logoColor=ffffff&style=flat-square) ![VISUALSTUDIOCODE](https://img.shields.io/static/v1?label=VSCODE&labelColor=2136df&message=EXTENSIONS&color=000000&logo=VISUALSTUDIOCODE&logoColor=ffffff&style=flat-square)

# 🤖 POST INSTALL 🤖

Scripts to automate the installation of some programs and plugins.

> warning: Just a few scripts are mine, the rest are from other people.

> warning: This is just a glorified list of commands.

**Not mine:**

- fix_emoji.sh

## RUN:

```sh
python ./install.py
reboot
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
