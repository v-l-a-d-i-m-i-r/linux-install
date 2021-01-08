#!/bin/sh


apk update
apk add --upgrade apk-tools
apk upgrade --available

#
apk add --upgrade git vim tmux

# Zsh
apk add --upgrade zsh zsh-autosuggestions zsh-syntax-highlighting

# Docker
apk add --update docker docker-compose

rc-update add docker boot

# System

apk add --update lm_sensors htop glances bind-tools
