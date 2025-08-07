{
  ...
}:
{
  programs.ssh = {
    enable = true;

    matchBlocks = {
      "proxbox" = {
        hostname = "192.168.0.105";
        user = "root";
      };
    };

    extraConfig = ''
      IdentityAgent = "~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
    '';
  };
}
