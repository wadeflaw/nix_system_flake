{ self
, inputs
, lib
, pkgs
, ...
}: {
  nix = {
    package = lib.mkForce pkgs.nixUnstable;
    settings = {
      experimental-features = [ "nix-command" "flakes" "repl-flake" ];
      warn-dirty = false;
      keep-outputs = true;
      keep-derivations = true;
    };
  };

  nixpkgs = {
    overlays = [
      self.overlays.extraPkgs
      inputs.nur.overlay
      # inputs.chaotic.overlays.default
    ];

    config = {
      permittedInsecurePackages = [
        "openssl-1.1.1u"
        "openssl-1.1.1v"
        "openssl_1_1"
      ];
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };
}
