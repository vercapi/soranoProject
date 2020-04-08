vercapi:
  group.present:
    - gid: 2200
    - system: true
  user.present:
    - shell: /bin/bash
    - home: /home/vercapi
    - fullname: Pieter Vercammen
    - uid: 2200
    - gid: 2200

/home/vercapi/.bash_profile:
  file.managed:
    - source: salt://users/bash_profile
    - user: vercapi
    - group: vercapi

/home/vercapi/.bashrc:
  file.managed:
    - source: salt://users/bashrc
