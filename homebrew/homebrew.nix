{
  enable = true;
  #  caskArgs.no_quarantine = true;
  global.brewfile = true;
  onActivation.cleanup = "zap";
  onActivation.autoUpdate = true;
  onActivation.upgrade = true;


  masApps = {
    #"Hidden Bar" = 1452453066;
  };

  brews = [
  ];
  casks = [
    "1password"
  ];
  taps = [
  ];
}
