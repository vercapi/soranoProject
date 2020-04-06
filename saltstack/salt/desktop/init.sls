xmonad:
  pkg.installed:
    - pkgs:
        - xmonad
        - xmonad-contrib
        - xmonad-utils
        - xmobar
        - rofi # launcher
        - termite # terminale emulater
        - xorg-xev # ro find keybindings
        - xbindkeys # For media bindings
        - xorg-xbacklight # Conteol screen backlight

/home/vercapi/.xbindkeysrc:
  file.managed:
    - source: salt://desktop/xbindkeysrc
    - user: vercapi
    - group: vercapi

/home/vercapi/.xmonad/startup.sh:
  file.managed:
    - source: salt://desktop/startup.sh
    - user: vercapi
    - group: vercapi

/home/vercapi/.xmonad/xmonad.hs:
  file.managed:
    - source: salt://desktop/Xmonad.hs
    - user: vercapi
    - group: vercapi

/home/vercapi/.xmobarrc:
  file.managed:
    - source: salt://desktop/xmobarrc
    - user: vercapi
    - group: vercapi

/home/vercapi/.config/termite/config:
  file.managed:
    - source: salt://desktop/termite.conf
    - user: vercapi
    - group: vercapi
    - makedirs: True

/home/vercapi/.config/rofi/config:
 file.managed:
   - source: salt://desktop/rofi-config
   - user: vercapi
   - group: vercapi
   - makedirs: True

arc-theme:
  pkg.installed:
    - pkgs:
        - arc-gtk-theme

#/usr/share/icons/Blue-Maia:
#  file.recurse:
#    - source: salt://local/desktop/Blue-Maia
#    - user: root
#    - group: root
#    - makedirs: True
#    - recurse:
#        - user
#        - group

/home/vercapi/.gtkrc-2.0:
  file.managed:
    - source: salt://desktop/gtk2.conf
    - user: vercapi
    - group: vercapi
    - makeidirs: True

/home/vercapi/.config/gtk-3.0/settings.ini:
  file.managed:
    - source: salt://desktop/gtk3.conf
    - user: vercapi
    - group: vercapi
    - makeidirs: True
