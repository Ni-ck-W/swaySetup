#!/bin/bash

set -e

wget -O main.zip https://github.com/Ni-ck-W/swaySetup/archive/refs/heads/main.zip

unzip main.zip
rm main.zip

mkdir -p ~/.config
mv swaySetup-main/* ~/.config/ 2>/dev/null || true
mv swaySetup-main/.[!.]* ~/.config/ 2>/dev/null || true

rm -f ~/.bash_profile
mv ~/.config/.bash_profile ~/

mkdir -p ~/Pictures
mv ~/.config/ben_10_red.jpg ~/Pictures/ 2>/dev/null || true

rm -f ~/.config/README.md

rm -rf swaySetup-main

sudo pacman -Syu --noconfirm \
    nemo qt6ct swaybg breeze breeze-gtk conky clapper

chsh -s /bin/bash

reboot
