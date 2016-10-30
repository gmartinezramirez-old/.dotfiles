

# ============================================================================
# Aliases  {{{
# ============================================================================

alias cl='clear'
alias update='sudo apt-get update'
alias upgrade='sudo apt-get upgrade'

# Aliases for Tmux
alias tmux='tmux -2'
alias ta='tmux attach -t'
alias tnew='tmux new -s'
alias tls='tmux ls'
alias tkill='tmux kill-session -t'

# Convenience aliases for editing configs
alias e= 'nvim'
alias v= 'nvim'
alias vimconf='nvim ~/.vimrc'
alias tmuxconf='nvim ~/.tmux.conf'
alias basconf='nvim ~/.bashrc'
alias zshconf='nvim ~/.zshrc'
alias i3conf='nvim ~/.config/i3/config'
alias pentaconf='nvim ~/.pentadactylrc'
alias reload= 'source ~/.zshrc'

# Aliases for specific folders
alias c='cd ~/Code'
alias p='cd ~/Projects'
alias dl='cd ~/Descargas'
alias d='cd ~/Dropbox'

# Aliases for ls
alias l='ls --color -h --group-directories-first -GFh'

# Aliases for mimic vim
alias :q='exit'

# Aliases for git
alias gi='nvim .gitignore'
alias gs='git status'
alias gp='git push'
alias gl='git pull'
alias gc='git commit'

# Bundler
alias b="bundle"

# Rails
alias migrate="rake db:migrate db:rollback && rake db:migrate db:test:prepare"
alias s="rspec"
