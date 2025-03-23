{ ... }:
{
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;

    # Default command to use when input is tty
    defaultCommand = "rg --files --hidden --follow --glob '!.git/*'";

    # Command to use when running fzf
    fileWidgetCommand = "fd --type f --hidden --follow --exclude .git";

    # Command for changing directories
    changeDirWidgetCommand = "fd --type d --hidden --follow --exclude .git";

    # Default options
    defaultOptions = [
      "--height 40%"
      "--layout=reverse"
      "--border"
      "--inline-info"
      "--color=bg+:#3B4252,bg:#2E3440,spinner:#81A1C1,hl:#616E88"
      "--color=fg:#D8DEE9,header:#616E88,info:#81A1C1,pointer:#81A1C1"
      "--color=marker:#81A1C1,fg+:#D8DEE9,prompt:#81A1C1,hl+:#81A1C1"
    ];

    # History widget options
    historyWidgetOptions = [
      "--sort"
      "--exact"
    ];

    # File widget options with previews
    fileWidgetOptions = [
      "--preview 'bat --color=always --style=numbers --line-range=:500 {}'"
    ];

    # Change directory widget options with previews
    changeDirWidgetOptions = [
      "--preview 'lsd --color=always --tree --depth=2 {}'"
    ];

    # Custom key bindings for fzf
    tmux.enableShellIntegration = true;

    # Common keybindings
    #keybindings = {
    #"ctrl-t" = "execute(echo {+} | xargs -o nvim)";
    #"ctrl-y" = "execute-silent(echo {+} | pbcopy)";
    #"ctrl-v" = "execute(echo {+} | xargs -o code)";
    #"ctrl-o" = "execute(open {})";
    #"alt-enter" = "execute(echo {} | xargs -o less)";
    #};
  };
}
