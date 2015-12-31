prerequisites:
  pkg.installed:
    - pkgs:
      - autoconf
      - automake
      - binutils
      - bison
      - fakeroot
      - file
      - findutils
      - flex
      - gawk
      - gcc
      - gettext
      - grep
      - groff
      - gzip
      - libtool
      - m4
      - make
      - pacman
      - patch
      - pkg-config
      - sed
      - sudo
      - texinfo
      - util-linux
      - which
      - git

/build:
  file.directory:
    - user: alarm
    - group: alarm
    - dir_mode: 755

/build/widevine:
  file.directory:      
    - user: alarm
    - group: alarm
    - dir_mode: 755
    - require:
      - file: /build

widevine_repo:
  git.latest:
    - name: https://aur.archlinux.org/chromium-widevine.git
    - target: /build/widevine
    - require:
      - file: /build/widevine

widevine_install:
  cmd.run:
    - name: makepkg -sri
    - cwd: /build/widevine
    - user: alarm
    - unless: pacman -Qm chromium-widevine
    - require:
      - git: widevine_repo