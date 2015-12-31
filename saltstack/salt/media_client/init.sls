# This is a configuration on Arch Linux

kodi:
  pkg.installed:
    - pkgs:
      - kodi-rbp
      - xorg-server
      - xf86-video-fbdev
      - xf86-video-vesa
      - omxplayer-git
      - xorg-xrefresh
      - xorg-xset
      - chromium

kodi_user:
  user.present:
    - name: kodi
    - shell: /bin/bash
    - home: /var/lib/kodi

kodi_service:
  service.running:
    - name: kodi
    - enable: True
      
# Provision zip file to install plugin
/var/lib/kodi/plugin.video.plexbmc-4.0.0beta4.zip:
  file.managed:
    - source: salt://media_client/plugin.video.plexbmc-4.0.0beta4.zip
    - user: kodi
    - group: kodi
    - mode: 644