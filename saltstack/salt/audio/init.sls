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
