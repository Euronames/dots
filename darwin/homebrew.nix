{
  enable = true;
  caskArgs.no_quarantine = true;

  onActivation = {
    cleanup = "zap"; # invokes --zap on `darwin-rebuild switch`
    autoUpdate = true;
    upgrade = true;
  };

  masApps = { };

  brews = [
    "unoconv" # Universal converter: https://github.com/unoconv/unoconv
  ];
  casks = [
    "raycast" # Spotlight replacement and productivity tool
    "warp" # Terminal
    "zen" # Distraction-free browser
    "1password" # Password manager
    "spotify" # Music streaming
    "vlc" # Media player
    "desktoppr" # Read and set wallpaper: https://github.com/scriptingosx/desktoppr
    "messenger" # Facebook messenger client
  ];
  taps = [
  ];

}
