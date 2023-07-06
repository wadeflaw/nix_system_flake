{
  self,
  pkgs,
  conf,
  inputs,
  ...
}: {
  nix = {
    registry = {
      n.flake = inputs.unstable;
      m.flake = inputs.master;
    };
    settings = {
      experimental-features = ["nix-command" "flakes"];

      allowed-users = [
        "${conf.user}"
        "root"
      ];
      trusted-users = [
        "${conf.user}"
        "root"
      ];
      substituters = [
        "https://cache.nixos.org/"
        "https://mirrors.bfsu.edu.cn/nix-channels/store"
      ];
      extra-substituters = [
        # Nix community's cache server
        "https://nix-community.cachix.org"
        "https://nyx.chaotic.cx"
        "https://hyprland.cachix.org"
        "https://nix-gaming.cachix.org"
      ];
      extra-trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "nyx.chaotic.cx-1:HfnXSw4pj95iI/n17rIDy40agHj12WfF+Gqk6SonIT8="
        "chaotic-nyx.cachix.org-1:HfnXSw4pj95iI/n17rIDy40agHj12WfF+Gqk6SonIT8="
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
      ];
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  nixpkgs = {
    overlays = [
      self.overlays.default
      inputs.nur.overlay
      inputs.chaotic.overlays.default
    ];
    config = {
      allowUnfree = true;
    };
  };

  environment.systemPackages = with pkgs; [
    wget
    git
  ];

  time.timeZone = "Europe/Kyiv";
  i18n.defaultLocale = "en_US.UTF-8";
  system.stateVersion = "23.05";
}
