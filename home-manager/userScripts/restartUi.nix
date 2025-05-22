{ lib, ... }:

{
  home.activation = {
    restartUi = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      # Restart UI services for changes to take effect
      if command -v /usr/bin/killall &>/dev/null
      then
        /usr/bin/killall SystemUIServer || true
        /usr/bin/killall Finder || true
        /usr/bin/killall Dock || true
      else
        echo "killall not found! Skipping..."
      fi
    '';
  };
}
