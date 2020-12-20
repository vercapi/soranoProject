pulseAudio:
  pkg.installed:
    - pkgs:
        - alsa-utils
        - pulseaudio-alsa
        - pavucontrol
        - paprefs
        - pulseaudio-equalizer
        - pulseeffects
        - projectm-pulseaudio
        - pulseaudio-bluetooth 
        - bluez-utils # bluethoot utilities

bluetooth.service:
  service.running:
    - enable: True

/etc/pulse/system.pa:
  file.append:
    - text: |
        ### Enable bluetooth audio
        load-module module-bluetooth-policy
        load-module module-bluetooth-discover
