git:
  pkg.installed

python2-pip:
  pkg.installed:
    - reload-modules: True

pyinotify:
  pip.installed:
    - required:
      - pkg: git