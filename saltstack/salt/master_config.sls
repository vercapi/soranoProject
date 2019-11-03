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

{% if not salt['file.directory_exists' ]('/etc/apt/sources.list.d/saltstack.list') %}

add-key:
  cmd.run:
    - name: wget -O - https://repo.saltstack.com/py3/debian/10/armhf/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -

/etc/apt/sources.list.d/saltstack.list:
  file.managed:
    - source: salt://apt/saltstack.list
    - user: root
    - group: root
    - mode: 644
    - require:
      - cmd: add-key

{% endif %}

