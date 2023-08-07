{
  outputs,
  inputs,
}: let
  # Adds my custom packages
  additions = final: _: import ../pkgs {pkgs = final;};

  modifications = final: prev: {
    eww-wayland = inputs.eww.packages.${prev.system}.eww-wayland;
    neovim = inputs.neovim-conf.packages.${prev.system}.default;
    keepassxc = inputs.stable.legacyPackages.${prev.system}.keepassxc;

    grimblast = inputs.hypr-contrib.packages.${prev.system}.grimblast;
    hyprprop = inputs.hypr-contrib.packages.${prev.system}.hyprprop;

    # kotatogram-desktop-unwrapped = inputs.nur.packages.${prev.system}.kotatogram-desktop.overrideAttrs (prev: {
    #   postFixup = ''
    #     wrapProgram $out/bin/kotatogram-desktop \
    #     --set QT_QPA_PLATFORMTHEME "xdgdesktopportal"
    #   '';
    # });

    xdg-desktop-portal-hyprland = inputs.xdph.packages.${prev.system}.default.override {
      hyprland-share-picker = inputs.xdph.packages.${prev.system}.hyprland-share-picker.override {hyprland = inputs.hyprland.packages.${prev.system}.default;};
    };
  };
in {
  default = final: prev: (additions final prev) // (modifications final prev);
}
