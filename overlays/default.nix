{
  # self,
  inputs,
}: let
  # Adds my custom packages
  additions = final: _: import ../pkgs {pkgs = final;};

  modifications = final: prev: {
    eww-wayland = inputs.eww.packages.${prev.system}.eww-wayland;
    neovim = inputs.neovim-conf.packages.${prev.system}.default;
    keepassxc = inputs.stable.legacyPackages.${prev.system}.keepassxc;

    # waybar = prev.waybar.overrideAttrs (oa: {
    #   hyprlandSupport = true;
    #   mesonFlags = (oa.mesonFlags or [ ]) ++ [ "-Dexperimental=true" ];
    # });

    grimblast = inputs.hypr-contrib.packages.${prev.system}.grimblast;
    hyprprop = inputs.hypr-contrib.packages.${prev.system}.hyprprop;
    zellij = inputs.stable.legacyPackages.${prev.system}.zellij;

    kotatogram-desktop = inputs.shlyupa-nur.packages.${prev.system}.kotatogram-desktop;

    xdg-desktop-portal-hyprland = inputs.xdph.packages.${prev.system}.default.override {
      hyprland-share-picker = inputs.xdph.packages.${prev.system}.hyprland-share-picker.override {hyprland = inputs.hyprland.packages.${prev.system}.default;};
    };
  };
in {
  extraPkgs = final: prev: (additions final prev) // (modifications final prev);
}
