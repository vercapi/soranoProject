emacs:
  pkg.installed

dot_emacs:
  git.latest:
    - name: https://github.com/vercapi/.emacs.d.git
    - target: /home/vercapi/.emacs.d
    - branch: master