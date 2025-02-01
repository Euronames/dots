{
  config,
  pkgs,
  self,
  machineConfig,
  ...
}:

{
  system.stateVersion = 5;
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
      automatic = true;
      interval = {
        Hour = 0; # Run at midnight
      };
      options = "--delete-older-than 7d";
    };
  };

  nixpkgs.config.allowUnsupportedSystem = true;

  # Git commit hash for the configuration revision
  system.configurationRevision = self.rev or self.dirtyRev or null;

  # Platform specification
  nixpkgs.hostPlatform = "aarch64-darwin";

  #Fixing spotlight
  system.activationScripts.applications = import ./spotlightFix.nix { inherit pkgs config; };

  homebrew = import ./homebrew.nix;

  # Following line should allow us to avoid a logout/login cycle
  system.activationScripts.postUserActivation.text = ''
    /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u

    echo >&2 "Switching wallpapers..."
    /usr/local/bin/desktoppr "$HOME/Projects/dots/darwin/assets/wallpaper.png"
  '';
}
