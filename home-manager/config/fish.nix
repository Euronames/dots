{ ... }:
let
  inherit (import ./aliases.nix) shellAliases functions;
in
{
  programs.fish = {
    enable = true;

    # This block is run as early as possible—before shell integrations load
    loginShellInit = ''
      set fish_greeting # Disable greeting
      # Ensure system-wide Nix binaries (darwin-rebuild etc) are always in PATH
      if not contains /run/current-system/sw/bin $PATH
        set -gx PATH /run/current-system/sw/bin $PATH
      end

      # Add Home Manager user profile to PATH if not already present
      if not contains /etc/profiles/per-user/$USER/bin $PATH
        set -gx PATH /etc/profiles/per-user/$USER/bin $PATH
      end
    '';

    inherit shellAliases;
    functions = functions.fish;
  };
}
