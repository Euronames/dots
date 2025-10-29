{ machineConfig, pkgs, ... }:

{
  home.sessionVariables =
    import ../shared/environment.nix { inherit machineConfig pkgs; };
}
