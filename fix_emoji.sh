#!/bin/sh
set -e

if [[ $(id -u) -ne 0 ]] ; then echo "Please run as root" ; exit 1 ; fi

echo
echo -e "\033[32mINSTALLING NOTO FONTS EMOJI\033[0m"
echo

pacman -S --needed --noconfirm noto-fonts-emoji 

# 2 - add font config to /etc/fonts/conf.d/01-notosans.conf

echo
echo -e "\033[32mMESSING UP WITH YOUR \033[34m/etc/fonts/local.conf\033[0m"
echo
echo ">>> Recommended system font: inconsolata regular (ttf-inconsolata or powerline-fonts)"
echo
echo '<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
 <alias>
   <family>sans-serif</family>
   <prefer>
     <family>Noto Sans</family>
     <family>Noto Color Emoji</family>
     <family>Noto Emoji</family>
     <family>DejaVu Sans</family>
   </prefer> 
 </alias>
 <alias>
   <family>serif</family>
   <prefer>
     <family>Noto Serif</family>
     <family>Noto Color Emoji</family>
     <family>Noto Emoji</family>
     <family>DejaVu Serif</family>
   </prefer>
 </alias>
 <alias>
  <family>monospace</family>
  <prefer>
    <family>Noto Mono</family>
    <family>Noto Color Emoji</family>
    <family>Noto Emoji</family>
    <family>DejaVu Sans Mono</family>
   </prefer>
 </alias>
</fontconfig>
' > /etc/fonts/local.conf

# 3 - update font cache via fc-cache
fc-cache -v
echo "Noto Emoji Font installed! You may need to restart applications like chrome. If chrome displays no symbols or no letters, your default font contains emojis."

echo
echo -e "\033[32mDONE :)\033[0m"
echo
