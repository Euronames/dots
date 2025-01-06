# https://github.com/LnL7/nix-darwin
# https://daiderd.com/nix-darwin/manual/index.html
# https://dev.jmgilman.com/environment/tools/nix/nix-darwin/

{ pkgs, machineConfig, self, config, ... }:
{
  system.stateVersion = 5;
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  # Auto upgrade packaged and the daemon service
  services.nix-daemon.enable = true;

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  users.users.${machineConfig.username} = {
    name = machineConfig.username;
    home = machineConfig.home;
  };

  programs.zsh.enable = true;

  # Set Git commit hash for darwin-version.
  system.configurationRevision = self.rev or self.dirtyRev or null;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";


  environment = {
    #shells = with pkgs; [ nushell ];
    systemPackages = with pkgs; [
      mkalias
      nixpkgs-fmt
    ];

    #systemPath = [ "/opt/homebrew/bin" ];
    #pathsToLink = [ "/Applications" ];
  };

  #Fixing spotlight
  system.activationScripts.applications.text =
    let
      env = pkgs.buildEnv {
        name = "system-applications";
        paths = config.environment.systemPackages;
        pathsToLink = "/Applications";
      };
    in
    pkgs.lib.mkForce ''
      # Set up applications.
      echo "setting up /Applications..." >&2
      rm -rf /Applications/Nix\ Apps
      mkdir -p /Applications/Nix\ Apps
      find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
      while read -r src; do
        app_name=$(basename "$src")
        echo "copying $src" >&2
        ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
      done
    '';



  /*
      fonts.packages = with pkgs.nerd-fonts; [
      fira-code
      #fira-code-symbols
      meslo-lg
      fira-mono
      #(nerdfonts.override { fonts = [ "Meslo" "FiraCode" "FiraMono" ]; })
      ];
    */
  /* fonts = with pkgs; [
      nerd-fonts.fira-code
      nerd-fonts.fira-code-symbols
      nerd-fonts.fira-mono
      nerd-fonts.meslo
      ];
    */
  #networking.computerName = machineConfig.hostname;
  #networking.hostName = machineConfig.hostname;
  #networking.localHostName = machineConfig.hostname;

  /*
      system.keyboard.enableKeyMapping = true;
      system.keyboard.remapCapsLockToControl = true;
    */

  system.defaults.finder = {
    FXPreferredViewStyle = "clmv";
    ShowPathbar = true;
    ShowStatusBar = true;
    _FXShowPosixPathInTitle = true;
    FXEnableExtensionChangeWarning = false;
  };

  system.defaults.dock = {
    autohide = true;
    persistent-apps = [
      "${pkgs.arc-browser}/Applications/Arc.app"
      "${pkgs.warp-terminal}/Applications/Warp.app"
      "${pkgs.vscode}/Applications/Visual\ Studio\ Code.app"
      "${pkgs.spotify}/Applications/Spotify.app"

    ];

    /*
      appswitcher-all-displays = true;
      expose-group-by-app = true;
      magnification = true;
      mru-spaces = false;
      orientation = "bottom";
      tilesize = 48;
      largesize = 64;

      # disable hot corners
      wvous-bl-corner = 1;
      wvous-tl-corner = 1;
      wvous-br-corner = 1;
      wvous-tr-corner = 1;
      */
  };

  system.defaults.NSGlobalDomain = {
    AppleICUForce24HourTime = true;
    AppleInterfaceStyle = "Dark";
    /*
      AppleEnableMouseSwipeNavigateWithScrolls = false;
      AppleEnableSwipeNavigateWithScrolls = false;
      AppleMeasurementUnits = "Centimeters";
      AppleTemperatureUnit = "Celsius";
      AppleMetricUnits = 1;
      AppleICUForce24HourTime = true;
      InitialKeyRepeat = 15;
      KeyRepeat = 2;
      ApplePressAndHoldEnabled = false;
      NSAutomaticCapitalizationEnabled = false;
      NSAutomaticDashSubstitutionEnabled = false;
      NSAutomaticPeriodSubstitutionEnabled = false;
      NSAutomaticQuoteSubstitutionEnabled = false;
      NSAutomaticSpellingCorrectionEnabled = false;
      NSDocumentSaveNewDocumentsToCloud = false;
      "com.apple.keyboard.fnState" = true;
      "com.apple.trackpad.enableSecondaryClick" = false;
      */
  };

  /*
      system.defaults = {
      loginwindow.GuestEnabled = false;
      };
    */

  security.pam.enableSudoTouchIdAuth = true;

  homebrew = import ../homebrew/homebrew.nix;


  # services.skhd.enable = true;
  /*
      services.yabai.enable = true;
      services.yabai.config = {
      # focus_follows_mouse = "autoraise";
      mouse_follows_focus = "off";
      window_placement    = "second_child";
      window_opacity      = "off";
      top_padding         = 36;
      bottom_padding      = 10;
      left_padding        = 10;
      right_padding       = 10;
      window_gap          = 10;
      };
    */

  system.activationScripts.postUserActivation.text = ''
    # Following line should allow us to avoid a logout/login cycle
    /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
  '';
}
