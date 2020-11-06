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

/usr/share/applications/jdeveloper12.2.1.2.desktop:
  file.managed:
    - source: salt://software/jdeveloper/jdeveloper12.2.1.2.desktop
    - mode: 644
/usr/share/applications/jdeveloper12.2.1.4.desktop:
  file.managed:
    - source: salt://software/jdeveloper/jdeveloper12.2.1.4.desktop
    - mode: 644
/usr/share/applications/jdeveloper12.2.1.4RBFA.desktop:
  file.managed:
    - source: salt://software/jdeveloper/jdeveloper12.2.1.4RBFA.desktop
    - mode: 644
/usr/share/applications/jdeveloper12.2.1.0.desktop:
  file.managed:
    - source: salt://software/jdeveloper/jdeveloper12.2.1.0.desktop
    - mode: 644
/usr/share/applications/jdeveloper12.2.1.2_scaled.desktop:
  file.managed:
    - source: salt://software/jdeveloper/jdeveloper12.2.1.2_scaled.desktop
    - mode: 644
/usr/share/applications/jdeveloper12.2.1.4_scaled.desktop:
  file.managed:
    - source: salt://software/jdeveloper/jdeveloper12.2.1.4_scaled.desktop
    - mode: 644
/usr/share/applications/jdeveloper12.2.1.4RBFA_scaled.desktop:
  file.managed:
    - source: salt://software/jdeveloper/jdeveloper12.2.1.4RBFA_scaled.desktop
    - mode: 644
/usr/share/applications/jdeveloper12.2.1.0_scaled.desktop:
  file.managed:
    - source: salt://software/jdeveloper/jdeveloper12.2.1.0_scaled.desktop
    - mode: 644

/opt/apps/bin/jdev12.2.1.2:
  file.managed:
    - source: salt://software/jdeveloper/jdev12.2.1.2.sh
    - mode: 755
    - makedirs: true
/opt/apps/bin/jdev12.2.1.4:
  file.managed:
    - source: salt://software/jdeveloper/jdev12.2.1.4.sh
    - mode: 755
    - makedirs: true
/opt/apps/bin/jdev12.2.1.4RBFA:
  file.managed:
    - source: salt://software/jdeveloper/jdev12.2.1.4RBFA.sh
    - mode: 755
    - makedirs: true
/opt/apps/bin/jdev12.2.1.0:
  file.managed:
    - source: salt://software/jdeveloper/jdev12.2.1.0.sh
    - mode: 755
    - makedirs: true
/opt/apps/bin/jdev12.2.1.2_scaled:
  file.managed:
    - source: salt://software/jdeveloper/jdev12.2.1.2_scaled.sh
    - mode: 755
    - makedirs: true
/opt/apps/bin/jdev12.2.1.4RBFA_scaled:
  file.managed:
    - source: salt://software/jdeveloper/jdev12.2.1.4RBFA_scaled.sh
    - mode: 755
    - makedirs: true
/opt/apps/bin/jdev12.2.1.0_scaled:
  file.managed:
    - source: salt://software/jdeveloper/jdev12.2.1.0_scaled.sh
    - mode: 755
    - makedirs: true

/usr/bin/jdev12.2.1.2:
  file.symlink:
    - target: /opt/apps/bin/jdev12.2.1.2
    - mode: 755
/usr/bin/jdev12.2.1.4:
  file.symlink:
    - target: /opt/apps/bin/jdev12.2.1.4
    - mode: 755
/usr/bin/jdev12.2.1.4RBFA:
  file.symlink:
    - target: /opt/apps/bin/jdev12.2.1.4RBFA
    - mode: 755
/usr/bin/jdev12.2.1.0:
  file.symlink:
    - target: /opt/apps/bin/jdev12.2.1.0
    - mode: 755
/usr/bin/jdev12.2.1.2_scaled:
  file.symlink:
    - target: /opt/apps/bin/jdev12.2.1.2_scaled
    - mode: 755
/usr/bin/jdev12.2.1.4_scaled:
  file.symlink:
    - target: /opt/apps/bin/jdev12.2.1.4_scaled
    - mode: 755
/usr/bin/jdev12.2.1.4RBFA_scaled:
  file.symlink:
    - target: /opt/apps/bin/jdev12.2.1.4RBFA_scaled
    - mode: 755
/usr/bin/jdev12.2.1.0_scaled:
  file.symlink:
    - target: /opt/apps/bin/jdev12.2.1.0_scaled
    - mode: 755
