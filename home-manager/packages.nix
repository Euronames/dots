{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Shell and Terminal
    zsh # Popular shell with advanced features
    oh-my-zsh # Framework for managing zsh configuration
    zsh-fzf-history-search # Fuzzy history search for zsh
    zsh-fzf-tab # Enhanced tab completion with fzf
    starship # Cross-shell prompt customization
    fzf # Command-line fuzzy finder for files, history, and more

    # File Management and Navigation
    lsd # Modern replacement for ls with icons
    tree # Display directory structure
    bat # Modern replacement for cat with syntax highlighting
    trash-cli # Safe alternative to rm, moves files to trash
    ncdu # NCurses disk usage analyzer
    zoxide # Smarter, faster alternative to cd and autojump

    # System Monitoring and Performance
    htop # Interactive process viewer
    hyperfine # Command-line benchmarking tool
    prettyping # Prettier ping output

    # Development Tools
    git # Version control system
    diff-so-fancy # Good-looking diffs filter for git
    neovim # Modern vim text editor
    nixd
    #nil # Nix language server
    nixfmt-rfc-style # Nix code formatter
    lazygit # Terminal UI for git commands
    delta # Syntax-highlighting pager for git diffs
    shellcheck # Static analysis tool for shell scripts
    # Search and Data Processing
    ripgrep # Fast grep alternative
    less # Terminal pager
    cheat # Interactive cheatsheets

    # Network Tools
    wget # File download utility
    curl # URL transfer tool
    gnupg # GNU Privacy Guard for encryption and signing
    # Fun and Customization
    lolcat # Rainbow text output
    neofetch # System information display
    cmatrix # Matrix-like screen display
    sl # Steam Locomotive, fun error correction for 'ls'

    # macOS Applications
    raycast # Spotlight replacement and productivity tool
    vscode # Code editor
    _1password-cli # Password manager CLI
    #whatsapp-for-mac # WhatsApp desktop client
    #_1password-gui            # Marked as broken
    #spotify
    #warp-terminal
    #arc-browser

    # macOS UI Enhancements
    hidden-bar # Menu bar icon management
    alt-tab-macos # Windows-style alt-tab window switcher
    rectangle # Window management tool
    karabiner-elements # Keyboard customization tool
    # macOS System Integration
    mas # Mac App Store CLI
    mkalias # Create macOS aliases

  ];
}
