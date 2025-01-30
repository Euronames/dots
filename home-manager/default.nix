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
      home.stateVersion = machineConfig.homeManager.stateVersion;
      # home.homeDirectory = home; # clashes with nix-darwin
       
      imports = [
        ./packages.nix
        ./dotfiles.nix
        ./config/git.nix
        ./config/shell.nix 
        ./config/starship.nix
        ./config/lsd.nix
        ./config/autojump.nix
      ];
    };
  };
}
