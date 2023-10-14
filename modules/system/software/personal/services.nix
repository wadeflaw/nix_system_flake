{ conf, ... }: {
  services = {
    btrbk = {
      instances."files" = {
        onCalendar = "weekly";
        settings = {
          snapshot_preserve = "14d";
          snapshot_dir = "Disc/.snapshotfiles";
          # snapshot_preserve_min = "no";
          volume = {
            "/home/${conf.user}" = {
              subvolume = {
                Disc = {
                  snapshot_create = "onchange";
                };
                # rootfs = {};
              };
              # target = "/home/ghost/.Disc";
            };
          };
        };
      };
    };
    gvfs.enable = true;
    fstrim.enable = true;
    gpm.enable = true;
    fwupd.enable = true;
    dbus = {
      enable = true;
      implementation = "broker";
    };
    xserver = {
      xkbOptions = "grp:alt_shift_toggle,caps:swapescape";
    };
    ananicy.enable = true;
    irqbalance.enable = true;
  };
  systemd.services = {
    systemd-fsck.enable = false;
    systemd-timesyncd.enable = false;
  };

  virtualisation = {
    waydroid.enable = true;
    podman.enable = true;
    # docker = {
    #   rootless = {
    #     enable = true;
    #     # setSocketVariable = true;
    #   };
    #   enable = true;
    # };
  };
  # console = {
  #   useXkbConfig = true;
  # font = "";
  # };
}
