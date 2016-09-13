#!/bin/bash
intern=eDP1
extern=HDMI1
xrandr --output "$intern" --auto --output "$extern" --off
# ratpoison -c "restart"

