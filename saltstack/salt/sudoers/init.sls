sudo:
  pkg.installed

/etc/sudoers:
  file.managed:
    - source: salt://sudoers/sudoers_file
    - user: root
    - group: root
    - mode: 440