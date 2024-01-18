#!/bin/bash

zshrc="$HOME/.zshrc"

main() {
  # Install & Setup ZSH
  if ! is_zsh_installed; then
    echo "ZSH is not installed."
    install_zsh
  fi

  if ! is_zshrc; then
    echo "$zshrc does not exist."
    create_zshrc
  fi

  if is_zshrc_initialized; then
    echo "ZSH already initialized."
  else
    init_zshrc
  fi

  # Install Plugins
  install_plugins

  echo "All plugins installed"
}

# Checks to see if zsh is installed.
is_zsh_installed() {
  if which zsh &> /dev/null; then
    true
  else
    false
  fi
}

# Check to see if .zshrc file exists in the 
# home directory.
is_zshrc() {
  if [ -f $zshrc ]; then
    true
  else
    false
  fi
}

# Check to see if the .zshrc file already has
# been initialized by this script.
is_zshrc_initialized() {
  if grep -q "Start Init -->" $zshrc; then
    true
  else
    false
  fi
}

# Installs ZSH
install_zsh() {
  echo "Installling zsh..."
  sudo apt install zsh -y
  chsh -s $(which zsh)
}

# Creates a new .zshrc file with the initial config
# included.
create_zshrc() {
  touch $zshrc
  echo "Created $zshrc"
}

# Adds the right setting to ~/.zshrc.
init_zshrc() {
  cat zsh/init.zsh $zshrc > .zshrc.tmp
  mv .zshrc.tmp $zshrc
  echo "Initialized ZSH"
}

# Install plugins.
install_plugins() {
  if [ ! -d ~/.config/zsh-plugins ]; then
    mkdir ~/.config/zsh-plugins
  fi

  install_autosuggestions
  install_starship
}

install_autosuggestions() {
  if [ ! -d ~/.config/zsh-plugins/zsh-autosuggestions ]; then
    echo "Installing zsh-autosuggestions..."
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.config/zsh-plugins/zsh-autosuggestions
  fi
}

install_starship() {
  if ! which starship &> /dev/null; then
    echo "Installing Starship..."
    curl -sS https://starship.rs/install.sh | sh
  fi
}

main