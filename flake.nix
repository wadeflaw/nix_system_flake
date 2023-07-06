{
  outputs = {
    nixpkgs,
    home-manager,
    chaotic,
    self,
    ...
  } @ inputs: let
    inherit (self) outputs;
    forEachSystem = nixpkgs.lib.genAttrs ["x86_64-linux" "aarch64-linux"];
    forEachPkgs = f: forEachSystem (sys: f nixpkgs.legacyPackages.${sys});
    system = "x86_64-linux";
    conf = {
      user = "ghost";
      host = "nixos";
    };
  in {
    overlays = import ./overlays {inherit inputs outputs;};
    packages = forEachPkgs (pkgs: import ./pkgs {inherit pkgs;});

    nixosConfigurations = {
      ${conf.host} = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit self conf inputs chaotic outputs;};
        modules = [
          # ./modules/core/default.nix
          ./hosts/${conf.host}/default.nix
        ];
      };
    };

    homeConfigurations = {
      ${conf.user} = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        extraSpecialArgs = {inherit self conf inputs chaotic outputs;};
        modules = [./home/${conf.user}];
      };
    };
  };

  inputs = {
    # repos
    stable.url = "github:nixos/nixpkgs/nixos-23.05";
    unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nur.url = "github:nix-community/NUR";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "unstable";
    };

    nix-gaming.url = "github:fufexan/nix-gaming";

    # nvim configuration
    nixvim = {
      url = "github:pta2002/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    neovim-conf = {
      url = "git+file:/etc/nixos/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Hyprland stuff
    hyprland.url = "github:hyprwm/Hyprland";
    hypr-contrib.url = "github:hyprwm/contrib";
    hyprland-plugins.url = "github:hyprwm/hyprland-plugins";
    hyprpicker.url = "github:hyprwm/hyprpicker";
  };
}
