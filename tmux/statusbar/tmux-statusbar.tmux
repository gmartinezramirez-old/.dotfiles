# =============================================================================
# Status bar settings
# =============================================================================

# Set status position
set-option -g status-position bottom

# Set the base at 1
set -g base-index 1
setw -g pane-base-index 1

# Renumber when windows is closed
set -g renumber-windows on

# Activity monitoring
setw -g monitor-activity on

# Status settings
set -g status-interval 15
set -g status-justify centre

# Left Status
set -g status-left-length  20
set -g status-left "[#S]"

# Right Status
set -g status-right-length 20
set -g status-right "%l:%M %b %d %a "

