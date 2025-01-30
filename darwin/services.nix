{ ... }:
{
  # Auto upgrade packaged and the daemon service
  services.nix-daemon.enable = true;

  # services.skhd.enable = true;

  #Yabai window manager
  services.yabai.enable = true;
  services.yabai.config = {
    # focus_follows_mouse = "autoraise";
    mouse_follows_focus = "off";
    window_placement = "second_child";
    window_opacity = "off";
    top_padding = 36;
    bottom_padding = 10;
    left_padding = 10;
    right_padding = 10;
    window_gap = 10;
  };
}
