# Configuration for zoxide - a smarter cd command
{ ... }:
{
  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    enableFishIntegration = true;

    # Options for zoxide
    options = [
      # Default to using 'cd' as command name instead of 'z'
      "--cmd cd"
    ];
  };
}
