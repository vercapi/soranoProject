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
    - groups:
      - bumbelbee
