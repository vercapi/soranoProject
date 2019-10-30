eth0:
  network.managed:
    - enabled: True
    - type: eth
    - proto: static
    - ipaddr: 192.168.1.2
    - netmask: 255.255.255.0
    - gateway: 192.168.1.1
    - enable_ipv6: false
    - dns:
      - 192.168.1.1
