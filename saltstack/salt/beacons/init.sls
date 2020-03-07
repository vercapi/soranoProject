/etc/salt/minion.d/beacons.conf:
 file.managed:
 - source: salt://beacons/beacons.conf.jinja
 - template: jinja
 - makedirs: True

/etc/salt/master.d/reactor.conf:
  file.managed:
  - source: salt://beacons/reactor.conf.jinja
  - template: jinja
  - makedirs: True

#TODO: Place reactor SLS files (loop here)

#TODO: reload sls files in master, reload beacons in minion