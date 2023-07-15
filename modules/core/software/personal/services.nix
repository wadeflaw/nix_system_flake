{...}: {
  services = {
    gvfs.enable = true;
    fstrim.enable = true;
    dbus = {
      enable = true;
      implementation = "broker";
    };
  };
}
