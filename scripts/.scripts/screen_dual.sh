#!/bin/bash
intern=eDP1
extern=HDMI1

if xrandr | grep "$extern disconnected"; then
    xrandr --output "$extern" --off --output "$intern" --auto
else
    xrandr --output "$intern" --mode 1920x1080 --output "$extern" --auto
    # ratpoison -c "restart"
fi
