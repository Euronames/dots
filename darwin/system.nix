{
  config,
  pkgs,
  self,
  machineConfig,
  inputs,
  ...
}:

{
  nix = {
    extraOptions = ''
      experimental-features = nix-command flakes
    '';

    # Necessary for using flakes on this system.
    settings = {
      experimental-features = "nix-command flakes";
      trusted-users = [ machineConfig.hostname ];
    };

    optimise.automatic = true;
    gc = {
      # Garbage collection
      automatic = true;
      interval = {
        Hour = 0; # Run at midnight
      };
      options = "--delete-older-than 7d";
    };
  };

  nixpkgs = {
    config.allowUnsupportedSystem = true;

    # Platform specification
    hostPlatform = machineConfig.system;
  };

  system = {
    stateVersion = 5;

    # Git commit hash for the configuration revision
    configurationRevision = self.rev or self.dirtyRev or null;

    activationScripts = {
      spotlightFix = import ./systemScripts/spotlightFix.nix { inherit pkgs config; };
      power = import ./systemScripts/power.nix;
    };
  };

  power.sleep.display = 15;

  nix-homebrew = {
    enable = true;

    user = machineConfig.username;
    taps = with inputs; {
      "homebrew/homebrew-core" = homebrew-core;
      "homebrew/homebrew-bundle" = homebrew-bundle;
      "homebrew/homebrew-cask" = homebrew-cask;
    };

    mutableTaps = false; # do not allow installs outside of nix
    autoMigrate = true; # remember this before first run
    extraEnv = {
      HOMEBREW_NO_ANALYTICS = "1";
    };
  };

  imports = [
    ./config.nix
    ./users.nix
    ./system.nix
    ./environment.nix
  ];

  homebrew = import ./homebrew.nix { inherit config; };

}
