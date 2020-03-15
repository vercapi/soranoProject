'timedatectl set-local-rtc 0':
  cmd.run

'timedatectl set-timezone Europe/Brussels':
  cmd.run

ntp:
  pkg.installed: []

ntpd:
  service.running:
    - enable: True
