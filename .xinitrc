# -----------------------------------------------------------------------------
# Xinit configuration file
# Location: ~/.xinit
# Author: Gonzalo Martínez
# Keyboard layout: spanish-la (latam) pc-model 105
# Window manager: Xmonad
# Display protocol: X
# -----------------------------------------------------------------------------

# Config obtain of https://github.com/xmonad/xmonad-contrib/blob/master/scripts/xinitrc

xrandr -s 0

xrdb $HOME/.Xresources
xsetroot -cursor_name left_ptr
xsetroot -solid '#000000'

# if we have private ssh key(s), start ssh-agent and add the key(s)
id1=$HOME/.ssh/identity
id2=$HOME/.ssh/id_dsa
id3=$HOME/.ssh/id_rsa
if [ -x /usr/bin/ssh-agent ] && [ -f $id1 -o -f $id2 -o -f $id3 ];
then
	eval `ssh-agent -s`
	ssh-add < /dev/null
fi

xset fp+ /usr/local/lib/X11/fonts/terminus
xset fp+ /usr/local/lib/X11/fonts/ghostscript
xset fp+ /usr/X11R6/lib/X11/fonts/TTF/

# xset fp rehash
xset b 100 0 0
xset r rate 140 200

# Keyboard configuration
setxkbmap \
  -model pc105 \
  -layout latam \
  -option caps:escape \
  -option terminate:ctrl_alt_bksp

xcape -e 'Super_L=Escape'

# Startup

xmonad &
unclutter &
wmname LG3 &
termite -e tmux &
google-chrome 

# wait for xmonad
wait $!
pkill -HUP dzen2
pkill -HUP -f xmonad-clock
wait

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources