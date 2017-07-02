#xmodmap ~/dotfiles/.xmodmap
setxkbmap \
    -model pc105 \
    -layout latam \
    -option caps:super \
    -option terminate:ctrl_alt_bksp
xcape -e 'Super_L=Escape'
