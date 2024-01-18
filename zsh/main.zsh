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

source ~/.config/zsh-plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# +---------+
# | Aliases |
# +---------+

source "${HOME}/.config/zsh/aliases.zsh"

# +--------+
# | PROMPT |
# +--------+

# Prmopt Setup
export STARSHIP_CONFIG="${HOME}/.config/starship/starship.toml"
eval "$(starship init zsh)"