#!/bin/zsh

NOCOLOR='\033[0m'
GREEN='\033[1;32m'

# shellcheck disable=SC3000-SC4000
source center.sh

center_text "${GREEN} REACT SHENANIGANS ${NOCOLOR}" "=" 5
git clone git@github.com:devlulcas/react-shenanigans.git

center_text "${GREEN} BADGIC ${NOCOLOR}" "=" 5
git clone git@github.com:devlulcas/glass-badgic.git

center_text "${GREEN} PEST ${NOCOLOR}" "=" 5
git clone git@github.com:devlulcas/instroducao-ao-pest.git

center_text "${GREEN} DEVLULCAS ${NOCOLOR}" "=" 5
git clone git@github.com:devlulcas/devlulcas.git

center_text "${GREEN} NOTICE BOARD ${NOCOLOR}" "=" 5
git clone git@github.com:devlulcas/notice-board.git

center_text "${GREEN} LEARN ${NOCOLOR}" "=" 5
git clone git@github.com:devlulcas/learn.git

center_text "${GREEN} ROADMAP ${NOCOLOR}" "=" 5
git clone git@github.com:devlulcas/basic-roadmap.git

center_text "${GREEN} PORTFOLIO ${NOCOLOR}" "=" 5
git clone git@github.com:devlulcas/devlulcas.github.io.git

center_text "${GREEN} PHP MVC ${NOCOLOR}" "=" 5
git clone git@github.com:devlulcas/learning-php-mvc.git

center_text "${GREEN} OBSIDIAN ${NOCOLOR}" "=" 5
git clone git@github.com:devlulcas/obsidian-notes.git

center_text "${GREEN} STARTPAGE ${NOCOLOR}" "=" 5
git clone git@github.com:devlulcas/personal-startpage.git
