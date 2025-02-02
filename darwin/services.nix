args: {
  services = {

    # Auto upgrade packaged and the daemon service
    nix-daemon.enable = true;

    # services.skhd.enable = true;

  };
}
