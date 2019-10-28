emacs:
  pkg.installed

dot_emacs:
  git.latest:
    - name: https://github.com/vercapi/.emacs.d.git
    - target: /home/vercapi/.emacs.d
    - branch: master

/home/vercapi/.emacs.d/secrets.el:
  file.managed:
    - source: salt://local/secrets.el
    - user: vercapi
    - group: vercapi