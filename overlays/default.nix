{
  outputs,
  inputs,
}: let
  # Adds my custom packages
  additions = final: _: import ../pkgs {pkgs = final;};

  modifications = final: prev: {
    waybar = prev.waybar.overrideAttrs (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ ["-Dexperimental=true"];
    });
    neovim = inputs.neovim-conf.packages.x86_64-linux.default;
    keepassxc = inputs.stable.legacyPackages.x86_64-linux.keepassxc;

    xdg-desktop-portal-hyprland = inputs.xdph.packages.${prev.system}.default.override {
      hyprland-share-picker = inputs.xdph.packages.${prev.system}.hyprland-share-picker.override {hyprland = inputs.hyprland.packages.${prev.system}.default;};
    };
  };
in {
  default = final: prev: (additions final prev) // (modifications final prev);
}
