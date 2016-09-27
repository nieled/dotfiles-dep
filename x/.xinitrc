# xsetroot -solid black &
# xcompmgr -c -f -D 5 &
xbindkeys &

# MPD daemon start (if no other user instance exists)
mpd

# ~/.scripts/ratpoison/app_select.sh terminal

# exec /usr/bin/ratpoison
# exec i3 -V >> ~/i3log-$(date +'%F-%k-%M-%S') 2>&1
# etxkbmap -layout us -variant altgr-intl -option nodeadkeys
setxkbmap us -variant altgr-intl&
nitrogen --restore&
exec i3
