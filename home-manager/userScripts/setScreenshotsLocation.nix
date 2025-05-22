{ lib, ... }:

{
  home.activation = {
    setScreenshotsLocation = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      # Set screenshots location
      if command -v /usr/bin/defaults &>/dev/null
      then
        mkdir -pv "$HOME/Pictures/Screenshots"
        /usr/bin/defaults write com.apple.screencapture location -string "$HOME/Pictures/Screenshots"
        /usr/bin/defaults write com.apple.screencapture type -string "png"
        /usr/bin/defaults write com.apple.screencapture show-thumbnail -bool false
      else
        echo "defaults not found! Skipping..."
      fi
    '';
  };
}
