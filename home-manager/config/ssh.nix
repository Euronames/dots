{
  ...
}:
{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    matchBlocks = {

      "*" = {
        identityAgent = "'~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock'";
      };

      "proxbox" = {
        hostname = "192.168.0.105";
        user = "root";
      };
    };

  };
}
