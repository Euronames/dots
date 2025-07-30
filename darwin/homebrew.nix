{
  config,
  ...
}:
{
  enable = true;
  caskArgs.no_quarantine = true;

  onActivation = {
    cleanup = "zap"; # invokes --zap on `darwin-rebuild switch`
    autoUpdate = true;
    upgrade = true;
  };

  global = {
    brewfile = true;
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
    "balenaetcher" # USB image writer
  ];
  taps = builtins.attrNames config.nix-homebrew.taps; # taps from nix-homebrew module
}
