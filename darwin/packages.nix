{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    mkalias
    nixpkgs-fmt
  ];
  environment = {
    systemPath = [ "/opt/homebrew/bin" ];
    pathsToLink = [ "/Applications" ];
  };

}
