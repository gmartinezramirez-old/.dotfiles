# Tmux plugins {{{
# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sessionist'
set -g @plugin 'tmux-plugins/tmux-yank'
set -g @plugin 'tmux-plugins/tmux-copycat'
set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g @plugin 'tmux-plugins/tmux-continuum'
  # last saved environment is automatically restored when tmux is started.
  set -g @continuum-restore 'on'

set -g @plugin 'tmux-plugins/tmux-prefix-highlight'
set -g status-right '#{prefix_highlight} | %a %Y-%m-%d %H:%M'

#set -g @plugin 'tmux-plugins/tmux-online-status'
#set -g status-right "Online: #{online_status} | %a %h-%d %H:%M "


set -g @plugin 'tmux-plugins/tmux-open'

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run '~/.tmux/plugins/tpm/tpm'

# }}}
