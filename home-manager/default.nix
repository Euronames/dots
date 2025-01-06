# https://nix-community.github.io/home-manager/
# https://nix-community.github.io/home-manager/options.xhtml
{ machineConfig, ... }: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
    users.${machineConfig.username} = {
      home.username = machineConfig.username;
      # home.homeDirectory = home; # clashes with nix-darwin

      home.stateVersion = machineConfig.homeManager.stateVersion;

      imports = [
        ./packages.nix
        ./dotfiles.nix
        /*
        ./programs.nix
        ./programs/zsh.nix
        ./programs/zellij.nix
        ./session-variables.nix
        */
      ];
    };
  };
}
