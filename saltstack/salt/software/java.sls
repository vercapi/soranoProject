java:
  pkg.installed:
    - pkgs:
        - maven
        - jdk-openjdk

/home/vercapi/.m2/settings.xml:
  file.managed:
    - source: salt://local/software/java/maven_settings.xml
    - makedirs: True
    - user: vercapi
    - group: vercapi
    - mode: 660
