ssh:
  pkg.installed:
     - pkgs:
       {% if grains.os == "Arch" %}
       - openssh
       {% else %}
       - ssh
       {% endif %}
  service.running:
    {% if grains.os == "Arch" %}
    - name: sshd
    {% else %}
    - name: ssh
    {% endif %}
    - enable: True
