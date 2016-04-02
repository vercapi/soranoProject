{% set name = salt['pillar.get']('home_dockers:minion.sorano:name') %}

debian_minion:
  dockerng.running:
    - image: vercapi/debian_minion:{{salt['pillar.get']('home_dockers:minion.sorano:version')}}
    - name: {{name}}
    - hostname: {{name}}
    - binds:
      - /srv/docker/volumes/minion.sorano/etc/salt/minion.d:/etc/salt/minion.d
      - /srv/docker/volumes/minion.sorano/etc/salt/pki:/etc/salt/pki