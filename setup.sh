#!/bin/bash

CONFIG_FILE="test.sh"
INIT_STRING="source ~/.config/zsh/main.zsh"

main() {
  if test -f ~/$CONFIG_FILE; then
    echo "ZSH config exists."
    
    if check_if_initialized; then
      echo "Custom config alreasy initialized"
    else
      echo "Initializing custom config in existing .zshrc"
    fi
  else
    echo "Creating new .zshrc"
    create_zshrc
  fi
}

# Checks to see if the .zshrc file already has the
# proper entries.
check_if_initialized() {
  if grep -q "$INIT_STRING" ~/.zshrc; then
    true
  else
    false
  fi
}

# Creates a new .zshrc file with the initial config
# included.
create_zshrc() {
  touch ~/test.sh
#   cat <<- EOF > ~/test.sh
#   $INIT_STRING
# EOF
}

init_zshrc() {
  echo "$INIT_STRING" >> ~/test.sh
}

main