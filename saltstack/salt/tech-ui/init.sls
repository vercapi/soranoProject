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

lightdm:
  service.running:
    - enable: True