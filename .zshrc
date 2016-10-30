#File path: ~/.zshrc

# =============================================================================
# Global variables
# =============================================================================
#$DOWNLOAD_DIR = "~/Descargas"
#$DOTFILES_DIR = "~/dotfiles"
#$PROJECTS_DIR = "~/projects"

# =============================================================================
# General ZSH settings
# =============================================================================
# Disable control flow
# ssty

setopt correct # Set spelling correction
unsetopt nomatch # Dont raise error when regex nomatch fires

# Colors for GNU ls
# TODO: Fix initial display of the configuration
#eval 'dircolors ~/dotfiles/config/dircolors/gruvbox.dircolors'

# =============================================================================
# Oh my zsh settings
# =============================================================================
export ZSH=$HOME/.oh-my-zsh # Path to OMZ installation
ZSH_THEME="bira" # Look in ~/.oh-my-zsh/themes
DISABLE_AUTO_TITLE="true" # Disable auto title setting

# =============================================================================
# Plugins declaration
# =============================================================================
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(git bower gulp docker extract gem ruby rails git-flow gitfast zsh-autosuggestions zsh-syntax-highlighting zsh-completions tmux tmuxinator) 

# =============================================================================
# Aliases
# =============================================================================

# -----------------------------------------------------------------------------
# System aliases
# -----------------------------------------------------------------------------
alias b="cd .."
alias c="clear"
alias q="exit"
alias ll="ls -l --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F"
alias lt="ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F"
alias l.="ls -ld .* --group-directories-first --color=auto -F"
alias la="ls -la --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F"
alias grep="grep --color=tty -d skip"
alias cp="cp -i" # Confirm before overwriting something
alias df='df -h' # Human-readable sizes
alias free='free -m' # Show sizes in MB

# -----------------------------------------------------------------------------
# Applications
# -----------------------------------------------------------------------------
alias e=$EDITOR
alias v=$VISUAL
alias f="ranger"
alias d="docker"
alias g="git"
alias mux="tmuxinator"

# -----------------------------------------------------------------------------
# Config files
# -----------------------------------------------------------------------------
alias dotfiles="cd ~/dotfiles"
alias dot="cd ~/dotfiles"
alias gitrc="cd ~/.gitconfig"
alias i3rc="nvim ~/.config/i3/config"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias vimrc="nvim  ~/.config/nvim/init.vim"
alias tmuxrc="nvim ~/.tmux.conf"
alias termiterc="nvim ~/.config/termite/config"
alias zshconfig="nvim ~/.zshrc"
alias zshrc="nvim ~/.zshrc"

# -----------------------------------------------------------------------------
# Reload config files
# -----------------------------------------------------------------------------
alias zshreload="source ~/.zshrc"
alias tmuxreload="source ~/.tmux.conf"
alias i3reload="source ~/.i3"

# -----------------------------------------------------------------------------
# Tmux aliases
# -----------------------------------------------------------------------------
alias tmux-kill="tmux kill-session -t"
alias tmux-killall="tmux kill-session -a"
alias tmux-ls="tmux list-session"
alias tls="tmux list-session"

# -----------------------------------------------------------------------------
# apt-get
# -----------------------------------------------------------------------------
alias update="sudo apt-get update"
alias upgrade="sudo apt-get upgrade"
alias install="sudo apt-get install"

# -----------------------------------------------------------------------------
# Path aliases
# -----------------------------------------------------------------------------
alias home="$HOME"
alias p="cd ~/Projects"
alias projects="cd ~/Projects"
alias code= "cd ~/Code"
alias c="cd ~/Code"
alias dl="cd ~/Descargas"
alias README= "nvim README.md"

# -----------------------------------------------------------------------------
# Git aliases
# -----------------------------------------------------------------------------
alias ga="g add"
alias gs="g status"
alias s="g status"

# =============================================================================
# Sourcing
# =============================================================================
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source $ZSH/oh-my-zsh.sh
#source ~/.bin/tmuxinator.zsh
#source ~/usr/bin/tmuxinator

# =============================================================================
# Exports
# =============================================================================
export TERM=xterm-256color # 256 colour support
export EDITOR='nvim' 
export VISUAL='nvim'
export MYNVIMRC='~/.config/nvim/init.vim'
export PATH=$HOME/bin:/usr/local/bin:$PATH
