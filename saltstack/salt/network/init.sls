dhcpcd:
  pkg.installed: []
  service.running:
    - enable: True

networkmanager:
  pkg.installed:
    - pkgs:
      - networkmanager
      - nm-connection-editor

NetworkManager:
  service.running:
    - enable: True
    - require:
      - pkg: networkmanager

/opt/scripts/create_network.sh:
  file.managed:
    - source: salt://network/wifi.sh.jinja
    - template: jinja
    - makedirs: True
    - user: vercapi
    - group: users
    - mode: 770
