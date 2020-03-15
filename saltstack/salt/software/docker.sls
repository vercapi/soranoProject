packages:
  pkg.installed:
    - pkgs:
      {% if grains['os'] == 'Arch' %}
      - docker
      {% elif grains['os'] == 'Debian' %}
      - docker-engine
      {% endif %}

docker:
  service.running:
    - enable: True
    - require:
      - pkg: packages
