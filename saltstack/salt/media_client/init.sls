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

autologin:
  group.present
      
kodi_user:
  user.present:
    - groups:
      - autologin
    - require:
      - group: autologin

kodi_service:
  service.running:
    - name: kodi
    - enable: True