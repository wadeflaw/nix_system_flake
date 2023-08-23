{
  conf,
  nixpkgs,
  outputs,
  self,
  lib,
  inputs,
  ...
}: {
  ${conf.host} = nixpkgs.lib.nixosSystem {
    specialArgs = {inherit self conf lib inputs outputs;};
    modules = [
      ./${conf.host}
      ../modules/devshells
      # ./modules/core/software/de
    ];
  };
}
