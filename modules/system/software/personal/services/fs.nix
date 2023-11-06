{conf, ...}:{
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
    btrfs.autoScrub = {
      enable = true;
      interval = "weekly";
      fileSystems = [
        "/"
        "/home/${conf.user}/Disc"
        "/nix"
      ];
    };
  };
}
