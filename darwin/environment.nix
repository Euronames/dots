{
  environment.variables = {
    DOTFILES = ''"''${HOME}/Projects/dots"'';
    ZSH_CUSTOM = ''"''${DOTFILES}/oh-my-zsh/.oh-my-zsh"'';
    ZSH = ''"''${HOME}/.oh-my-zsh"'';
    EDITOR = "code";
    VISUAL = "nvim";
    LOCALBIN = ''"''${HOME}/.local/bin"'';
    STARSHIP_CONFIG = ''"''${HOME}/.config/starship.toml"'';

    #Color of the font preview window
    FONTPREVIEW_BG_COLOR = "#2e3440";
    FONTPREVIEW_FG_COLOR = "#eceff4";
  };
}
