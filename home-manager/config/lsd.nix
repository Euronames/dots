args: {
  programs.lsd = {
    enable = true;
    enableFishIntegration = true;

    colors = {
      size = {
        large = "dark_yellow";
        none = "grey";
        small = "yellow";
      };
    };

    # https://github.com/lsd-rs/lsd?tab=readme-ov-file#config-file-content
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
