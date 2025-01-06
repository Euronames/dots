{
  enable = true;
  #  caskArgs.no_quarantine = true;
  global.brewfile = true;
  onActivation.cleanup = "zap";
  onActivation.autoUpdate = true;
  onActivation.upgrade = true;


  masApps = {
    "Consent-O-Matic     " = 1606897889;
    "Amphetamine         " = 937984704;
    "Hidden Bar          " = 1452453066;
  };

  brews = [
  ];
  casks = [
    "1password"
  ];
  taps = [
  ];
}
