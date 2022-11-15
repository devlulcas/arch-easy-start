#!/bin/zsh

CYAN='\033[0;36m'
NOCOLOR='\033[0m'

# shellcheck disable=SC3000-SC4000
source center.sh

# THEMES
center_text "${CYAN} THEMES ${NOCOLOR}" "=" 5
code --install-extension PKief.material-icon-theme

# PORTUGUESE
center_text "${CYAN} HUMAN LANGUAGE ${NOCOLOR}" "=" 5
code --install-extension MS-CEINTL.vscode-language-pack-pt-BR
code --install-extension streetsidesoftware.code-spell-checker
code --install-extension streetsidesoftware.code-spell-checker-portuguese-brazilian

# LANGUAGES
center_text "${CYAN} HTML + CSS  ${NOCOLOR}" "=" 5
code --install-extension ecmel.vscode-html-css 

center_text "${CYAN} PHP ${NOCOLOR}" "=" 5
code --install-extension xdebug.php-debug
code --install-extension bmewburn.vscode-intelephense-client

center_text "${CYAN} KOTLIN ${NOCOLOR}" "=" 5
code --install-extension mathiasfrohlich.Kotlin

center_text "${CYAN} ELIXIR ${NOCOLOR}" "=" 5
code --install-extension jakebecker.elixir-ls

center_text "${CYAN} RUST ${NOCOLOR}" "=" 5
code --install-extension rust-lang.rust-analyzer

center_text "${CYAN} GO ${NOCOLOR}" "=" 5
code --install-extension golang.go

# FRAMEWORKS
center_text "${CYAN} REACT ${NOCOLOR}" "=" 5
code --install-extension dsznajder.es7-react-js-snippets

center_text "${CYAN} STYLED COMPONENTS ${NOCOLOR}" "=" 5
code --install-extension styled-components.vscode-styled-components

center_text "${CYAN} SVELTE ${NOCOLOR}" "=" 5
code --install-extension svelte.svelte-vscode

center_text "${CYAN} TAILWIND CSS ${NOCOLOR}" "=" 5
code --install-extension bradlc.vscode-tailwindcss

# FILES
center_text "${CYAN} SVG  ${NOCOLOR}" "=" 5
code --install-extension jock.svg

center_text "${CYAN} MARKDOWN ${NOCOLOR}" "=" 5
code --install-extension bierner.markdown-preview-github-styles
code --install-extension silvenon.mdx

center_text "${CYAN} XML ${NOCOLOR}" "=" 5
code --install-extension redhat.vscode-xml

## LINT
center_text "${CYAN} PRETTIER ${NOCOLOR}" "=" 5
code --install-extension esbenp.prettier-vscode

center_text "${CYAN} EDITOR CONFIG ${NOCOLOR}" "=" 5
code --install-extension editorconfig.editorconfig

center_text "${CYAN} ESLINT ${NOCOLOR}" "=" 5
code --install-extension dbaeumer.vscode-eslint

# CODE COMPLETION
center_text "${CYAN} INTELLICODE ${NOCOLOR}" "=" 5
code --install-extension VisualStudioExptTeam.vscodeintellicode

center_text "${CYAN} EMOJISENSE ${NOCOLOR}" "=" 5
code --install-extension bierner.emojisense

center_text "${CYAN} PATH INTELLISENSE ${NOCOLOR}" "=" 5
code --install-extension christian-kohler.path-intellisense

# HELPERS
center_text "${CYAN} GIT LENS ${NOCOLOR}" "=" 5
code --install-extension eamodio.gitlens

center_text "${CYAN} COLOR HIGHLIGHT ${NOCOLOR}" "=" 5
code --install-extension naumovs.color-highlight

center_text "${CYAN} BETTER COMMENTS ${NOCOLOR}" "=" 5
code --install-extension aaron-bond.better-comments

center_text "${CYAN} LIVE SERVER ${NOCOLOR}" "=" 5
code --install-extension ritwickdey.LiveServer