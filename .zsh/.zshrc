# =============================================================================
# General ZSH settings
# =============================================================================

# Disable control flow
# ssty

# Set spelling correction
setopt correct

# Dont raise error when regex nomatch fires
unsetopt nomatch

# Colors for GNU ls
#eval 'dircolors ~/dotfiles/config/dircolors/gruvbox.dircolors'

# =============================================================================
# Oh my zsh settings
# =============================================================================

# Path to your OMZ installation.
export ZSH=$HOME/.oh-my-zsh

# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="bira"

# Disable auto title setting.
DISABLE_AUTO_TITLE="true"

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
alias q="exit"
alias ll="ls --color=auto -p -h --group-directories-first"
alias l.="ls -ld .*"

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
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias zshrc="nvim ~/.zshrc"
alias vimrc="nvim  ~/.config/nvim/init.vim"
alias tmuxrc="nvim ~/.tmux.conf"
alias i3rc="nvim ~/.config/i3/config"

# -----------------------------------------------------------------------------
# Tmux aliases
# -----------------------------------------------------------------------------

alias tmux-kill="tmux kill-session -t"
alias tmux-killall="tmux kill-session -a"
alias tmux-ls="tmux list-session"

# -----------------------------------------------------------------------------
# APT-GET
# -----------------------------------------------------------------------------
alias update="sudo apt-get update"
alias upgrade="sudo apt-get upgrade"
alias install="sudo apt-get install"

# -----------------------------------------------------------------------------
# Path aliases
# -----------------------------------------------------------------------------
alias p="cd ~/Projects"
alias proyects="cd ~/Projects"
alias code= "cd ~/Code"
alias c="cd ~/Code"
alias dl="cd ~/Descargas"

# -----------------------------------------------------------------------------
# Git aliases
# -----------------------------------------------------------------------------
alias ga="g add"
alias gs="g status"

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

# 256 color support
export TERM=xterm-256color

# Setting default editor
export EDITOR='nvim'
export VISUAL='nvim'
export MYNVIMRC='~/.config/nvim/init.vim'

export PATH=$HOME/bin:/usr/local/bin:$PATH
