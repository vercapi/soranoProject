jdk8-openjdk:
  pkg.installed:
    - pkgs:
        - maven

/home/vercapi/.m2/settings.xml:
  file.managed:
    - source: salt://local/software/java/maven_settings.xml
    - makedirs: True
    - user: vercapi
    - group: vercapi
    - mode: 660
