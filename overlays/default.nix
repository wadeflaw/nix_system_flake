{
  outputs,
  inputs,
}: let
  # Adds my custom packages
  additions = final: _: import ../pkgs {pkgs = final;};

  modifications = final: prev: {
  };
in {
  default = final: prev: (additions final prev) // (modifications final prev);
}
