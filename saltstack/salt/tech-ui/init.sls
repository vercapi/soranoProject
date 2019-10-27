xmonad:
  pkg.installed:
    - pkgs:
      - xorg-server
      - lightdm
      - lightdm-gtk-greeter
      - light-locker
      - xmonad-contrib
      - xmonad-utils
      - xmobar
      - stalonetray
      - urxvt

lightdm:
  service.running:
    - enable: True

/home/vercapi/.xmonad/Xmonad.hs:
  file.managed:
    - source: salt://tech-ui/Xmonad.hs
    - user: vercapi
    - group: vercapi

/home/vercapi/.xmobarrc:
  file.managed:
    - source: salt://tech-ui/xmobarrc
    - user: vercapi
    - group: vercapi
    
  