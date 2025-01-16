{
  enable = true;
  #caskArgs.no_quarantine = false;

  onActivation = {
    cleanup = "zap"; # invokes --zap on `darwin-rebuild switch`
    autoUpdate = true;
    upgrade = true;
  };

  masApps = { };

  brews = [
    "unoconv"     #Universal converter: https://github.com/unoconv/unoconv
  ];
  casks = [
    "1password"   #Password manager 
    "vlc"         #Media player
    "desktoppr"   #Read and set wallpaper: https://github.com/scriptingosx/desktoppr
    "messenger"   #Facebook messenger client
  ];
  taps = [
  ];

}
