openvpn:
  pkg.installed

/etc/openvpn/update-resolv-conf.sh:
  file.managed:
    - source: salt://update-resolv-conf.sh
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