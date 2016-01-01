# State that provides the handbrake tool and needed environment to convert media from one type to the other

handbrake:
  pkg.installed:
    - pkgs:
      - handbrake
      - handbrake-cli