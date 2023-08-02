{
  lib,
  pkgs,
  conf,
  inputs,
  outputs,
  ...
}: {
  imports = [
    ./terminal
    ./gui
    ./wm
    ./themes
  ];
  # ++ (builtins.attrValues outputs.homeManagerModules);

  home = {
    username = conf.user;
    homeDirectory = "/home/${conf.user}";
    stateVersion = "23.11";
  };

  # nix = {
  #   package = lib.mkForce pkgs.nixUnstable;
  #   settings = {
  #     experimental-features = ["nix-command" "flakes" "repl-flake"];
  #     warn-dirty = false;
  #     keep-outputs = true;
  #     keep-derivations = true;
  #   };
  # };

  nixpkgs = {
    overlays = [
      outputs.overlays.default
      inputs.nur.overlay
      # inputs.chaotic.overlays.default
    ];

    config = {
      permittedInsecurePackages = [
        "openssl-1.1.1u"
      ];
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  programs.home-manager.enable = true;

  manual = {
    html.enable = false;
    json.enable = false;
    manpages.enable = false;
  };
}
