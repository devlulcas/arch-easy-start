#!/usr/bin/env bash

echo
echo -e "\033[34mSETUP GIT\033[0m"
echo

git config --global color.ui true

read -p "Enter your name: " GIT_NAME

git config --global user.name "$GIT_NAME"

read -p "Enter your email: " GIT_EMAIL

git config --global user.email "$GIT_EMAIL"

echo
echo -e "\033[32mDONE :)\033[0m"
echo



