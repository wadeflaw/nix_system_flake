{ lib
, pkgs
, config
, inputs
, ...
}: {
  imports =
    [
      ./cli
      ./desktop
      ./packages.nix
    ];
  # ++ (builtins.attrValues outputs.homeManagerModules);

  manual = {
    html.enable = false;
    json.enable = false;
    manpages.enable = false;
  };

  nix = {
    package = lib.mkForce pkgs.nixUnstable;
    settings = {
      experimental-features = [ "nix-command" "flakes" "repl-flake" ];
      warn-dirty = false;
    };
  };

  nixpkgs = {
    overlays = [
      outputs.overlays.default
      inputs.nur.overlay
      inputs.chaotic.overlays.default
    ];

    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  programs.home-manager.enable = true;

  home = {
    username = "ghost";
    homeDirectory = "/home/${config.home.username}";
    stateVersion = "23.11";
  };
}
