base:

  '*':
    - ssh
    - sorano_base
    - sudoers

  'controller':
    - master_config

  'SRN001':
    - tech-ui
    - users
    - network
    - tech-ui.emacs
    - pacman
    - master_double
    - docker_builder
    - beacons
    - kbvb
    - java
    - jdeveloper
    - audio
