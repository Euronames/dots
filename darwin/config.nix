{ pkgs, machineConfig, config, ... }:
{
  #New stuff
  /*
  


    system.preferences.mouse = {
    trackingSpeed = 0.75;
    };

    system.preferences.trackpad = {
    tapToClick = true;
    };

    system.preferences.appearance = {
    darkMode = true;
    };
  

     services.fileVault.enable = true;

     services.firewall.enable = true;

    system.preferences.security = {
    allowAppStoreOnly = false;
    };

    {
    services.timeMachine = {
    enable = true;
    destinations = [ "/Volumes/Backup" ];
    };
    };

    {
    services.displayManager = {
    enable = true;
    configuration = {
      outputs = {
        "eDP-1" = { resolution = "1920x1080"; refreshRate = 60; };
        "HDMI-1" = { resolution = "2560x1440"; refreshRate = 144; };
      };
    };
    };
    }

    {
    system.preferences.display.nightShift = {
    enable = true;
    startTime = "21:00";
    endTime = "07:00";
    warmth = 0.75; # Adjust color warmth (0.0 - 1.0)
    };
    }


    {
    services.softwareUpdate = {
    enable = true;
    schedule = "daily";
    autoDownload = true;
    installCriticalUpdates = true;
    };
    }

    {
    system.preferences.finder = {
    showHiddenFiles = true;
    defaultLocation = "/Users";
    sidebarFavorites = [ "~/Documents" "~/Downloads" ];
    };
    }

    {
    programs.yabai = {
    enable = true;
    scriptingAdditions = true;
    config = {
      mouseFollowsFocus = true;
      autoBalance = true;
    };
    };
    }

    {
    system.preferences.privacy = {
    camera = { enable = false; }; # Disable camera access by default
    microphone = { enable = false; };
    };
    }

    {
    system.preferences.location = {
    enable = false;
    allowApps = [ "Maps" ];
    };
    }



  */

  fonts.packages = with pkgs.nerd-fonts;
    [
      fira-code
      meslo-lg
      fira-mono
      #(nerdfonts.override { fonts = [ "Meslo" "FiraCode" "FiraMono" ]; })
    ];

  networking = {
    computerName = machineConfig.hostname;
    hostName = machineConfig.hostname;
    localHostName = machineConfig.hostname;
  };

  system.keyboard = {
    enableKeyMapping = true;
    remapCapsLockToControl = true;
    nonUS.remapTilde = true;
    userKeyMapping = [
      {
        HIDKeyboardModifierMappingSrc = 233; # € key
        HIDKeyboardModifierMappingDst = 219; # ¤ key
      }
    ];
  };

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

    appswitcher-all-displays = true;
    expose-group-apps = true;
    magnification = true;
    mru-spaces = false;
    orientation = "bottom";
    tilesize = 60;
    largesize = 70;

    # disable hot corners
    wvous-bl-corner = 1;
    wvous-tl-corner = 1;
    wvous-br-corner = 1;
    wvous-tr-corner = 1;
  };

  system.defaults.NSGlobalDomain = {
    AppleICUForce24HourTime = true;
    AppleInterfaceStyle = "Dark";
    AppleEnableMouseSwipeNavigateWithScrolls = false;
    AppleEnableSwipeNavigateWithScrolls = false;
    AppleMeasurementUnits = "Centimeters";
    AppleTemperatureUnit = "Celsius";
    AppleMetricUnits = 1;
    InitialKeyRepeat = 15;
    KeyRepeat = 2;
    ApplePressAndHoldEnabled = false;
  };

  time.timeZone = "Europe/Copenhagen";

  security.pam.enableSudoTouchIdAuth = true;

}
