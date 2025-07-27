{ config, pkgs, ... }:
{
  programs.bat = {
    enable = true;
    config = {
      theme = "nord";
      pager = "less -FR";
    };
  };
}
