include:
  - bootstrap

vercapi/debian_minion:
  dockerng.image_present:
    - build: /home/sorano/soranoProject/docker/debian_minion

/srv/docker/volumes/minion/etc/salt/minion.d:
  file.directory:
    - user: root
    - group: root
    - mode: 700
    - makedirs: True

/srv/docker/volumes/minion/etc/salt/pki:
  file.directory:
    - user: root
    - group: root
    - mode: 700
    - makedirs: True
        
saltminion:
  dockerng.running:
    - image: vercapi/debian_minion
    - name: saltminion
    - hostname: minion.sorano
    - binds:
      - /srv/docker/volumes/minion/etc/salt/minion.d:/etc/salt/minion.d:rw
      - /srv/docker/volumes/minion/etc/salt/pki/:/etc/salt/pki:rw