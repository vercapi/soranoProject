copy_files:
  local.cmd.run:
    - tgt: 'SRN001'
    - arg:
      - cp /home/vercapi/.xmonad/xmonad.hs /home/vercapi/Documents/projects/soranoProject/saltstack/salt/tech-ui/Xmonad.hs
  