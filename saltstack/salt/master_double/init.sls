/etc/salt/master:
  file.managed:
    - source: salt://master_double/master

salt-master:
  service.running:
    -enable: True