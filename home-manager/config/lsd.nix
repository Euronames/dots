args: {
  programs.lsd = {
    enable = true;

    colors = {
      size = {
        large = "dark_yellow";
        none = "grey";
        small = "yellow";
      };
    };

    settings = {
      classic = false;
      blocks = [
        "name"
        "size"
        "date"
      ];
      date = "relative";
      dereference = false;
      display = "all";
      ignore-globs = [
        ".git"
        ".hg"
      ];
      layout = "oneline";
      size = "default";
      no-symlink = true;
      hyperlink = "auto";

    };

  };
}
