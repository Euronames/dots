{ lib, ... }:

{
  home.activation = {
    setWallpaper = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      # Set wallpaper
      if command -v /usr/local/bin/desktoppr &>/dev/null
      then
        /usr/local/bin/desktoppr "$HOME/Projects/dots/darwin/assets/wallpaper.png"
      else
        echo "desktoppr not found! Skipping..."
      fi
    '';
  };
}
