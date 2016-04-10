{% set repo_dir = salt['pillar.get']('dockers:repository:location') %}

packages:
  pkg.installed:
    - pkgs:
      {% if grains['os'] == 'Arch' %}
      - docker
      {% elif grains['os'] == 'Debian' %}
      - docker-engine
      {% endif %}

docker-repo-create:
  file.directory:
    - name: {{ repo_dir }}
    - makedirs: True
    {% if grains['id'] != 'nitro.sorano' %}  # This is a NTFS mount on this minion
    - user: root
    - group: root
    - dir-mode: 700
    - file-mode: 600
    {% endif %}

{% if grains['id'] != 'sorano.home' %}
docker-repo-link:
  file.symlink:
    - name: /var/lib/docker
    - target: {{ repo_dir }}
    - force: True
    - requires:
        file: docker-repo-create
{% endif %}

docker:
  service.running:
    - enable: True
    - require:
      - pkg: packages
