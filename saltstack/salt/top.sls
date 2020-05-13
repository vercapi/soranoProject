base:

  '*':
    - network/ssh
    - sudoers

  'controller':
    - master

  'SRN001':
    - users
    - network
    - xdisplay
    - pacman
    - master_double
    - environments/KBVB
    - software/java
    - software/jdeveloper
    - audio
    - time
    - fs/usb
    - software/devops
    - software/CAD
    - software/graphics
    - software/3d_printing
    - software/3d_modelling
    - software/docker
    - software/git
    - software/remote_desktop
    - software/utils
    - desktop
    - monitoring
    - software/document_conversion
    - software/clojure
    - software/movie_player
    - software/virtualbox
