#!/bin/sh

set -ex

## Update the packages
sudo pacman -Syyu --noconfirm

function yaourt_install() {
  yaourt -S $@ --noconfirm
}

function pacman_install() {
  sudo pacman -S $@ --noconfirm
}

## Text editors
pacman_install mousepad gedit
yaourt_install visual-studio-code-bin

## Browsers
pacman_install opera
yaourt_install google-chrome

## Messangers
yaourt_install zoom
# yaourt_install skypeforlinux-stable-bin

## REST clients
# yaourt_install postman-bin
yaourt_install insomnia

## Mongodb clients
yaourt_install mongodb-compass
# yaourt_install mongoclient
# sudo ln -s /usr/bin/Nosqlclient /opt/mongoclient/Nosqlclient

## Mongodb
# pacman_install mongodb
pacman_install mongodb-tools

## Shutter
yaourt_install shutter

## Docker
pacman_install docker docker-compose
# sudo groupadd docker
sudo gpasswd -a ${USER} docker
sudo systemctl enable docker
