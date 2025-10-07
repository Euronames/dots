args:
let
  sharedAliases = import ./aliases.nix;
in
{
  programs.zsh = {
    enable = false;
    enableCompletion = true;

    autosuggestion = {
      enable = true;
      strategy = [ "completion" ];
    };

    history = {
      ignoreDups = true;
      expireDuplicatesFirst = true;
      size = 10000;
    };

    syntaxHighlighting = {
      enable = true;
    };

    oh-my-zsh = {
      enable = true;
      plugins = [
        "cp"
        "git"
        "1password"
      ];
    };
    inherit (sharedAliases) shellAliases;
    initContent = sharedAliases.functions.zsh;
  };
}
