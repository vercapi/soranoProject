python-pip:
  pkg.installed

docker-py:
  pip.installed:
    - require:
      - pkg: python-pip