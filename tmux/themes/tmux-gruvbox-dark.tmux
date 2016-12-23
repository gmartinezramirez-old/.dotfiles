# =============================================================================
# Tmux colorscheme: Gruvbox dark
# =============================================================================
set-option -g status-bg colour237 #bg1
set-option -g status-fg colour223 #fg1

# default window title colors
set-window-option -g window-status-bg colour214 #yellow
set-window-option -g window-status-fg colour237 #bg1

set-window-option -g window-status-activity-bg colour237 #bg1
set-window-option -g window-status-activity-fg colour248 #fg3

# active window title colors
set-window-option -g window-status-current-bg default
set-window-option -g window-status-current-fg colour237 #bg1

# Pane border
#set-option -g pane-border "#444444" # Gray
set-option -g pane-border-bg "#444444" # Gray
set-option -g pane-border-fg "#444444" # Gray
#set-option -g pane-border-fg colour237 #bg1

# Active pane
#set-option -g pane-active-border "#00afff" # Light blue
set-option -g pane-active-border-bg "#0087d7" # Light blue
set-option -g pane-active-border-fg default

#set-option -g pane-active-border-fg colour250 #fg2

# Windows active style
#tmux_conf_theme_focused_pane_fg='default'
#tmux_conf_theme_focused_pane_bg='#0087d7' # Light blue
#setw -g window-active-style "fg=default, bg=#0087d7"
setw -g window-active-style default

# message infos
#tmux_conf_theme_highlight_focused_pane
set-option -g message-bg colour239 #bg2
set-option -g message-fg colour223 #fg1

# writting commands inactive
set-option -g message-command-bg colour239 #fg3
set-option -g message-command-fg colour223 #bg1

# pane number display
set-option -g display-panes-active-colour colour250 #fg2
set-option -g display-panes-colour colour237 #bg1

# clock
set-window-option -g clock-mode-colour colour109 #blue

# bell
set-window-option -g window-status-bell-style fg=colour235,bg=colour167 #bg, red

## Theme settings mixed with colors (unfortunately, but there is no cleaner way)
set-option -g status-attr "none"
set-option -g status-justify "left"
set-option -g status-left-attr "none"
set-option -g status-left-length "80"
set-option -g status-right-attr "none"
set-option -g status-right-length "80"

set-window-option -g window-status-activity-attr "none"
set-window-option -g window-status-attr "none"
set-window-option -g window-status-separator ""

set-option -g status-left "❐  #S" 
#set-option -g status-left-attr "bold"
#set-option -g status-left "#[fg=colour248, bg=colour241] #S #[fg=colour241, bg=colour237, nobold, noitalics, nounderscore]"
#set-option -g status-left-fg='#000000,#e4e4e4,#e4e4e4'  # black, white , white
#set-option -g status-left-bg='#ffff00,#ff00af,#00afff'  # yellow, pink, white blue
#set-option -g status-left-attr='bold,none,none'


#set-option -g status-right "#[fg=colour239, bg=colour237, nobold, nounderscore, noitalics]#[fg=colour246,bg=colour239] %Y-%m-%d  %H:%M #[fg=colour248, bg=colour239, nobold, noitalics, nounderscore]#[fg=colour237, bg=colour248] #h "
#set-option -g status-right-fg "#8a8a8a,#e4e4e4,#000000"
#set-option -g status-right-bg '#080808,#d70000,#e4e4e4'
#set-option -g status-right-attr 'none,none,bold'

set-window-option -g window-status-current-format "#[fg=colour239, bg=colour248, :nobold, noitalics, nounderscore]#[fg=colour239, bg=colour214] #I #[fg=colour239, bg=colour214, bold] #W #[fg=colour214, bg=colour237, nobold, noitalics, nounderscore]"

set-window-option -g window-status-format "#[fg=colour237,bg=colour239,noitalics]#[fg=colour223,bg=colour239] #I #[fg=colour223, bg=colour239] #W #[fg=colour239, bg=colour237, noitalics]"
