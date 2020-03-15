xmonad:
  pkg.installed:
    - pkgs:
        - xmonad
        - xmonad-contrib
        - xmonad-utils
        - xmobar
        - rofi
        - termite

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
