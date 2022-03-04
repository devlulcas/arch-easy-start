#!/bin/zsh

CYAN='\033[0;36m'
NOCOLOR='\033[0m'

# shellcheck disable=SC3000-SC4000
source center.sh

# THEMES
# omni owl - material icon theme
center_text "${CYAN} THEMES ${NOCOLOR}" "=" 5
code --install-extension rocketseat.theme-omni
code --install-extension PKief.material-icon-theme

# PORTUGUESE
# language pack ptbr - spell checker portuguese
center_text "${CYAN} LANGUAGE ${NOCOLOR}" "=" 5
code --install-extension MS-CEINTL.vscode-language-pack-pt-BR
code --install-extension streetsidesoftware.code-spell-checker
code --install-extension streetsidesoftware.code-spell-checker-portuguese-brazilian

# LANGUAGES / LIBS / FRAMEWORKS
# react js snippets - svelte - html css - intelephense - phpdebug - python - styled components - svg - md - xml - regex
center_text "${CYAN} BASIC WEB ${NOCOLOR}" "=" 5
code --install-extension jock.svg
code --install-extension ecmel.vscode-html-css 

center_text "${CYAN} PYTHON ${NOCOLOR}" "=" 5
code --install-extension ms-python.python
code --install-extension esbenp.prettier-vscode

center_text "${CYAN} REACT ${NOCOLOR}" "=" 5
code --install-extension dsznajder.es7-react-js-snippets
code --install-extension styled-components.vscode-styled-components

center_text "${CYAN} SVELTE ${NOCOLOR}" "=" 5
code --install-extension svelte.svelte-vscode

center_text "${CYAN} PHP ${NOCOLOR}" "=" 5
code --install-extension xdebug.php-debug
code --install-extension bmewburn.vscode-intelephense-client

center_text "${CYAN} MARKDOWN ${NOCOLOR}" "=" 5
code --install-extension bierner.markdown-preview-github-styles

# NICE
# live server - intellicode - gitlens - eslint
center_text "${CYAN} UTILITY ${NOCOLOR}" "=" 5
code --install-extension ritwickdey.LiveServer
# better comments - color highlight - path intellisense - 
code --install-extension aaron-bond.better-comments
code --install-extension naumovs.color-highlight
code --install-extension christian-kohler.path-intellisense

center_text "${CYAN} GIT ${NOCOLOR}" "=" 5
code --install-extension eamodio.gitlens

# OTHER
center_text "${CYAN} OTHER ${NOCOLOR}" "=" 5
code --install-extension redhat.vscode-xml
code --install-extension chrmarti.regex
code --install-extension VisualStudioExptTeam.vscodeintellicode