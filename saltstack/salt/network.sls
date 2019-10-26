dhcpcd:
  pkg.installed

dhcpcd:
  service.running:
    - enabler: True