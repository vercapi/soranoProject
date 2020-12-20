java:
  pkg.installed:
    - pkgs:
        - maven
        - jdk-openjdk
        - tomcat8

tomcat8:
  group.present:
    - members:
        - vercapi

/etc/tomcat8/context.xml:
  file.managed:
    - source: salt://local/software/java/context.xml
    - makedirs: True
    - user: root
    - group: tomcat8
    - mode: 660

/etc/tomcat8/server.xml:
  file.managed:
    - source: salt://local/software/java/server.xml
    - makedirs: True
    - user: root
    - group: tomcat8
    - mode: 660

/home/vercapi/.m2/settings.xml:
  file.managed:
    - source: salt://local/software/java/maven_settings.xml
    - makedirs: True
    - user: vercapi
    - group: vercapi
    - mode: 660
