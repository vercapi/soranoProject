{% set aur_dir = '/home/vercapi/aur' %}

{% for package in pillar['aur_packages'] %}
{% if not salt['grains.get']('installed_'+package) %}
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

installed_{{ package }}:
  grains.present:
    - value: true

{% endif %}
{% endfor %}

{% for package in pillar['pacaur_packages'] %}
{% if not salt['grains.get']('installed_'+package) %}

install_{{ package }}:
  cmd.run:
    - name: pacaur -S --noedit --noconfirm {{ package }}

installed_{{ package }}:
  grains.present:
    - value: true

{% endif %}
{% endfor %}