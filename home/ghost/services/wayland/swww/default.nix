{
  # inputs,
  pkgs,
  ...
}: {
  home.packages = [pkgs.swww];

  # systemd.user.services.swww = {
  #   Unit = {
  #     Description = "wallpaper daemon controlled at runtime";
  #     Requires = ["graphical-session.target"];
  #   };
  #   Service = let
  #     wall = "${inputs.wallpkgs.packages.${pkgs.system}.catppuccin}/share/catppuccin/01.png";
  #   in {
  #     Type = "simple";
  #     ExecStart = "${pkgs.swww}/bin/swww-daemon";
  #     ExecStartPost = "${pkgs.swww}/bin/swww img ${wall}";
  #     Restart = "on-failure";
  #   };
  #   Install.WantedBy = ["hyprland-session.target"];
  # };
}
