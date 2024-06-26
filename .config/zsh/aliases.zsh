alias ls="lsd"
alias sudo="sudo --preserve-env=HOME"
alias config='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
alias vi="nvim"

# Tmux aliases
alias tm="tmux"
alias tma="tmux a"
alias tmat="tmux a -t"
alias tml="tmux ls"
alias tmks="tmux kill-server"

# List running tmux servers
alias tmsl="lsof -U | grep '^tmux'"

# TourneyMate tmux server
alias tmtm="tmux -L tourney-mate-api"
alias tmtml="tmux -L tourney-mate-api ls"
alias tmtmks="tmux -L tourney-mate-api kill-server"
alias tmtma="tmux -L tourney-mate-api a -t tourney-mate-api"
alias tmstm="tmux detach-client; tmtma"
alias tmsm="tmux detach-client; tma"

function tms() { tmux -L "$1" "${@:2}"; }
function tmsa() { tmux -L "$1" a; }
