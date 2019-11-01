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
