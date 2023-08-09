{pkgs, ...}: let
  whileRun = pkgs.writeShellScript ''
    while [[ `pgrep swww` ]]; do
      sleep 5s
    done
  '';
in {
  home.packages = [pkgs.swww];

  systemd.user.services.swww = {
    Unit = {
      Description = "wallpaper daemon controlled at runtime";
      Requires = ["graphical-session.target"];
    };
    Service = {
      Type = "simple";
      ExecStartPre = "${pkgs.swww}/bin/swww init";
      ExecStart = "${whileRun}";
      Restart = "always";
    };
    Install.WantedBy = ["hyprland-session.target"];
  };
}
