{ machineConfig, pkgs, ... }:
{
  environment.variables =
    import ../shared/environment.nix { inherit machineConfig pkgs; };
}
