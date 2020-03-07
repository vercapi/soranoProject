no_noveau:
  kmod.absent:
    - name: noveau

removed:
  pkg.removed:
    - pkg:
      - rxvt-unicode
      - noveau

xmonad:
  pkg.installed:
    - pkgs:
      - xorg-server
      - bumblebee
      - nvidia
      - mesa
      - mesa-demos
      - xf86-video-intel 
      - lightdm
      - lightdm-gtk-greeter
      - light-locker
      - xmonad-contrib
      - xmonad-utils
      - xmobar
      - stalonetray
      - xorg-xdpyinfo
      - xorg-xrandr
      - terminus-font
      - termite
      - lastpass-cli
      - syncthing
      - xorg-xrdb
      - rofi

# syncthing needs manual config

syncthing@vercapi.service:
  service.running:
    - enable: True

lightdm:
  service.running:
    - enable: True

/home/vercapi/.xmonad/xmonad.hs:
  file.managed:
    - source: salt://tech-ui/Xmonad.hs
    - user: vercapi
    - group: vercapi

/home/vercapi/.xmobarrc:
  file.managed:
    - source: salt://tech-ui/xmobarrc
    - user: vercapi
    - group: vercapi
    
/etc/X11/xorg.conf.d/90-monitor.conf:
  file.managed:
    - source: salt://tech-ui/monitor.conf
    - user: vercapi
    - group: vercapi

/home/vercapi/.Xresources:
  file.managed:
    - source: salt://tech-ui/Xresources
    - user: vercapi
    - group: vercapi

/home/vercapi/.config/termite/config:
  file.managed:
    - source: salt://tech-ui/termite.conf
    - user: vercapi
    - group: vercapi
    - makedirs: True

/home/vercapi/.xinitrc:
  file.managed:
    - source: salt://tech-ui/xinitrc
    - user: vercapi
    - group: vercapi
    - makedirs: True

/home/vercapi/.config/rofi/config:
    file.managed:
      - source: salt://tech-ui/rofi-config
      - user: vercapi
      - group: vercapi
      - makedirs: True