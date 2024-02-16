# +-----------------+
# | GLOBAL SETTINGS |
# +-----------------+

dotfiles="$HOME/.config"

# +---------------+
# | INITIAL SETUP |
# +---------------+

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename "/home/${USER}/.zshrc"

autoload -Uz compinit
compinit
# End of lines added by compinstall

# +------------------+
# | Auto Completions |
# +------------------+

source $dotfiles/zsh/zsh-plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# +---------+
# | Aliases |
# +---------+

source $dotfiles/zsh/aliases.zsh

# +--------+
# | PROMPT |
# +--------+

# Prmopt Setup
export STARSHIP_CONFIG="$dotfiles/starship/starship.toml"
eval "$(starship init zsh)"

# +--------+
# | NEOVIM |
# +--------+

export PATH="$PATH:/opt/nvim-linux64/bin"

# +------------------+
# | Config Directory |
# +------------------+

export XDG_CONFIG_HOME="$HOME/.config"

# +------------+
# | NVM Config |
# +------------+

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
