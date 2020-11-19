#!/bin/bash
#
# Install and update important Linux applications

source ./script-utils.sh
keep_sudo_alive

e_header "Installing zsh"

# Zsh
sudo apt -y install curl
sudo apt -y install git
sudo apt -y install zsh

# Oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Cleanup cached downloads
e_header "Cleaning up"
sudo apt -y autoremove

# Finish
e_success "Finished zsh install"