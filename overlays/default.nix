{
  # self,
  inputs
,
}:
let
  # Adds my custom packages
  additions = final: _: import ../pkgs { pkgs = final; };

  modifications = final: prev: {
    # eww-wayland = inputs.eww.packages.${prev.system}.eww-wayland;
    # neovim = inputs.neovim-conf.packages.${prev.system}.default;

    # waybar = prev.waybar.overrideAttrs (oa: {
    #   hyprlandSupport = true;
    #   mesonFlags = (oa.mesonFlags or [ ]) ++ [ "-Dexperimental=true" ];
    # });

    kotatogram-desktop = inputs.shlyupa-nur.packages.${prev.system}.kotatogram-desktop;


    # hyprland
    grimblast = inputs.hypr-contrib.packages.${prev.system}.grimblast;
    hyprprop = inputs.hypr-contrib.packages.${prev.system}.hyprprop;
    xdg-desktop-portal-hyprland = inputs.xdph.packages.${prev.system}.default; #.override {
    # hyprland-share-picker = inputs.xdph.packages.${prev.system}.hyprland-share-picker.override { hyprland = inputs.hyprland.packages.${prev.system}.default; };
    # };

    # stable packages
    keepassxc = inputs.stable.legacyPackages.${prev.system}.keepassxc;
    zellij = inputs.stable.legacyPackages.${prev.system}.zellij;
    telegram-desktop = inputs.stable.legacyPackages.${prev.system}.telegram-desktop;
    vscodium = inputs.stable.legacyPackages.${prev.system}.vscodium;
    webcord = inputs.stable.legacyPackages.${prev.system}.webcord;
    amdvlk = inputs.stable.legacyPackages.${prev.system}.amdvlk;
    driversi686Linux.amdvlk = inputs.stable.legacyPackages.${prev.system}.driversi686Linux.amdvlk;
  };
in
{
  extraPkgs = final: prev: (additions final prev) // (modifications final prev);
}
