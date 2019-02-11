#!/bin/sh

set -ex

## Synchronize the database and update the packages
sudo pacman -Sy --noconfirm

## Mirrorlists
sudo pacman -S --noconfirm reflector
sudo reflector --verbose --latest 100 --sort rate --save /etc/pacman.d/mirrorlist

## Update the packages
sudo pacman -Syyu --noconfirm

function yaourt_install() {
  yaourt -S $@ --noconfirm
}

function pacman_install() {
  sudo pacman -S $@ --noconfirm
}

## Xorg server
pacman_install xorg xorg-xinit mesa

## i3
pacman_install i3-wm i3lock i3blocks

## Video driver
# check the type of video card
# lspci | grep VGA
pacman_install xf86-video-intel

## Audio driver
pacman_install alsa-lib alsa-utils alsa-oss alsa-plugins pavucontrol pulseaudio
yaourt_install pa-applet-git

## Touchpad
pacman_install xf86-input-synaptics

## Commanders
pacman_install mc doublecmd-gtk2 pcmanfm

## Source control
pacman_install git

## Utils
pacman_install gvfs polkit-gnome gnome-keyring gparted ntfs-3g xfce4-power-manager conky arandr xcompmgr compton nitrogen gsimplecal gvfs-mtp gvfs-gphoto2 bind-tools pacman-contrib lm_sensors seahorse
yaourt_install pamac-aur qxkb nvm grub-customizer jmtpfs

## Notifications
pacman_install xfce4-notifyd

## Appearance
pacman_install lxappearance qt5ct qt5-styleplugins

## Theme
pacman_install gnome-themes-extra
yaourt_install paper-icon-theme 
# yaourt_install vertex-themes breeze-default-cursor-theme kdeicons-nouvekdegray
# yaourt_install clarity-icon-theme

## Archivers
pacman_install zip unzip

## Launchers
pacman_install rofi

## Network
pacman_install networkmanager networkmanager-pptp network-manager-applet

## SSH
pacman_install openssh

## ZSH
pacman_install zsh
yaourt_install zsh-git-prompt zsh-autosuggestions zsh-syntax-highlighting

## Nano syntax highligting
yaourt_install nano-syntax-highlighting-git

## Browsers
pacman_install firefox

## Terminal
pacman_install terminator tmux

## Fonts
pacman_install ttf-dejavu
yaourt_install ttf-font-awesome-4 otf-san-francisco

## Images
pacman_install gwenview

## Enable Network Manageg daemon
sudo systemctl enable NetworkManager
sudo systemctl start NetworkManager

## Change shell
sudo chsh -s /bin/zsh $USER
