xmonad:
  pkg.installed:
    - pkgs:
        - xmonad
        - xmonad-contrib
        - xmonad-utils
        - xmobar
        - lightdm # display manager / login screen
        - rofi # launcher
        - termite # terminale emulater
        - xorg-xev # ro find keybindings
        - xbindkeys # For media bindings
        - xorg-xbacklight # Conteol screen backlight
        - feh # Setting background
        - picom # compositor for transparency
        - python-pywal
        - stalonetray
        - xorg-server-xephyr # needed for testing lightdm (and other things)
        - xclip

/home/vercapi/.config/picom.conf:
  file.managed:
    - source: salt://desktop/picom.conf
    - user: vercapi
    - group: vercapi

/etc/lightdm/lightdm.conf:
  file.managed:
    - source: salt://desktop/lightdm.conf

/usr/share/lightdm/display-setup.sh:
  file.managed:
    - source: salt://desktop/display-setup.sh
    - makedirs: true
    - mode: 755

/etc/lightdm/lightdm-mini-greeter.conf:
  file.managed:
    - source: salt://desktop/lightdm-mini-greeter.conf

/home/vercapi/.xbindkeysrc:
  file.managed:
    - source: salt://desktop/xbindkeysrc
    - user: vercapi
    - group: vercapi

/home/vercapi/.xmonad/lib/Colors.hs:
  file.symlink:
    - target: /home/vercapi/.cache/wal/colors.hs
    - makedirs: true
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
    - template: jinja
    - user: vercapi
    - group: vercapi

/usr/share/pixmaps/wallpaper.jpg:
  file.managed:
    - source: salt://desktop/wallpaper.jpg
    - mode: 644

/home/vercapi/.xmobarrc:
  file.managed:
    - source: salt://desktop/xmobarrc
    - template: jinja
    - user: vercapi
    - group: vercapi

/home/vercapi/.stalonetrayrc:
  file.managed:
    - source: salt://desktop/stalonetrayrc
    - template: jinja
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
   - template: jinja
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
