{ outputs
, inputs
,
}:
let
  # Adds my custom packages
  additions = final: _: import ../pkgs { pkgs = final; };

  modifications = final: prev: {
    discord-canary = prev.discord-canary.override {
      nss = prev.nss_latest;
      withOpenASAR = true;
    };
  };
in
{
  default = final: prev: (additions final prev) // (modifications final prev);
}

