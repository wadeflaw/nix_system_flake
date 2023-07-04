{
  lib,
  pkgs,
  conf,
  inputs,
  outputs,
  ...
}: {
  imports = [
    ./cli
    ./gui
    ./wm
    ./packages.nix
  ];

  home = {
    username = conf.user;
    homeDirectory = /home/${conf.user};
    stateVersion = "23.11";
  };

  programs.home-manager.enable = true;

  # ++ (builtins.attrValues outputs.homeManagerModules);

  manual = {
    html.enable = false;
    json.enable = false;
    manpages.enable = false;
  };

  nix = {
    package = lib.mkForce pkgs.nixUnstable;
    settings = {
      experimental-features = ["nix-command" "flakes" "repl-flake"];
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
}
