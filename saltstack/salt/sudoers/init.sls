sudo:
  pkg.installed

/etc/sudoers:
  file.managed:
    - source: salt://sudoers/suoders_file
    - user: root
    - group: root
    - mode: 440