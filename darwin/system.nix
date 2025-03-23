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

      postUserActivation.text = ''

        #Setting wallpaper
        echo >&2 "Switching wallpapers..."
        /usr/local/bin/desktoppr "$HOME/Projects/dots/darwin/assets/wallpaper.png"

        # Set screenshots location
        mkdir -p "$HOME/Pictures/Screenshots"
        defaults write com.apple.screencapture location -string "$HOME/Pictures/Screenshots"

        # Set screenshot format (options: png, jpg, tiff, pdf)
        defaults write com.apple.screencapture type -string "png"

        # Disable screenshot thumbnail
        defaults write com.apple.screencapture show-thumbnail -bool false

        # Set hibernation mode
        sudo pmset -a hibernatemode 3

        # Set display sleep time to 15 minutes on battery
        sudo pmset -b displaysleep 15

        # Set display sleep time to 30 minutes when connected to power
        sudo pmset -c displaysleep 30

        # Disable sudden motion sensor (not useful for SSDs)
        sudo pmset -a sms 0

        # Enable firewall
        sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on

        # Enable stealth mode
        sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setstealthmode on

        # Enable FileVault (if not already enabled)
        # Note: This can only check status, enabling requires user interaction
        if [ "$(fdesetup status | grep -c "FileVault is On")" -eq 0 ]; then
          echo "Consider enabling FileVault for disk encryption"
        fi

        # Restart UI services for changes to take effect
        killall SystemUIServer
        killall Finder
        killall Dock

        /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
      '';
    };
  };

  homebrew = import ./homebrew.nix;

}
