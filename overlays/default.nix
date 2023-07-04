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
  };
in {
  default = final: prev: (additions final prev) // (modifications final prev);
}
