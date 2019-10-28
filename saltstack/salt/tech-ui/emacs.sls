emacs:
  pkg.installed

dot_emacs:
  git.cloned:
    - name: https://github.com/vercapi/.emacs.d.git
    - target: /home/vercapi/.emacs.d
    - branch: master
    - user: vercapi

/home/vercapi/.emacs.d/secrets.el:
  file.managed:
    - source: salt://local/secrets.el
    - user: vercapi
    - group: vercapi