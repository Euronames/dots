# https://nix-community.github.io/home-manager/
# https://nix-community.github.io/home-manager/options.xhtml
{ machineConfig, ... }:
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
    users.${machineConfig.username} = {
      home.username = machineConfig.username;
      # home.homeDirectory = home; # clashes with nix-darwin

      home.stateVersion = machineConfig.homeManager.stateVersion;
      programs.zsh.oh-my-zsh.enable = true;

      imports = [
        ./packages.nix
        ./dotfiles.nix
        ./config/shell.nix 
        ./config/git.nix
        ./config/starship.nix
      ];
    };
  };
}
