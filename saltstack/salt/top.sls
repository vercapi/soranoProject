base:

  '*':
    - ssh
    - sorano_base
    - sudoers

  'controller':
    - master_config.sls

  'SRN001':
    - tech-ui
    - users
    - network
    - tech-ui.emacs
    - arch_packages
