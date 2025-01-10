{
  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixpkgs-unstable";
    };

    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # homebrew
    nix-homebrew = {
      url = "github:zhaofengli-wip/nix-homebrew";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };

    homebrew-bundle = {
      url = "github:homebrew/homebrew-bundle";
      flake = false;
    };

    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, nix-darwin, home-manager, nix-homebrew, ... }@inputs:
    let
      machineConfig = {
        system = "aarch64-darwin";
        hostname = "MacBook-Pro";
        username = "jensnavne";
        home = "/Users/jensnavne";
        homeManager = {
          stateVersion = "23.05";
        };
      };
      pkgs = import nixpkgs { system = machineConfig.system; config.allowUnfree = true; };
    in
    {
      darwinConfigurations.${machineConfig.hostname} = nix-darwin.lib.darwinSystem {
        system = machineConfig.system;
        inherit pkgs;
        specialArgs = { inherit inputs machineConfig self; };

        modules = [
          ./darwin
          nix-homebrew.darwinModules.nix-homebrew
          (import ./homebrew)
          home-manager.darwinModules.home-manager
          (import ./home-manager)
        ];
      };
    };
}
