{
  config,
  pkgs,
  self,
  machineConfig,
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
      #Fixing spotlight
      applications = import ./spotlightFix.nix { inherit pkgs config; };

      # Following line should allow us to avoid a logout/login cycle
      postUserActivation.text = ''
        /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u

        echo >&2 "Switching wallpapers..."
        /usr/local/bin/desktoppr "$HOME/Projects/dots/darwin/assets/wallpaper.png"
      '';
    };
  };

  homebrew = import ./homebrew.nix;

}
