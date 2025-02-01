{
  machineConfig,
  ...
}:
{
  environment.variables = {
    DOTFILES = "${machineConfig.home}/Projects/dots";
    ZSH = "${machineConfig.home}/.oh-my-zsh";
    LOCALBIN = "${machineConfig.home}/.local/bin";
    STARSHIP_CONFIG = "${machineConfig.home}/.config/starship.toml";
    EDITOR = "code";
    VISUAL = "nvim";

    #Color of the font preview window
    FONTPREVIEW_BG_COLOR = "#2e3440";
    FONTPREVIEW_FG_COLOR = "#eceff4";
  };
}
