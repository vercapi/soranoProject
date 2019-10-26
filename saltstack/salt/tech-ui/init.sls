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

lightdm:
  service.running:
    - enable: True

/home/vercapi/.xmonad/Xmonad.hs:
  - file.managed:
    - source: salt://tech-ui/Xmonad.hs
    - user: vercapi
    - group: vercapi
    
  