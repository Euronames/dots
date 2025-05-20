{ machineConfig, ... }:

{
  users.users.${machineConfig.username} = {
    inherit (machineConfig) home;
    name = machineConfig.username;
  };
  system.primaryUser = machineConfig.username;
}
