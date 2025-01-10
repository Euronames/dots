{ config, pkgs, machineConfig, self, ... }:

{
  imports = [
    ./config.nix
    ./homebrew.nix
    ./packages.nix
    ./services.nix
    ./users.nix
    ./system.nix
    ./zsh.nix
  ];
}
