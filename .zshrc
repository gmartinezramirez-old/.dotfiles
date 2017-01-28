# -----------------------------------------------------------------------------
# ZSH configuration file
# Location: ~/.dotfiles/zsh/.zshrc
# Symlinked: ~/.zshrc
# Author: Gonzalo Martinez
# -----------------------------------------------------------------------------

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
	colorflag="--color"
else # OS X `ls`
	colorflag="-G"
fi

# Plugin manager: Zplug
source ~/.zplug/init.zsh

# Supports oh-my-zsh plugins and the like
zplug "plugins/git",   from:oh-my-zsh
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search", defer:3
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "Tarrasch/zsh-bd"
# Async for zsh, used by pure
 zplug "mafredri/zsh-async", from:github, defer:0
# # Load completion library for those sweet [tab] squares
 zplug "lib/completion", from:oh-my-zsh
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
alias l="ls -lF ${colorflag} --group-directories-first"
#alias ls='ls -X --color=auto --group-directories-first'
alias la="ls -laF ${colorflag} | grep --color=never '^d' "
alias ll="ls -l --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F"
alias lt="ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F"
alias l.="ls -ld .* --group-directories-first --color=auto -F"
alias la="ls -la --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F"
alias ls="command ls ${colorflag} -X --group-directories-first"
export LS_COLORS="no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:"

alias grep="grep --color=tty -d skip"
alias cp="cp -i" # Confirm before overwriting something
alias df="df -h" # Human-readable sizes
alias free='free -m' # Show sizes in MB
alias halt="sudo poweroff"

# TODO: Aliases for copy/paste
#alias "c=xclip"
#alias "v=xclip -o"

# .............................................................................
# Applications
# .............................................................................
#alias e=$EDITOR
#alias v=$VISUAL
alias e="nvim"
alias v="nvim"
alias vim="nvim"
alias f="ranger"
alias d="docker"
alias g="git"
alias mux="tmuxinator"
alias vpn="sudo openvpn --config /home/gonzalo/config/client.ovpn"
#TODO: intellij alias dont work, must be refactored
#alias intellij="~/bin/intellij/bin/./idea.sh"

# .............................................................................
# Config files
# .............................................................................
alias dotfiles="cd ~/dotfiles"
alias dot="cd ~/dotfiles"
alias gitrc="e ~/dotfiles/git/.gitconfig"
alias i3rc="e ~/dotfiles/i3/config"
alias vimrc="e  ~/dotfiles/.vimrc"
alias tmuxrc="e ~/dotfiles/.tmux.conf"
alias termiterc="e ~/dotfiles/.tmuxrc"
alias zshconfig="e ~/dotfiles/.zshrc"
alias zshrc="e ~/dotfiles/.zshrc"
alias symrc="e ~/dotfiles/symbolic-link.sh"
alias xresrc="e ~/dotfiles/.Xresources"

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
alias upd="sudo apt-get update"
alias upgrade="sudo apt-get upgrade"
alias upg="sudo apt-get upgrade"
alias install="sudo apt-get install"

# .............................................................................
# Path aliases
# .............................................................................
alias home="$HOME"
alias p="cd ~/projects"
alias code= "cd ~/code"
alias c="cd ~/code"
alias dl="cd ~/Descargas"
alias README= "e README.md"
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
alias vpn-usach="sudo openvpn --config /home/gonzalo/vpn/usach/client.ovpn"
alias mac="ssh 158.170.35.22"
alias citiaps1="ssh 158.170.35.87"
alias citiaps2="ssh gonzalo@158.170.35.88"

# IP Addresses
alias pubip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="sudo ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'"
alias ips="sudo ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""


# -----------------------------------------------------------------------------
# Exports
# -----------------------------------------------------------------------------
export TERM=xterm-256color # 256 colour support
export EDITOR="nvim"
export VISUAL="nvim"
export MYNVIMRC="~/.config/nvim/init.vim"
export PATH=$HOME/bin:/usr/local/bin:$PATH

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
