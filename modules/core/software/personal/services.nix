{ pkgs
, ...
}: {
  services = {
    gvfs.enable = true;
    fstrim.enable = true;
    gnome.gnome-keyring.enable = true;
    dbus.enable = true;
  };
}
