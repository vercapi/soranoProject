https://github.com/vercapi/oracleTools.git:
  git.latest:
    - user: vercapi
    - target: /tmp/oracleTools    

copy_file:
  cmd.run:
    - name: cp -R /tmp/oracleTools/salt/oracle_tools /srv/salt/oracle_tools
    - require:
      - git: https://github.com/vercapi/oracleTools.git

