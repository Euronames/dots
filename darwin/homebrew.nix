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
    "warp"        #Terminal
    "arc"         #Browser
    "1password"   #Password manager 
    "spotify"     #Music streaming
    "vlc"         #Media player
    "desktoppr"   #Read and set wallpaper: https://github.com/scriptingosx/desktoppr
    "messenger"   #Facebook messenger client
  ];
  taps = [
  ];

}
