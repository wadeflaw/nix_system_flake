{ inputs
, conf
, lib
,
}: {
  ${conf.user} = inputs.nix-on-droid.lib.nixOnDroidConfiguration {
    inherit (conf.system) system;
    modules = [
      ./${conf.user}
    ];
  };
}
