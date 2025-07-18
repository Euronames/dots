{
  inputs,
  machineConfig,
  ...
}:
{
  nix-homebrew = {
    enable = true;

    user = machineConfig.username;
    taps = with inputs; {
      "homebrew/homebrew-core" = homebrew-core;
      "homebrew/homebrew-bundle" = homebrew-bundle; # https://github.com/zhaofengli/nix-homebrew/issues/9#issuecomment-1774684583
      "homebrew/homebrew-cask" = homebrew-cask;
    };

    mutableTaps = false; # do not allow installs outside of nix
    autoMigrate = true; # remember this before first run
    extraEnv = {
      HOMEBREW_NO_ANALYTICS = "1";
    };
  };

  imports = [
    ./config.nix
    ./users.nix
    ./system.nix
    ./environment.nix
  ];
}
