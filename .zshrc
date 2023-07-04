echo "Reading .zshrc file..."
ZSH_THEME="steeef"

# ---------------------------------------------------------------------------------
# Path Configuration --------------------------------------------------------------
# ---------------------------------------------------------------------------------
export TMPATH="$XDG_CONFIG_HOME/TMUX"
export ANACONDA_HOME="$HOME/.local/anaconda3"
export PATH="$HOME/.cargo/bin:$HOME/.local/anaconda3/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
# Source environment files
. "$HOME/.cargo/env"

# ---------------------------------------------------------------------------------
# Oh My Zsh Configuration ---------------------------------------------------------
# ---------------------------------------------------------------------------------

zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' frequency 13
source ~/.oh-my-zsh/oh-my-zsh.sh

# ---------------------------------------------------------------------------------
# Node/NPM ------------------------------------------------------------------------
# ---------------------------------------------------------------------------------

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# ---------------------------------------------------------------------------------
# Conda initialize ----------------------------------------------------------------
# ---------------------------------------------------------------------------------

__conda_setup="$('$ANACONDA_HOME/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$ANACONDA_HOME/etc/profile.d/conda.sh" ]; then
        . "$ANACONDA_HOME/etc/profile.d/conda.sh"
    fi
fi
unset __conda_setup

# ---------------------------------------------------------------------------------
# Tmux ----------------------------------------------------------------------------
# ---------------------------------------------------------------------------------

if ! command -v tmux &> /dev/null; then
  echo "tmux not found, installing..."
  if [[ $(get_os) == "linux" ]]; then
    sudo apt-get update && sudo apt-get install -y tmux
  elif [[ $(get_os) == "macos" ]]; then
    brew install tmux
  else
    echo "Unable to install tmux, OS not supported"
  fi
fi

if [[ ! -d "$HOME/.tmux/plugins/tpm" ]]; then
    git clone https://github.com/tmux-plugins/tpm.git ~/.tmux/plugins/tpm
fi

# ---------------------------------------------------------------------------------
# User Configuration / Aliases ----------------------------------------------------
# ---------------------------------------------------------------------------------

# - Navigation -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias ~="cd ~"
alias cdz="cd ~/.zshrc"
alias cdt="cd ~/.config/tmux/tmux.conf"
alias cddot="cd ~/repos/.dotfiles/"
alias cdi3="cd ~/.config/i3/config"
alias cdn="cd ~/.config/nvim/"
alias cdnr="cd ~/.config/nvim/lua/flynnvim/remap.lua"
alias cdnw="cd ~/.config/nvim/lua/flynnvim/maps.lua"
alias cdnp="cd ~/.config/nvim/lua/flynnvim/packer.lua"
alias cdns="cd ~/.config/nvim/lua/flynnvim/set.lua"
alias cdna="cd ~/.config/nvim/after/plugin"

# - Nvim To File ----
alias goz="nvim ~/.zshrc"
alias got="nvim ~/.config/tmux/tmux.conf"
alias godot="nvim ~/repos/.dotfiles/"
alias goi3="nvim ~/.config/i3/config"
alias gon="nvim ~/.config/nvim/"
alias gonr="nvim ~/.config/nvim/lua/flynnvim/remap.lua"
alias gonw="nvim ~/.config/nvim/lua/flynnvim/maps.lua"
alias gonp="nvim ~/.config/nvim/lua/flynnvim/packer.lua"
alias gons="nvim ~/.config/nvim/lua/flynnvim/set.lua"
alias gona="nvim ~/.config/nvim/after/plugin"


# - Source --------
alias sz="source ~/.zshrc"
alias st="tmux source ~/.config/tmux/tmux.conf"

# - List --------
alias ll="ls -lah"
alias l="ls -l"
alias la="ls -la"
alias ls="ls -GFh"

# - Git ---------
alias gs="git status"
alias ga="git add"
alias gb="git branch"
alias gc="git commit"
alias gd="git diff"

alias pushconfig="cd ~/repos/.dotfiles; git add .; git commit -m 'Updated dotfiles'; git push"

# # Start tmux session if it doesn't exist, otherwise attach to the previous session named "main"
# tmux source ~/.config/tmux/tmux.conf
# if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
#   exec tmux new-session -A -s main
# fi

function myip() {
    ifconfig lo0 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "lo0       : " $2}'
	ifconfig en0 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "en0 (IPv4): " $2 " " $3 " " $4 " " $5 " " $6}'
	ifconfig en0 | grep 'inet6 ' | sed -e 's/ / /' | awk '{print "en0 (IPv6): " $2 " " $3 " " $4 " " $5 " " $6}'
	ifconfig en1 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "en1 (IPv4): " $2 " " $3 " " $4 " " $5 " " $6}'
	ifconfig en1 | grep 'inet6 ' | sed -e 's/ / /' | awk '{print "en1 (IPv6): " $2 " " $3 " " $4 " " $5 " " $6}'
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
