/usr/share/applications/spotify.desktop:
  file.managed:
    - source: salt://software/spotify/spotify.desktop
    - mode: 644
