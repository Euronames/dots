{
  description = "My macOS Nix configuration with nix-darwin and home-manager";

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
  };

  outputs =
    {
      self,
      nixpkgs,
      nix-darwin,
      home-manager,
      nix-homebrew,
      ...
    }@inputs:
    let
      machineConfig = {
        system = "aarch64-darwin";
        hostname = "MacBook-Pro";
        username = "jensnavne";
        userName = "Jens Navne";
        userEmail = "jens.navne@gmail.com";
        home = "/Users/jensnavne";
        homeManager = {
          stateVersion = "23.05";
        };
        gpgKey = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDKMrSvVp0l9fKINnGygXRyjoV2kwmZalbWYfOuP/rfHT1t62xL/daZi4w9K/ucS9wQvXkxEaPwiIg7tqfjI4rTjl77WeZVd/sawiRtKBXyTsjjOC81NB0EpgDnv9hU1cggYDOtUE2EwWSjdmAHaG88uR6BxYOhG54A9KOBWYdgreIPzfYhM/CO5ukWs8wVdi9bCmGiADR0h3O0/oxvfDzZiMsU4+blzkjFEOEG0Je9SwbWy3dmRsiL70amny3EDjrMWpv4VmapWpSwwNvau5kX+X0d+KBejmNjE94tegASqAi2ynLbm2A/YhmMzyvCHgME5UVG3fP15dd6QSbFC7T938KtHiT1AOm+pYd04Xn/XqWVY9aa8arL/ChHQnPPXR85JFnTtkSr3w4UowPZrtf7Io+ISXA5TrBONYlcHzZ63d2TraW6Kq71/hfw/OVLnIsEHSHV5Vv2Etm4aM5xWPRhDfoJRoI0dolExpkdq358A2DxkKAIj8PLdw/fErbtRBVFHMw63juhpL3quQKg+qRZ/A6ZtwCR3qkWkhN7QXrKE7ZR0PtwstBBinrwx7VS2Gp4FGrfD87yMiM/DvY4huUKvif+sZL0b6U933OpiRM9EXLQzKNnS3oflAw4sgI/r+syPRGKyV1+1KyT5OK2ldKGMDkDsIcIR3yzzs1/pQsPew==";
      };
      pkgs = import nixpkgs {
        inherit (machineConfig) system;
        config.allowUnfree = true;
      };
    in
    {
      darwinConfigurations.${machineConfig.hostname} = nix-darwin.lib.darwinSystem {
        inherit (machineConfig) system;
        inherit pkgs;
        specialArgs = { inherit inputs machineConfig self; };
        modules = [
          ./darwin
          ./home-manager
          nix-homebrew.darwinModules.nix-homebrew
          home-manager.darwinModules.home-manager
        ];
      };
    };
}
