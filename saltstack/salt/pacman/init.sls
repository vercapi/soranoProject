{% set aur_dir = '/home/vercapi/aur' %}

pacaur:
  git.cloned:
    - name: https://github.com/vercapi/.emacs.d.git
    - target: {{ aur_dir }}
    - branch: master
    - user: vercapi

makepkg:
  cmd.run:
    - name: makepkg -s
    - cwd: {{ aur_dir }}
    - require:
      - git: pacaur

install:
  cmd.run:
    - name: sudo pacman -U *.pkg.tar.xz
    - cwd: {{ aur_dir }}
    - require:
      - git: makepkg
