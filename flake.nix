{
  outputs = {
    nixpkgs,
    home-manager,
    self,
    ...
  } @ inputs: let
    inherit (self) outputs;
    conf = {
      host = "nixos";
      user = "ghost";
      passhash = "$y$j9T$lcqsG7EZPy7dSeXRr5lYk.$zLi5zYkjtBzy5nd9KLYQddxy88wD97EHKOCuJgzG1A6";
      fl_path = "/etc/nixos/stable";
      system = "x86_64-linux";
    };

    forEachSystem = nixpkgs.lib.genAttrs ["x86_64-linux" "aarch64-linux"];
    forEachPkgs = f: forEachSystem (sys: f nixpkgs.legacyPackages.${sys});
    lib = import ./lib/nixpkgs {inherit nixpkgs lib inputs;};
  in {
    overlays = import ./overlays {inherit inputs outputs;};
    packages = forEachPkgs (pkgs: import ./pkgs {inherit pkgs;});

    nixosConfigurations = {
      ${conf.host} = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit self conf lib inputs outputs;};
        modules = [
          ./hosts/${conf.host}/default.nix
        ];
      };
    };

    homeConfigurations = {
      ${conf.user} = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${conf.system};
        extraSpecialArgs = {inherit self conf inputs outputs;};
        modules = [./home/${conf.user}];
      };
    };
  };

  inputs = {
    # nixpkgs
    master.url = "github:nixos/nixpkgs/master";
    stable.url = "github:nixos/nixpkgs/nixos-23.05";
    unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";

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
      inputs.nixvim.follows = "nixvim";
    };

    # Hyprland stuff
    hyprland.url = "github:hyprwm/Hyprland";
    hypr-contrib.url = "github:hyprwm/contrib";
    hyprland-plugins.url = "github:hyprwm/hyprland-plugins";
    hyprpicker.url = "github:hyprwm/hyprpicker";

    nur.url = "github:nix-community/NUR";

    shlyupa-nur.url = "github:ilya-fedin/nur-repository";
    shlyupa-nur.inputs.nixpkgs.follows = "nixpkgs";

    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
  };
}
