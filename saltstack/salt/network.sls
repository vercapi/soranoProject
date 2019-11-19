dhcpcd:
  pkg.installed: []
  service.running:
    - enable: True

networkmanager:
  pkg.installed: []

/etc/NetworkManager/system-connections/SRN_INT_24:
  file.managed:
    - source: salt://local/network/SRN_INT_24