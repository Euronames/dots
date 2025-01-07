{ config, pkgs, machineConfig, self, ... }:

{
  imports = [
    ./users.nix
    ./system.nix
    ./packages.nix
    ./config.nix
    ./services.nix
    ./zsh.nix
  ];
}
