no_noveau:
  kmod.absent:
    - name: noveau

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
      - rxvt-unicode

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
    
  