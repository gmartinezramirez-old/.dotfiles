# -----------------------------------------------------------------------------
# TMUX Plugins list
# -----------------------------------------------------------------------------
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sessionist'
set -g @plugin 'tmux-plugins/tmux-yank'
set -g @plugin 'tmux-plugins/tmux-copycat'
set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g @plugin 'tmux-plugins/tmux-continuum'
set -g @plugin 'tmux-plugins/tmux-prefix-highlight'
set -g @plugin 'tmux-plugins/tmux-open'

# -----------------------------------------------------------------------------
# Plugins configuration
# -----------------------------------------------------------------------------
# Last saved environment is automatically restored when tmux is started.
set -g @continuum-restore 'on'
