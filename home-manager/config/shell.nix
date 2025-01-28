{...}: {
programs.zsh = {
    enable = true;
    ohMyZsh = {
      enable = true;
      theme = "euro";
      plugins = [
        "cp"
        "git"
        "1password"
        "autojump"
      ];
    };

    extraConfig = ''
      # Disable asynchronous prompt in spaceship
      SPACESHIP_PROMPT_ASYNC=FALSE

      # Set ZSH options
      setopt HIST_IGNORE_ALL_DUPS  # Avoid duplicate entries in history
      setopt AUTO_LIST             # Automatically list options when completing
      setopt AUTO_MENU             # Cycle through completion options
      setopt globdots              # Always show hidden files

      # Source external files for aliases and functions
      ${lib.fileSystems.concatMapStrings (file: "source ${file}") [
        ./shell_aliases.nix
        ./shell_functions.nix
      ]}
      
      # Initialize starship prompt
      eval "$(starship init zsh)"
    '';

  };
}
