{ ... }:
{
  programs.lazygit = {
    enable = true;
    settings = {
      # Theme configuration
      gui = {
        theme = {
          lightTheme = false;
          activeBorderColor = [
            "green"
            "bold"
          ];
          inactiveBorderColor = [ "white" ];
          optionsTextColor = [ "blue" ];
          selectedLineBgColor = [ "default" ];
          selectedRangeBgColor = [ "blue" ];
          cherryPickedCommitBgColor = [ "cyan" ];
          cherryPickedCommitFgColor = [ "blue" ];
          unstagedChangesColor = [ "red" ];
        };
        # UI layout and behavior
        showIcons = true;
        expandFocusedSidePanel = true;
        showFileTree = true;
        showRandomTip = true;
        showCommandLog = true;
        showBottomLine = true;
        showFilteredFiles = true;
        scrollHeight = 10;
        scrollPastBottom = true;
      };

      # Confirmation prompts
      confirmOnQuit = false;

      # Custom commands
      customCommands = [
        {
          key = "C";
          command = "git cz";
          description = "Commit with commitizen";
          context = "files";
          loadingText = "Loading commitizen...";
        }
        {
          key = "n";
          command = "git now --all";
          description = "Run git-now";
          context = "status";
          loadingText = "Running git-now...";
        }
      ];

      # Custom hooks
      hooks = {
        preCommit = "echo 'Committing changes...'";
        postCommit = "echo 'Commit successful!'";
      };

      # Update settings
      update = {
        method = "prompt";
        days = 14;
      };

      # Reporting settings
      reporting = "undetermined";

      # Notifications settings
      notifications = true;

      # Refreshing settings
      refresher = {
        refreshInterval = 10;
        fetchInterval = 60;
      };
    };
  };
}
