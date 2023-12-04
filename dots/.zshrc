echo "Reading .zshrc file..."
source ~/.exports
source ~/.aliases


bindkey -s ^f "tmux-sessionizer\n"
echo "cntrl-f to open tmux sessionizer"

# ----------------------------------------------------------------------------------
# User-Setup -----------------------------------------------------------------------
# ----------------------------------------------------------------------------------

mkdir -p "$HOME/.local/bin"

ZSH_THEME="steeef"

setopt NO_BEEP

# ---------------------------------------------------------------------------------
# Helper Functions ----------------------------------------------------------------
# ---------------------------------------------------------------------------------

function myip() {
    ifconfig lo0 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "lo0       : " $2}'
	ifconfig en0 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "en0 (IPv4): " $2 " " $3 " " $4 " " $5 " " $6}'
	ifconfig en0 | grep 'inet6 ' | sed -e 's/ / /' | awk '{print "en0 (IPv6): " $2 " " $3 " " $4 " " $5 " " $6}'
	ifconfig en1 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "en1 (IPv4): " $2 " " $3 " " $4 " " $5 " " $6}'
	ifconfig en1 | grep 'inet6 ' | sed -e 's/ / /' | awk '{print "en1 (IPv6): " $2 " " $3 " " $4 " " $5 " " $6}'
}

get_os() {
  case "$(uname -s)" in
    Linux*)     echo "linux";;
    Darwin*)    echo "macos";;
    CYGWIN*)    echo "windows";;
    MINGW*)     echo "windows";;
    MSYS*)      echo "windows";;
    *)          echo "unknown"
  esac
}

# ---------------------------------------------------------------------------------
# Oh My Zsh Configuration ---------------------------------------------------------
# ---------------------------------------------------------------------------------

zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' frequency 13

# Ensure ZSH and ZSH_CUSTOM are properly set with home directory expansion
ZSH="${ZSH:-$HOME/.oh-my-zsh}"
ZSH_CUSTOM="${ZSH_CUSTOM:-$ZSH/custom}"

# Clone zsh-vi-mode plugin if it doesn't exist
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-vi-mode" ]; then
    git clone https://github.com/jeffreytse/zsh-vi-mode "$ZSH_CUSTOM/plugins/zsh-vi-mode"
    source "$ZSH_CUSTOM/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh"
fi

# Add zsh-vi-mode to plugins array
plugins=(zsh-vi-mode)

# Configure ZVM_VI_ESCAPE_BINDKEY
echo "ZVM_VI_ESCAPE_BINDKEY=kj" >> "$ZSH_CUSTOM/custom.zsh"

# Source Oh My Zsh and custom configurations
source "$ZSH/oh-my-zsh.sh"
source "$ZSH_CUSTOM/custom.zsh"

# ---------------------------------------------------------------------------------
# Node/NPM ------------------------------------------------------------------------
# ---------------------------------------------------------------------------------

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# ---------------------------------------------------------------------------------
# Tmux ----------------------------------------------------------------------------
# ---------------------------------------------------------------------------------

if ! command -v tmux &> /dev/null; then
  echo "tmux not found, installing..."
  if [[ $(get_os) == "linux" ]]; then
    sudo apt-get update && sudo apt-get install -y tmux
	# connect to tmux session named "main" on startup as base
	if command -v tmux &> /dev/null; then
	  # Check if we are already inside a tmux session
	  if [ -z "$TMUX" ]; then
	    # Check if the "main" session already exists
	    if ! tmux has-session -t main &> /dev/null; then
	      # Create a new session named "main"
	      tmux new-session -s main -d
	    fi
	    # Attach to the "main" session
	    tmux attach-session -t main
	  fi
	fi
  elif [[ $(get_os) == "macos" ]]; then
    brew install tmux
	# connect to tmux session named "main" on startup as base
	if command -v tmux &> /dev/null; then
	  # Check if we are already inside a tmux session
	  if [ -z "$TMUX" ]; then
	    # Check if the "main" session already exists
	    if ! tmux has-session -t main &> /dev/null; then
	      # Create a new session named "main"
	      tmux new-session -s main -d
	    fi
	    # Attach to the "main" session
	    tmux attach-session -t main
	  fi
	fi
  else
    echo "Unable to install tmux, OS not supported"
  fi
fi

if [[ ! -d "$HOME/.tmux/plugins/tpm" ]]; then
    git clone https://github.com/tmux-plugins/tpm.git ~/.tmux/plugins/tpm
fi


[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/flynn/conda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/flynn/conda/etc/profile.d/conda.sh" ]; then
        . "/home/flynn/conda/etc/profile.d/conda.sh"
    else
        export PATH="/home/flynn/conda/bin:$PATH"
    fi
fi
unset __conda_setup

# <<< conda initialize <<<


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
