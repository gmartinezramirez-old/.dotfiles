# -----------------------------------------------------------------------------
# ZSH configuration file
# Location: ~/.dotfiles/zsh/.zshrc
# Symlinked: ~/.zshrc (actual)
# Author: Gonzalo Martinez
# -----------------------------------------------------------------------------


# Plugin manager: Zplug
source ~/.zplug/init.zsh

# Make sure to use double quotes
zplug "zsh-users/zsh-history-substring-search"

# Supports oh-my-zsh plugins and the like
zplug "plugins/git",   from:oh-my-zsh

zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search", defer:3
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# Async for zsh, used by pure
 zplug "mafredri/zsh-async", from:github, defer:0
# # Load completion library for those sweet [tab] squares
 zplug "lib/completion", from:oh-my-zsh
# # Syntax highlighting for commands, load last
# zplug "zsh-users/zsh-syntax-highlighting", from:github, defer:3
# # Theme!
 zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme


# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
       echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose

setopt always_last_prompt
setopt auto_cd
setopt auto_menu
setopt auto_param_keys
setopt auto_param_slash
setopt auto_pushd
setopt complete_in_word
setopt globdots
setopt interactive_comments
setopt list_types
setopt magic_equal_subst

#TODO: is too slow
#zstyle ':completion::complete:*' use-cache 1
#zstyle ':completion:*:default' menu 'select=0'

# -----------------------------------------------------------------------------
# Aliases
# -----------------------------------------------------------------------------

# .............................................................................
# System aliases
# .............................................................................
alias b="cd .."
alias c="clear"
alias q="exit"
alias ls='ls -X --color=auto --group-directories-first'
alias ll="ls -l --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F"
alias lt="ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F"
alias l.="ls -ld .* --group-directories-first --color=auto -F"
alias la="ls -la --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F"
alias grep="grep --color=tty -d skip"
alias cp="cp -i" # Confirm before overwriting something
alias df='df -h' # Human-readable sizes
alias free='free -m' # Show sizes in MB
alias halt="sudo poweroff"

# .............................................................................
# Applications
# .............................................................................
alias e=$EDITOR
alias v=$VISUAL
alias f="ranger"
alias d="docker"
alias g="git"
alias mux="tmuxinator"
alias vpn="sudo openvpn --config /home/gonzalo/config/client.ovpn"
alias intellij="~/bin/intellij/bin/./idea.sh"

# .............................................................................
# Config files
# .............................................................................
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

# .............................................................................
# Reload config files
# .............................................................................
alias zshreload="source ~/.zshrc"
alias tmuxreload="source ~/.tmux.conf"
alias i3reload="source ~/.i3"

# .............................................................................
# Tmux aliases
# .............................................................................
alias tmux-kill="tmux kill-session -t"
alias tmux-killall="tmux kill-session -a"
alias tmux-ls="tmux list-session"
alias tls="tmux list-session"

# .............................................................................
# apt-get
# .............................................................................
alias update="sudo apt-get update"
alias upgrade="sudo apt-get upgrade"
alias install="sudo apt-get install"

# .............................................................................
# Path aliases
# .............................................................................
alias home="$HOME"
alias p="cd ~/projects"
alias code= "cd ~/code"
alias c="cd ~/code"
alias dl="cd ~/Descargas"
alias README= "nvim README.md"
alias dropbox="cd ~/Dropbox"
alias dbox="cd ~/Dropbox"

# .............................................................................
# Git aliases
# .............................................................................
alias ga="g add"
alias gs="g status"
alias gc="g commit"
alias s="g status"

# .............................................................................
# Access
# .............................................................................
alias mac="ssh 158.170.35.22"
#alias citiaps="ssh gonzalo@158.170.35.88"
alias citiaps1="ssh gonzalo@citiaps1.diinf.usach.cl"

# -----------------------------------------------------------------------------
# Exports
# -----------------------------------------------------------------------------
export TERM=xterm-256color # 256 colour support
export EDITOR='nvim'
export VISUAL='nvim'
export MYNVIMRC='~/.config/nvim/init.vim'
export PATH=$HOME/bin:/usr/local/bin:$PATH

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
