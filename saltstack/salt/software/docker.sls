packages:
  pkg.installed:
    - pkgs:
      {% if grains['os'] == 'Arch' %}
      - docker
      {% elif grains['os'] == 'Debian' %}
      - docker-engine
      {% endif %}

service:
  service.running:
    - name: docker
    - enable: True
    - require:
      - pkg: packages

groups:        
  group.present:
    - name: docker
    - system: true
    - addusers:
        - vercapi
