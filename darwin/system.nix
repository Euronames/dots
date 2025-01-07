{ config, pkgs, self, ... }:

{
  system.stateVersion = 5;
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";


  # Git commit hash for the configuration revision
  system.configurationRevision = self.rev or self.dirtyRev or null;

  # Platform specification
  nixpkgs.hostPlatform = "aarch64-darwin";

  #Fixing spotlight
  system.activationScripts.applications = import ./spotlightFix.nix { inherit pkgs config; };

  homebrew = import ../homebrew/homebrew.nix;

    # Following line should allow us to avoid a logout/login cycle
  system.activationScripts.postUserActivation.text = ''
    /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
  '';
}
