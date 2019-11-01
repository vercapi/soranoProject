{% set aur_dir = '/home/vercapi/aur' %}

pacaur:
  git.cloned:
    - name: https://aur.archlinux.org/pacaur.git
    - target: {{ aur_dir }}
    - branch: master
    - user: vercapi

makepkg:
  cmd.run:
    - name: makepkg -s
    - cwd: {{ aur_dir }}/pacaur
    - runas: vercapi
    - require:
      - git: pacaur

install:
  cmd.run:
    - name: sudo pacman -U *.pkg.tar.xz
    - cwd: {{ aur_dir }}/pacaur
    - require:
      - git: makepkg
