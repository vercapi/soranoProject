dhcpcd:
  pkg.installed: []
  service.running:
    - enable: True

networkmanager:
  pkg.installed:
    - networkmanager
    - nm-connection-editor

/etc/NetworkManager/system-connections/SRN_INT_24:
  file.managed:
    - source: salt://local/network/SRN_INT_24

NetworkManager:
  service.running:
    - enable: True
    - require:
      - pkg: networkmanager