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

    # Homebrew
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

    #1Password Shell Plugins Flake
    _1password-shell-plugins.url = "github:1Password/shell-plugins";
  };

  outputs = { self, nixpkgs, nix-darwin, home-manager, nix-homebrew, ... }@inputs:
    let
      machineConfig = {
        system = "aarch64-darwin";
        hostname = "MacBook-Pro";
        username = "jensnavne";
        userName = "Jens Navne";
        userEmail  = "jens.navne@gmail.com";
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
          home-manager.darwinModules.home-manager
          (import ./home-manager)
        ];
      };
    };
}
