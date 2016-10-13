xbindkeys &
setxkbmap us -variant altgr-intl&
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
[ ! -s ~/.config/mpd/pid ] && mpd
exec i3
