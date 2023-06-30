{ outputs
, inputs
,
}:
let
  # Adds my custom packages
  additions = final: _: import ../pkgs { pkgs = final; };

  modifications = final: prev: {
    waybar = prev.waybar.overrideAttrs (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
    });
  };
in
{
  default = final: prev: (additions final prev) // (modifications final prev);
}
