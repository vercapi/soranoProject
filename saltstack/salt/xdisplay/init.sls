no_noveau:
  kmod.absent:
    - name: noveau

bbswitch:
  kmod.present:
    - name: bbswitch
    - persist: True

removed:
  pkg.removed:
    - pkg:
      - rxvt-unicode
      - noveau

xorg-server:
  pkg.installed:
    - pkgs:
      - xorg-server
      - bumblebee
      - bbswitch
      - nvidia
      - mesa
      - mesa-demos
      - xf86-video-intel 
      - xorg-xdpyinfo
      - xorg-xrandr
      - xorg-xrdb

bumblebee:
  group.present:
    - members:
        - vercapi

/etc/X11/xorg.conf.d/90-monitor.conf:
  file.managed:
  - source: salt://xdisplay/monitor.conf
  - user: vercapi
  - group: vercapi

/home/vercapi/.Xresources:
  file.managed:
    - source: salt://xdisplay/Xresources
    - user: vercapi
    - group: vercapi

/home/vercapi/.xinitrc:
  file.managed:
    - source: salt://xdisplay/xinitrc
    - user: vercapi
    - group: vercapi
    - makedirs: True

run_scaled_dependencies:
  pkg.installed:
    - pkgs:
        - xpra
        - xorg-server-xvfb
        - xorg-xrandr
        - bc

run_scaled:
  git.latest:
    - name: https://github.com/kaueraal/run_scaled.git
    - target: /opt/apps/run_scaled
    - branch: master

/opt/apps/run_scaled/run_scaled:
  file.managed:
    - replace: False
    - mode: 755

/usr/bin/run_scaled:
  file.symlink:
    - target: /opt/apps/run_scaled/run_scaled
    - mode: 755

ttf-bitstream-vera:
  pkg.installed:
    - pkgs:
        - ttf-croscore
        - noto-fonts
        - ttf-ubuntu-font-family
        - gnu-free-fonts
