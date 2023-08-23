{
  conf,
  lib,
  self,
  inputs,
  nixpkgs,
  home-manager,
  ...
}: {
  ${conf.user} = home-manager.lib.homeManagerConfiguration {
    pkgs = nixpkgs.legacyPackages.${conf.system};
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
