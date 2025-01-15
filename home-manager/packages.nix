# https://github.com/rothgar/awesome-tuis
{ pkgs, ... }: {
  home.packages = with pkgs; [
    oh-my-zsh
    zsh-forgit # https://github.com/wfxr/forgit, https://github.com/NixOS/nixpkgs/blob/nixos-unstable/pkgs/shells/zsh/zsh-forgit/default.nix#L51
    zsh-fzf-history-search
    zsh-fzf-tab
    less
    cheat # https://github.com/cheat/cheat
    hyperfine
    lsd # https://github.com/lsd-rs/lsd
    tree
    nil
    # search
    ripgrep # https://github.com/BurntSushi/ripgrep

    # downloaders
    wget
    curl

    # monitoring
    htop

    starship
    mas
    lsd
    bat
    ripgrep
    raycast
    warp-terminal
    vscode
    arc-browser
    _1password-cli
    #_1password-gui #marked as broken, refusing to evaluate.
    spotify
    git
    neovim
    hidden-bar
    alt-tab-macos
    rectangle
    whatsapp-for-mac
    trash-cli
    prettyping
    lolcat
    neofetch
    cmatrix
    sl
    autojump
    ncdu
    mkalias
    nixpkgs-fmt

  ];
}
