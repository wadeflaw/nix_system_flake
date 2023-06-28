{ inputs
, nixpkgs
, self
, ...
}:
let
  system = "x86_64-linux";
in
{
  imports = [
    ./hardware/hardware.nix
    ./software/software.nix
  ];
}
