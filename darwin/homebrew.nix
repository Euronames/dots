
{
  enable = true;
  #caskArgs.no_quarantine = false;

  onActivation = {
		cleanup = "zap"; # invokes --zap on `darwin-rebuild switch`
    autoUpdate = true;
    upgrade = true;
	};

  masApps = {
    #"Hidden Bar" = 1452453066;
  };

  brews = [
    "unoconv"
  ];
  casks = [
    "1password"
    #"topnotch"
    "vlc"
    "desktoppr"
  ];
  taps = [
  ];

}
