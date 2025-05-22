{ lib, ... }:

{
  home.activation = {
    setScreenshotsLocation = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      # Set screenshots location
      mkdir -pv "$HOME/Pictures/Screenshots"
      /usr/bin/defaults write com.apple.screencapture location -string "$HOME/Pictures/Screenshots"
      /usr/bin/defaults write com.apple.screencapture type -string "png"
      /usr/bin/defaults write com.apple.screencapture show-thumbnail -bool false
    '';
  };
}
