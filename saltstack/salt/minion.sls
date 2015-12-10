include:
  - bootstrap

{% for minion, minion_image in pillar.get('dockers', {}).items() %}
vercapi/{{minion_image}}:
  dockerng.image_present:
    - build: /home/sorano/soranoProject/docker/{{minion_image}}

/srv/docker/volumes/{{minion}}/etc/salt/minion.d:
  file.directory:
    - user: root
    - group: root
    - mode: 700
    - makedirs: True

/srv/docker/volumes/{{minion}}/etc/salt/pki:
  file.directory:
    - user: root
    - group: root
    - mode: 700
    - makedirs: True
        
{{minion}}:
  dockerng.running:
    - image: vercapi/{{minion_image}}
    - name: {{minion}}
    - hostname: {{minion}}
    - binds:
      - /srv/docker/volumes/{{minion}}/etc/salt/minion.d:/etc/salt/minion.d:rw
      - /srv/docker/volumes/{{minion}}/etc/salt/pki/:/etc/salt/pki:rw
{% endfor %}