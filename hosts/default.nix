{ conf
, lib
, inputs
, ...
}:
let
  self = inputs.self;
in
{
  ${conf.host} = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = { inherit self conf lib inputs; };
    modules = [
      ./${conf.host}
      # ./modules/core/software/de
    ];
  };
}
