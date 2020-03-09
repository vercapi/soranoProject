/opt/apps/oracle/:
  file.directory:
    - user: vercapi
    - group: users
    - mode: 775
    - makedirs: true

oracle:
  group.present:
    - system: True