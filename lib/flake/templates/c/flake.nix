{
  description = "Sample C/C++ Project";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
  }: let
    inherit (nixpkgs.lib) genAttrs systems;
    forAllSystems = genAttrs systems.flakeExposed;
    pkgsFor = forAllSystems (system:
      import nixpkgs {
        inherit system;
        overlays = [self.overlays.default];
      });
  in {
    overlays = rec {
      default = final: prev: {
        foo-bar = prev.callPackage ./. {};
      };
    };

    packages = forAllSystems (sys: let
      pkgs = pkgsFor.${sys};
    in rec {
      inherit (pkgs) foo-bar;
      default = foo-bar;
    });

    devShells = forAllSystems (sys: let
      pkgs = pkgsFor.${sys};
    in rec {
      foo-bar = pkgs.mkShell {
        inputsFrom = [pkgs.foo-bar];
        buildInputs = with pkgs; [clang-tools];
      };
      default = foo-bar;
    });
  };
}