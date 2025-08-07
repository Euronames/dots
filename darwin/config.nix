{
  pkgs,
  machineConfig,
  ...
}:
{
  # Fonts
  fonts.packages = with pkgs.nerd-fonts; [
    fira-code
    fira-mono
  ];

  # Network configuration
  networking = {
    computerName = machineConfig.hostname;
    hostName = machineConfig.hostname;
    localHostName = machineConfig.hostname;

    applicationFirewall = {
      enable = true;
      enableStealthMode = true;
      blockAllIncoming = true;
    };
  };

  system = {

    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToControl = true;
      nonUS.remapTilde = true;

    };

    defaults = {

      # Finder preferences
      finder = {
        FXPreferredViewStyle = "clmv";
        ShowPathbar = true;
        ShowStatusBar = true;
        _FXShowPosixPathInTitle = true;
        FXEnableExtensionChangeWarning = false;
      };

      # Dock configuration
      dock = {
        autohide = true;
        # NOTE: Some apps are referenced by absolute path because they are installed via Homebrew Cask, not Nix.
        # To ensure these apps are present, make sure to install them with Homebrew.
        persistent-apps = [
          "/Applications/Zen.app"
          "/Applications/Ghostty.app"
          "${pkgs.vscode}/Applications/Visual\ Studio\ Code.app"
          "/Applications/Spotify.app"
        ];

        appswitcher-all-displays = true;
        expose-group-apps = true;
        magnification = true;
        mru-spaces = false;
        orientation = "bottom";
        tilesize = 60;
        largesize = 70;
        autohide-delay = 0.05;
        show-recents = false;

        # disable hot corners
        wvous-bl-corner = 1;
        wvous-tl-corner = 1;
        wvous-br-corner = 1;
        wvous-tr-corner = 1;
      };

      trackpad = {
        Clicking = true;
        Dragging = true;
        TrackpadRightClick = true; # enable two finger right click
        TrackpadThreeFingerDrag = true; # enable three finger drag
      };

      NSGlobalDomain = {
        AppleICUForce24HourTime = true;
        AppleInterfaceStyle = "Dark";
        AppleEnableMouseSwipeNavigateWithScrolls = true;
        AppleEnableSwipeNavigateWithScrolls = true;
        AppleMeasurementUnits = "Centimeters";
        AppleTemperatureUnit = "Celsius";
        AppleMetricUnits = 1;
        InitialKeyRepeat = 15;
        KeyRepeat = 2;
        ApplePressAndHoldEnabled = false;
        AppleShowAllFiles = true;
        AppleShowAllExtensions = true;
        AppleShowScrollBars = "WhenScrolling";
        "com.apple.mouse.tapBehavior" = 1; # Tap to click
        "com.apple.swipescrolldirection" = true;
        "com.apple.trackpad.forceClick" = false;
        "com.apple.sound.beep.feedback" = 0; # disable beep sound when pressing volume up/down key
        AppleKeyboardUIMode = 3; # Mode 3 enables full keyboard control.
      };

      # Menu bar settings
      menuExtraClock = {
        Show24Hour = true;
        ShowAMPM = false;
        ShowDate = 1;
        ShowDayOfMonth = true;
        ShowDayOfWeek = true;
        ShowSeconds = false;
      };

      # Software Update settings
      SoftwareUpdate.AutomaticallyInstallMacOSUpdates = true;

      # Spaces and Mission Control settings
      spaces = {
        spans-displays = false;
      };

      # Universal Access settings
      # universalaccess = {
      #   reduceTransparency = false;
      #   closeViewScrollWheelToggle = true;
      # };

      CustomUserPreferences = {
        ".GlobalPreferences" = {
          # automatically switch to a new space when switching to the application
          AppleSpacesSwitchOnActivate = true;
        };

        "com.apple.desktopservices" = {
          # Avoid creating .DS_Store files on network or USB volumes
          DSDontWriteNetworkStores = true;
          DSDontWriteUSBStores = true;
        };

        "com.apple.screencapture" = {
          location = "~/Desktop";
          type = "png";
        };

        "com.apple.AdLib" = {
          allowApplePersonalizedAdvertising = false;
        };
      };

      loginwindow = {
        GuestEnabled = false; # disable guest user
        SHOWFULLNAME = true; # show full name in login window
      };

      #Disable mouse acceleration
      ".GlobalPreferences"."com.apple.mouse.scaling" = -1.0;

    };
  };

  time.timeZone = "Europe/Copenhagen";

  security.pam.services.sudo_local.touchIdAuth = true;

}
