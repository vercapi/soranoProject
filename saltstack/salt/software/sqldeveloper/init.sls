/usr/share/applications/sqldeveloper.desktop:
  file.managed:
    - source: salt://software/sqldeveloper/sqldeveloper.desktop
    - mode: 644
/usr/share/applications/sqldeveloper_scaled.desktop:
  file.managed:
    - source: salt://software/sqldeveloper/sqldeveloper_scaled.desktop
    - mode: 644

/opt/apps/bin/sqldeveloper:
  file.managed:
    - source: salt://software/sqldeveloper/sqldeveloper.sh
    - mode: 755
    - makedirs: true
/opt/apps/bin/sqldeveloper_scaled:
  file.managed:
    - source: salt://software/sqldeveloper/sqldeveloper_scaled.sh
    - mode: 755
    - makedirs: true
/usr/bin/sqldeveloper:
  file.symlink:
    - target: /opt/apps/bin/sqldeveloper
    - mode: 755
/usr/bin/sqldeveloper_scaled:
  file.symlink:
    - target: /opt/apps/bin/sqldeveloper_scaled
    - mode: 755
