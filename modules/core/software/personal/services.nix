{ pkgs
, ...
}: {
  services = {
    gvfs.enable = true;
    fstrim.enable = true;
    gnome.gnome-keyring.enable = true;
    dbus.enable = true;
  };
  systemd.user.services.mate-polkit-authentication-agent = {
    description = "mate-polkit-authentication-agent";
    wantedBy = [ "graphical-session.target" ];
    wants = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.mate.mate-polkit}/libexec/polkit-gnome-authentication-agent-1";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
  };
}
