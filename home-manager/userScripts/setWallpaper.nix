{ lib, ... }:

{
  home.activation = {
    setWallpaper = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      # Set wallpaper
      /usr/local/bin/desktoppr "$HOME/Projects/dots/darwin/assets/wallpaper.png"
    '';
  };
}
