{ conf
, # lib,
  inputs
, ...
}:
let
  self = inputs.self;
in
{
  ${conf.user} = inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = inputs.nixpkgs.legacyPackages.${conf.system};
    extraSpecialArgs = {
      inherit
        self
        conf
        inputs
        ;
    };
    modules = [
      ./${conf.user}
      ./../modules/defaultApps
    ];
  };
}
