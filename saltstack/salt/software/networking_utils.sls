install_networking_utils:
  pkg.installed:
    - pkgs:
        - wireshark-qt # GUI tool to capture packets
        - tcpdump # command line tool to capture packets
