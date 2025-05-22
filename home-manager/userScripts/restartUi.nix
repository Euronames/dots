{ lib, ... }:

{
  home.activation = {
    restartUi = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      # Restart UI services for changes to take effect
      /usr/bin/killall SystemUIServer || true
      /usr/bin/killall Finder || true
      /usr/bin/killall Dock || true
    '';
  };
}
