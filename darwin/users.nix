{ machineConfig, ... }:

{
  users.users.${machineConfig.username} = {
    name = machineConfig.username;
    home = machineConfig.home;
  };
}
