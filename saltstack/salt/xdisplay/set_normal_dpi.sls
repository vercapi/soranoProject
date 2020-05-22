include:
  - xdisplay/normal_dpi
  - xdisplay
  - desktop

set_normal_dpi:
  cmd.script:
    - name: restart_xmonad.sh
    - source: salt://xdisplay/restart_xmonad.sh
    - runas: vercapi
    - require:
      - sls: xdisplay/normal_dpi
      - sls: xdisplay
      - sls: desktop
