#!/bin/bash

set -e
# Download github
wget -O main.zip https://github.com/Ni-ck-W/swaySetup/archive/refs/heads/main.zip

unzip main.zip
rm main.zip

#moving most config files
mkdir -p ~/.config
mv swaySetup-main/* ~/.config/ 2>/dev/null || true
mv swaySetup-main/.[!.]* ~/.config/ 2>/dev/null || true

#bash_profile
rm -f ~/.bash_profile
mv ~/.config/.bash_profile ~/

#background
mkdir -p ~/Pictures
mv ~/.config/ben_10_red.jpg ~/Pictures/ 2>/dev/null || true

#cleanup
rm -f ~/.config/README.md
rm -rf swaySetup-main

#app installs
sudo pacman -Syu --noconfirm \
    nemo qt6ct swaybg breeze breeze-gtk conky clapper imv flameshot localsend polkit-gnome waybar rofi network-manager-applet blueman brightnessctl otf-font-awesome

#custom snipping tool file
mkdir -p ~/.local/share/applications
mv ~/.config/screenshot.desktop ~/.local/share/applications 2>/dev/null || true
update-desktop-database ~/.local/share/applications || true

#localsend firewall
sudo ufw allow 53317/tcp
sudo ufw allow 53317/udp

#change shell
chsh -s /bin/bash

reboot
