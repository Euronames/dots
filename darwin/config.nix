{
  pkgs,
  machineConfig,
  config,
  ...
}:
{
  fonts.packages = with pkgs.nerd-fonts; [
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
      #"${pkgs.arc-browser}/Applications/Arc.app"
      "/Applications/Arc.app"
      #"${pkgs.warp-terminal}/Applications/Warp.app"
      "/Applications/Warp.app"
      "${pkgs.vscode}/Applications/Visual\ Studio\ Code.app"
      #"${pkgs.spotify}/Applications/Spotify.app"
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

  system.defaults.trackpad = {
    Clicking = true;
    Dragging = true;
  };

  system.defaults.NSGlobalDomain = {
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
  };

  #Disable mouse acceleration
  system.defaults.".GlobalPreferences"."com.apple.mouse.scaling" = -1.0;

  time.timeZone = "Europe/Copenhagen";

  security.pam.enableSudoTouchIdAuth = true;

}
