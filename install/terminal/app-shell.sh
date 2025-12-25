#!/bin/bash

# Default to Bash if not set
SHELL_CHOICE="${OMAKUB_FIRST_RUN_SHELL:-Bash}"

if [ "$SHELL_CHOICE" == "Zsh" ]; then
  # Install Zsh
  sudo apt install -y zsh

  # Configure Zsh
  [ -f ~/.zshrc ] && mv ~/.zshrc ~/.zshrc.bak
  cp ~/.local/share/omakub/configs/zshrc ~/.zshrc

  # Set Zsh as default shell
  sudo chsh -s $(which zsh) $USER
else
  # Configure Bash
  [ -f ~/.bashrc ] && mv ~/.bashrc ~/.bashrc.bak
  cp ~/.local/share/omakub/configs/bashrc ~/.bashrc

  # Load the PATH for use later in the installers
  source ~/.local/share/omakub/defaults/bash/shell

  [ -f ~/.inputrc ] && mv ~/.inputrc ~/.inputrc.bak
  # Configure the inputrc using Omakub defaults
  cp ~/.local/share/omakub/configs/inputrc ~/.inputrc
fi
