{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    mkalias
    nixpkgs-fmt
    home-manager
  ];
  environment = {
    systemPath = [ "/opt/homebrew/bin" ];
    pathsToLink = [ "/Applications" ];
  };

}
