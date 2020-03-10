users:
  group.present:
    - system: true
    - addusers:
        - vercapi

/opt/scripts:
  file.directory:
    - user: vercapi
    - group: users
    - mode: 775
