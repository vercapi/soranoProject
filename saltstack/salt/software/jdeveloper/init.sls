/opt/apps/oracle/:
  file.directory:
    - user: vercapi
    - group: users
    - mode: 775
    - makedirs: true

oracle:
  group.present:
    - system: True

jdk8-openjdk:
  pkg.installed

/usr/share/applications/jdeveloper.desktop:
  file.managed:
    - source: salt://software/jdeveloper/jdeveloper.desktop
    - mode: 644

/opt/apps/bin/jdev:
  file.managed:
    - source: salt://software/jdeveloper/jdev.sh
    - mode: 755
    - makedirs: true

/usr/bin/jdev:
  file.symlink:
    - target: /opt/apps/bin/jdev
    - mode: 755
