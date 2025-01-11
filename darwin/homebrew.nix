
{
  enable = true;
  #caskArgs.no_quarantine = false;

  onActivation = {
		cleanup = "zap"; # invokes --zap on `darwin-rebuild switch`
    autoUpdate = true;
    upgrade = true;
	};

  masApps = {
  };

  brews = [
    "unoconv"
  ];
  casks = [
    "1password"
    "vlc"
    "desktoppr"
  ];
  taps = [
  ];

}
