#!/bin/bash
setterm blank 0
setterm powerdown 0
export XDG_SESSION_TYPE=x11
export DESKTOP_SESSION=ubuntu
export GNOME_SHELL_SESSION_MODE=ubuntu
export XDG_CURRENT_DESKTOP=ubuntu:GNOME
sudo service dbus start
gnome-shell --x11 -r > /dev/null 2>&1