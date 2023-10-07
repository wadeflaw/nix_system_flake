{
  outputs =
    { self
    , flake-parts
    , ...
    } @ inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        # systems for which you want to build the `perSystem` attributes
        "x86_64-linux"
        # "aarch64-linux"
        # "i686-linux"
      ];

      imports = [
        # add self back to inputs, I depend on inputs.self at least once
        { config._module.args._inputs = inputs // { inherit (inputs) self; }; }

        # parts and modules from inputs
        inputs.flake-parts.flakeModules.easyOverlay
        # inputs.treefmt-nix.flakeModule

        # parts of the flake
        # ./pkgs
      ];

      flake =
        let
          conf = import ./modules/config;

          lib = import ./lib/nixpkgs { inherit inputs; };
        in
        {
          # my overlay with custom pkgs
          overlays = import ./overlays { inherit inputs; };

          # entry-point for nixos configurations
          nixosConfigurations = import ./hosts {
            inherit lib conf inputs;
          };

          # hm cfg
          homeConfigurations = import ./home {
            inherit lib conf inputs;
          };

          nixOnDroidConfigurations = import ./hosts/nixOnDroid {
            inherit lib conf inputs;
          };
        };

      perSystem =
        { config
        , inputs'
        , pkgs
        , system
        , nixvim
        , ...
        }: {
          imports = [
            {
              _module.args.pkgs = import inputs.nixpkgs {
                config.allowUnfree = true;
                config.allowUnsupportedSystem = true;
                inherit system;
              };
            }
          ];
        };
    };

  inputs = {
    # powered by
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    # a tree-wide formatter
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    master.url = "github:nixos/nixpkgs/master";
    stable.url = "github:nixos/nixpkgs/nixos-23.05";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-on-droid = {
      url = "github:nix-community/nix-on-droid/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-gaming = {
      url = "github:fufexan/nix-gaming/d10b39b3e525907d904854b86803cf4b102daed9";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    neovim-conf = {
      url = "git+https://codeberg.org/ghosty/nixvim_flake";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nixvim = {
        follows = "nixvim";
        inputs.nixpkgs.follows = "nixpkgs";
      };
      # inputs.nil.follows = "nil";
    };

    devshell = {
      url = "github:numtide/devshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    schizofox = {
      url = "github:schizofox/schizofox";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Rust overlay
    # rust-overlay = {
    #   url = "github:oxalica/rust-overlay";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    # Nix Language server
    # nil = {
    #   url = "github:oxalica/nil";
    #   inputs.nixpkgs.follows = "nixpkgs";
    #   inputs.rust-overlay.follows = "rust-overlay";
    # };

    # Easy color integration
    nix-colors = {
      url = "github:misterio77/nix-colors";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    wallpkgs = {
      url = "github:NotAShelf/wallpkgs";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify = {
      url = "github:the-argus/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Hyprland stuff
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hypr-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprpicker.url = "github:hyprwm/hyprpicker";
    xdph = {
      url = "github:hyprwm/xdg-desktop-portal-hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # ragenix = {
    #   url = "https://github.com/yaxitech/ragenix";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    hyprpaper = {
      url = "github:hyprwm/hyprpaper";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # hypr-plugins = {
    #   url = "github:hyprwm/hyprland-plugins";
    #   inputs.hyprland.follows = "hyprland";
    # };
    # hy3 = {
    #   url = "github:outfoxxed/hy3";
    #   inputs.hyprland.follows = "hyprland";
    # };
    nur = {
      url = "github:nix-community/NUR";
    };

    shlyupa-nur = {
      url = "github:ilya-fedin/nur-repository";
      # inputs.nixpkgs.follows = "nixpkgs";
    };

    chaotic = {
      url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  nixConfig = {
    substituters = [
      "https://cache.privatevoid.net"
      "https://notashelf.cachix.org"
      "https://ilya-fedin.cachix.org"
      "https://helix.cachix.org"
      "https://cache.nixos.org" # funny binary cache
      "https://nixpkgs-unfree.cachix.org" # unfree-package cache
      "https://nix-community.cachix.org" # nix-community cache
      "https://hyprland.cachix.org" # hyprland
      "https://nixpkgs-wayland.cachix.org" # automated builds of *some* wayland packages
      "https://nix-gaming.cachix.org" # nix-gaming
      "https://nyx.chaotic.cx"
    ];
    trusted-public-keys = [
      "cache.privatevoid.net:SErQ8bvNWANeAvtsOESUwVYr2VJynfuc9JRwlzTTkVg="
      "notashelf.cachix.org-1:VTTBFNQWbfyLuRzgm2I7AWSDJdqAa11ytLXHBhrprZk="
      "ilya-fedin.cachix.org-1:QveU24a5ePPMh82mAFSxLk1P+w97pRxqe9rh+MJqlag="
      "nyx.chaotic.cx-1:HfnXSw4pj95iI/n17rIDy40agHj12WfF+Gqk6SonIT8="
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "nixpkgs-wayland.cachix.org-1:3lwxaILxMRkVhehr5StQprHdEo4IrE8sRho9R9HOLYA="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "nixpkgs-unfree.cachix.org-1:hqvoInulhbV4nJ9yJOEr+4wxhDV4xq2d1DK7S6Nj6rs="
      "helix.cachix.org-1:ejp9KQpR1FBI2onstMQ34yogDm4OgU2ru6lIwPvuCVs="
      "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
      "chaotic-nyx.cachix.org-1:HfnXSw4pj95iI/n17rIDy40agHj12WfF+Gqk6SonIT8="
    ];
  };
}
