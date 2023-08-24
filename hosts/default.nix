{
  conf,
  nixpkgs,
  self,
  lib,
  inputs,
  ...
}: {
  ${conf.host} = nixpkgs.lib.nixosSystem {
    specialArgs = {inherit self conf lib inputs;};
    modules = [
      ./${conf.host}
      # ./modules/core/software/de
    ];
  };
}
