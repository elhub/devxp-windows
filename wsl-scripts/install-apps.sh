#!/bin/bash
#
# Install and update important Linux applications

source ./script-utils.sh
keep_sudo_alive

# Update Ubuntu
sudo apt update
sudo apt upgrade -y

# Essential package
sudo apt -y install build-essential

# Git
sudo add-apt-repository -y ppa:git-core/ppa
sudo apt -y update
sudo apt -y install git

# PHP
sudo apt -y install php7.4
sudo apt -y install php7.4-curl
sudo apt -y install php7.4-xml

# Java
sudo apt -y install openjdk-8-jdk

# WSL Utilities
# See https://github.com/wslutilities/wslu
sudo apt -y install ubuntu-wsl

# Cleanup cached downloads
e_header "Removing unnecessary files"
sudo apt -y autoremove

# Finish
e_success "Finished applications installation."