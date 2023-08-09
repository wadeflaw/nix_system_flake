{
  inputs,
  pkgs,
  ...
}: {
  home.packages = [pkgs.swww];

  systemd.user.services.swww = {
    Unit = {
      Description = "wallpaper daemon controlled at runtime";
      Requires = ["graphical-session.target"];
    };
    Service = let
      wall = "${inputs.wallpkgs}/share/catppuccin/01.png";
    in {
      Type = "simple";
      ExecStartPre = "${pkgs.swww}/bin/swww-daemon";
      ExecStart = "${pkgs.swww}/bin/swww img ${wall}";
      Restart = "on-failure";
    };
    Install.WantedBy = ["hyprland-session.target"];
  };
}
