{ lib, ... }:

{
  home.activation = {
    filevaultCheck = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      # Enable FileVault (if not already enabled)
      # Note: This can only check status, enabling requires user interaction
      if [ "$(/usr/bin/fdesetup status | grep -c "FileVault is On")" -eq 0 ]; then
        echo "Consider enabling FileVault for disk encryption manually"
      fi
    '';
  };
}
