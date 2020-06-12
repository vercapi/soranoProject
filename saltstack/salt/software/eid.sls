e-id_packages:
  pkg.installed:
    - pkgs:
        - ccid
        - acsccid
        - pcsc-tools

e-id_service:
  service.running:
    - name: pcscd.socket
    - enable: True
    - require:
      - pkg: e-id_packages
