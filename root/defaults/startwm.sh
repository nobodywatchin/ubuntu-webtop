#!/bin/bash
setterm blank 0
setterm powerdown 0
export XDG_SESSION_TYPE=x11
export DESKTOP_SESSION=ubuntu
export GNOME_SHELL_SESSION_MODE=ubuntu
export XDG_CURRENT_DESKTOP=ubuntu:GNOME
sudo service dbus start
sudo rm -rf /config/.cache # fix firefox
mkdir -p /config/.config/gtk-3.0/ /config/.config/gtk-4.0/
echo -e "[Settings]\ngtk-application-prefer-dark-theme=1" > ~/.config/gtk-4.0/settings.ini # fix dark theme
echo -e "[Settings]\ngtk-application-prefer-dark-theme=1" > ~/.config/gtk-3.0/settings.ini # fix dark theme
gnome-shell --x11 -r > /dev/null 2>&1