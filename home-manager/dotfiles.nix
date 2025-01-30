{ ... }:
{
  home = {
    #file."./.gitconfig".source = ./dotfiles/git/.gitconfig;
    #file."./.config/starship.toml".source = ./dotfiles/starship/starship.toml;
    #file."./.zsh_aliases".source = ./dotfiles/zsh/.zsh_aliases;
    #file."./.zsh_functions".source = ./dotfiles/zsh/.zsh_functions;
    #file."./.zshrc".source = ./dotfiles/zsh/.zshrc;
    file."./.warp/themes/norly.yaml".source = ./config/themes/warp/norly.yaml;
  };
}