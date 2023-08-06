{
  self,
  pkgs,
  conf,
  inputs,
  ...
}: {
  nixpkgs = {
    overlays = [
      self.overlays.default
    ];
    config = {
      allowUnfree = true;
    };
  };

  nix = {
    registry = {
      n.flake = inputs.unstable;
      m.flake = inputs.master;
    };
    settings = {
      experimental-features = ["nix-command" "flakes"];
      auto-optimise-store = true;
      builders-use-substitutes = true;

      allowed-users = [
        "${conf.user}"
        "root"
      ];
      trusted-users = [
        "${conf.user}"
        "root"
      ];
      substituters = [
        "https://ilya-fedin.cachix.org"
        "https://helix.cachix.org"

        "https://cache.nixos.org" # funny binary cache
        "https://nixpkgs-unfree.cachix.org" # unfree-package cache
        "https://nix-community.cachix.org" # nix-community cache
        "https://hyprland.cachix.org" # hyprland
        "https://nixpkgs-wayland.cachix.org" # automated builds of *some* wayland packages
        # "https://nix-gaming.cachix.org" # nix-gaming
        # "https://nyx.chaotic.cx"
        # china mirror "https://mirrors.bfsu.edu.cn/nix-channels/store"
      ];
      trusted-public-keys = [
        "ilya-fedin.cachix.org-1:QveU24a5ePPMh82mAFSxLk1P+w97pRxqe9rh+MJqlag="

        "nyx.chaotic.cx-1:HfnXSw4pj95iI/n17rIDy40agHj12WfF+Gqk6SonIT8="
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "nixpkgs-wayland.cachix.org-1:3lwxaILxMRkVhehr5StQprHdEo4IrE8sRho9R9HOLYA="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "nixpkgs-unfree.cachix.org-1:hqvoInulhbV4nJ9yJOEr+4wxhDV4xq2d1DK7S6Nj6rs="
        "helix.cachix.org-1:ejp9KQpR1FBI2onstMQ34yogDm4OgU2ru6lIwPvuCVs="
        # "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
        # "chaotic-nyx.cachix.org-1:HfnXSw4pj95iI/n17rIDy40agHj12WfF+Gqk6SonIT8="
      ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  # faster rebuilding
  documentation = {
    enable = true;
    doc.enable = false;
    man.enable = true;
    dev.enable = false;
  };

  time.timeZone = "Europe/Kyiv";
  i18n.defaultLocale = "en_US.UTF-8";
  system.stateVersion = "23.05";
}
