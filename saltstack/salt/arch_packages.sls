{% set arch_ppa_dir = '/home/vercapi/.arch_ppa.d' %}
{% set ppa_repo = 'sorano'%}

arch_ppa_code:
  git.latest:
    - name: https://github.com/EnigmaCurry/arch-ppa.git
    - target: {{ arch_ppa_dir }}
    - branch: master
    - user: vercapi

{{ arch_ppa_dir+'/arch-ppa }}:
  file.managed: 
    - mode: 766
    - replace: False

{% if salt['grains.get']('arch_ppa_setup') != 'true' %}
setup_arch_ppa:
  cmd.run:
    - cwd: {{ arch_ppa_dir }}
    - name: ./arch-ppa setup
    - runas: vercapi
  grains.present:
    - name: arch_ppa_setup
    - value: true
{% endif %}

/etc/pacman.conf:
  file.managed:
    - source: salt://pacman/pacman.conf
    - user: vercapi
    - group: vercapi