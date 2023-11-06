{ ... }: {
  imports = [
    ./fs.nix
  ];
  services = {
    # mouse for tty
    gpm.enable = true;
    fwupd.enable = true;
    ntp.enable = true;
    # flatpak.enable = true;
    dbus = {
      enable = true;
      implementation = "broker";
    };
    # xserver = {
    #   xkbOptions = "grp:alt_shift_toggle,caps:swapescape";
    # };
    ananicy.enable = true;
    irqbalance.enable = true;
  };
  systemd.services = {
    systemd-fsck.enable = false;
    systemd-timesyncd.enable = false;
  };

  virtualisation = {
    # waydroid.enable = true;
    podman.enable = true;
    # docker.enable = true;
  };
}
