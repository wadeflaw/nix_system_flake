{ pkgs
, inputs
, ...
}: {
  home.packages = with pkgs; [
    # inputs.nix-gaming.packages.${pkgs.system}.roblox-player
    # steam
    # grapejuice
    wineWowPackages.stagingFull
    gamemode
    winetricks
    lutris
    mangohud
  ];
}
