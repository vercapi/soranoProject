{% set aur_dir = '/home/vercapi/aur' %}

{% for package in pillar['aur_packages'] %}
{{ package }}:
  git.cloned:
    - name: https://aur.archlinux.org/{{ package }}.git
    - target: {{ aur_dir }}/{{ package }}
    - branch: master
    - user: vercapi

makepkg_{{ package }}:
  cmd.run:
    - name: makepkg -sf --noconfirm
    - cwd: {{ aur_dir }}/{{ package }}
    - runas: vercapi
    - require:
      - git: {{ package }}

install_{{ package }}:
  cmd.run:
    - name: pacman --noconfirm -U *.pkg.tar.xz
    - cwd: {{ aur_dir }}/{{ package }}
    - require:
      - cmd: makepkg_{{ package }}
{% endfor %}