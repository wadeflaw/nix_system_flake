{
  pkgs,
  lib,
  ...
}: let
  mkGraphicalService = lib.recursiveUpdate {
    Unit.PartOf = ["graphical-session.target"];
    Unit.After = ["graphical-session.target"];
    Install.WantedBy = ["graphical-session.target"];
  };
in {
  home.packages = [pkgs.wl-clipboard];

  systemd.user.services = {
    cliphist = mkGraphicalService {
      Unit.Description = "Clipboard history service";
      Service = {
        ExecStart = "${pkgs.wl-clipboard}/bin/wl-paste --watch ${pkgs.cliphist}/bin/sliphist store";
        Restart = "always";
      };
    };

    wl-clip-persist = mkGraphicalService {
      Unit.Description = "Persistent clipboard for Wayland";
      Service = {
        ExecStart = "${pkgs.wl-clip-persist}/bin/wl-clip-persist --clipboard both";
        Restart = "always";
      };
    };
  };
}
