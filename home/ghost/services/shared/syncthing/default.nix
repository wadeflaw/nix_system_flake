{ conf
, config
, ...
}: {
  services.syncthing = {
    enable = true;
    # dataDir = "${config.xdg.userDirs.documents}/syncthing";
  };
}
