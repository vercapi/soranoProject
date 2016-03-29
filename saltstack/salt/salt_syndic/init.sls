# This configuration is for Arch Linux

salt-zmq:
  pkg.installed:
    - pkgs:
      - salt-zmq
        
salt-minion:
  service.running:
    - enable: True

/etc/salt/master:
  file.managed:
    - source: salt://salt_syndic/master
  
salt-master:
  service.running:
    - enable: True
    - require:
      - file: /etc/salt/master  
      
salt-syndic:
  service.running:
    - enable: True
    - require:
      - file: /etc/salt/master

