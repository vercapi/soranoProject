debian_minion:
  dockerng.running:
    - image: vercapi/debian_minion:1.0
    - name: minion.sorano
    - hostname: minion.sorano
    - binds:
      - /srv/docker/volumes/minion.sorano/etc/salt/minion.d:/etc/salt/minion.d
      - /srv/docker/volumes/minion.sorano/etc/salt/pki:/etc/salt/pki