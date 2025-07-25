# Configuration for zoxide - a smarter cd command
{ ... }:
{
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;

    # Options for zoxide
    options = [
      # Default to using 'cd' as command name instead of 'z'
      "--cmd cd"
    ];
  };
}
