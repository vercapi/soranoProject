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
    - name: makepkg -s --noconfirm
    - cwd: {{ aur_dir }}/{{ package }}
    - runas: vercapi
    - require:
      - cmd: {{ package }}

install_{{ package }}:
  cmd.run:
    - name: sudo pacman -U *.pkg.tar.xz
    - cwd: {{ aur_dir }}/{{ package }}
    - require:
      - cmd: makepkg_{{ package }}
{% endfor %}