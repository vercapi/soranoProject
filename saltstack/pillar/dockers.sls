dockers:
  repository:
    {% if grains['id'] == 'nitro.sorano' %}
    - location: /mnt/localData/docker
    {% elif grains['id'] == 'sorano.home' %}
    - location: /var/lib/docker
    {% endif %}
