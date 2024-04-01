FROM ghcr.io/linuxserver/baseimage-kasmvnc:ubuntujammy

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="mollomm1"

ENV TITLE="Ubuntu 22.04 Gnome"

COPY /root/etc/apt/preferences.d/firefox-no-snap /etc/apt/preferences.d/firefox-no-snap

COPY /root/ /

RUN \
  echo "**** install packages ****" && \
  add-apt-repository -y ppa:mozillateam/ppa && \
  apt-get update && \
  apt-get install -y \
    firefox \
    fonts-ubuntu \
    gnome-shell \
    gnome-shell-* \
    dbus-x11 \
    gnome-terminal \
    gnome-accessibility-themes \
    gnome-calculator \
    gnome-control-center* \
    gnome-desktop3-data \
    gnome-initial-setup \
    gnome-menus \
    gnome-text-editor \
    gnome-themes-extra* \
    gnome-user-docs \
    gnome-video-effects \
    gnome-tweaks \
    gnome-software \
    language-pack-en-base \
    mesa-utils \
    yaru-* && \

  for file in $(find /usr -type f -iname "*login1*"); do mv -v $file "$file.back"; done && \

  echo "sudo chmod u+s /usr/lib/dbus-1.0/dbus-daemon-launch-helper\nexport XDG_CURRENT_DESKTOP=ubuntu:GNOME" >> /config/.bashrc && \

  mv -v /usr/share/applications/gnome-sound-panel.desktop /usr/share/applications/gnome-sound-panel.desktop.back && \

  apt-get remove -y \
    gnome-power-manager \
    gnome-bluetooth \
    gnome-software \
    gpaste \
    hijra-applet gnome-shell-extension-hijra \
    mailnag gnome-shell-mailnag \
    gnome-shell-pomodoro gnome-shell-pomodoro-data && \

    export $(dbus-launch) && \
    dconf load / < /defaults/gnome.dconf.conf 

# ports and volumes
EXPOSE 3000

VOLUME /config
