{ ... }:
{
  programs.starship = {
    enable = true;
    settings = {
      # General settings
      add_newline = false;

      # Line break module
      line_break = {
        disabled = true;
      };

      # Git status module
      git_status = {
        conflicted = "🏳";
        ahead = "🏎💨";
        behind = "😰";
        diverged = "😵";
        untracked = "🤷‍";
        stashed = "📦";
        modified = "📝";
        staged = "[++\\($count\\)](green)";
        renamed = "👅";
        deleted = "🗑";
      };

      # Sudo module
      sudo = {
        style = "bold green";
        symbol = "🧙 ";
        disabled = false;
      };
    };
  };

}
