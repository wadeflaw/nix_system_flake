{...}: {
  services = {
    gvfs.enable = true;
    fstrim.enable = true;
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
  # console = {
  #   useXkbConfig = true;
  # font = "";
  # };
}
