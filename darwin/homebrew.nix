# https://github.com/zhaofengli/nix-homebrew

{ inputs, machineConfig, ... }:
{
  nix-homebrew = {
    enable = true;

    # TODO: fails with 'ln /usr/local/bin/brew: No such file or directory"
    enableRosetta = false;

    user = machineConfig.username;
    taps = {
      "homebrew/homebrew-core" = inputs.homebrew-core;
      "homebrew/homebrew-bundle" = inputs.homebrew-bundle; # https://github.com/zhaofengli/nix-homebrew/issues/9#issuecomment-1774684583
      "homebrew/homebrew-cask" = inputs.homebrew-cask;
    };

    mutableTaps = false; # do not allow installs outside of nix
    #autoMigrate = true; # remember this before first run
    extraEnv = {
      HOMEBREW_NO_ANALYTICS = "1";
    };
  };

  enable = true;
  #  caskArgs.no_quarantine = true;
  global.brewfile = true;
  onActivation.cleanup = "zap";
  onActivation.autoUpdate = true;
  onActivation.upgrade = true;

  homebrew = {
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
}
