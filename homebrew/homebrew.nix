
{
  enable = true;
  caskArgs.no_quarantine = true;

  
  onActivation = {
		#cleanup = "zap"; # invokes --zap on `darwin-rebuild switch`
    autoUpdate = true;
    upgrade = true;
	};



  masApps = {
    #"Hidden Bar" = 1452453066;
  };

  brews = [
  ];
  casks = [
    "1password"
    "topnotch"

    "vlc"
  ];
  taps = [
  ];

}
