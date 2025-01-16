# https://github.com/rothgar/awesome-tuis
{ pkgs, ... }: {
  home.packages = with pkgs; [
    #ZSH#
    zsh                         # Best shell: https://github.com/zsh-users/zsh
    oh-my-zsh                   # Framework for managing zsh configuration: https://github.com/ohmyzsh/ohmyzsh
    zsh-fzf-history-search      # Fyz
    zsh-fzf-tab
    starship

    #CLI TOOLS#
    less
    cheat                       # https://github.com/cheat/cheat
    hyperfine
    lsd                         # https://github.com/lsd-rs/lsd
    tree
    wget
    curl
    ripgrep                     # https://github.com/BurntSushi/ripgrep
    htop
    lsd
    bat
    ripgrep
    git
    neovim
    trash-cli
    prettyping
    lolcat
    neofetch
    cmatrix
    sl
    autojump
    ncdu

    #NIX#
    nil
    mas
    mkalias
    nixpkgs-fmt

    #TOOLS#
    raycast
    warp-terminal
    vscode
    arc-browser
    _1password-cli
    #_1password-gui              #marked as broken, refusing to evaluate.
    spotify
    whatsapp-for-mac

    #MACOS#
    hidden-bar
    alt-tab-macos
    rectangle
  ];
}
