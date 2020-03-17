openvpn:
  pkg.installed

/etc/openvpn/update-resolv-conf.sh:
  file.managed:
    - source: salt://environments/KBVB/update-resolv-conf.sh
    - user: root
    - group: root
    - mode: 774

/home/vercapi/vpn/kbvb:
  file.recurse:
    - source: salt://local/kbvbvpn
    - user: vercapi
    - group: vercapi
    - makedirs: True
    - recurse:
      - user
      - group

/home/vercapi/.ssh/config:
      file.managed:
        - source: salt://network/ssh.conf.jinja
        - user: vercapi
        - group: vercapi
        - mode: 600
        - template: jinja

/home/vercapi/.ssh/keys/kbvb:
      file.recurse:
        - source: salt://local/kbvbssl
        - user: vercapi
        - group: vercapi
        - makedirs: True
        - file_mode: 600
        - recurse:
          - user
          - group
          - mode
