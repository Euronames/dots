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

      # Git integration settings
      git = {
        paging = {
          colorArg = "always";
          pager = "delta --dark --paging=never";
        };
        merging = {
          manualCommit = false;
          args = "--no-ff";
        };
        pull = {
          mode = "rebase";
        };
        autoFetch = true;
        autoRefresh = true;
        branchLogCmd = "git log --graph --color=always --abbrev-commit --decorate --date=relative --pretty=medium {{branchName}} --";
        allBranchesLogCmd = "git log --graph --all --color=always --abbrev-commit --decorate --date=relative --pretty=medium";
        disableForcePushing = false;
        commitPrefixes = {
          my_project = {
            pattern = ".*";
            replace = "";
          };
        };
      };

      # Custom key bindings
      keybinding = {
        universal = {
          quit = "q";
          quit-alt1 = "<c-c>";
          return = "<esc>";
          quitWithoutChangingDirectory = "Q";
          togglePanel = "<tab>";
          prevItem = "<up>";
          nextItem = "<down>";
          prevBlock = "<left>";
          nextBlock = "<right>";
          prevPage = ",[";
          nextPage = "]";
          gotoTop = "<";
          gotoBottom = ">";
          prevTab = "<";
          nextTab = ">";
          startSearch = "/";
          optionMenu = "x";
          edit = "e";
          refresh = "R";
          createRebaseOptionsMenu = "m";
          pushFiles = "P";
          pullFiles = "p";
          scrollUpMain = "<pgup>";
          scrollDownMain = "<pgdown>";
          scrollUpMainAlt1 = "K";
          scrollDownMainAlt1 = "J";
          executeCustomCommand = ":";
        };
        status = {
          checkForUpdate = "u";
          recentRepos = "<enter>";
        };
        files = {
          commitChanges = "c";
          commitChangesWithEditor = "C";
          amendLastCommit = "A";
          commitChangesWithoutHook = "w";
          ignoreFile = "i";
          refreshFiles = "r";
          stashAllChanges = "s";
          viewStashOptions = "S";
          toggleStagedAll = "a";
          viewResetOptions = "<c-r>";
          fetch = "f";
          toggleTreeView = "`";
        };
        branches = {
          createPullRequest = "o";
          checkoutBranchByName = "c";
          forceCheckoutBranch = "F";
          rebaseBranch = "r";
          mergeIntoCurrentBranch = "M";
          viewGitFlowOptions = "i";
          fastForward = "f";
          pushTag = "P";
          setUpstream = "u";
        };
        commits = {
          squashDown = "s";
          renameCommit = "r";
          renameCommitWithEditor = "R";
          viewResetOptions = "g";
          markCommitAsFixup = "f";
          createFixupCommit = "F";
          squashAboveCommits = "S";
          moveDownCommit = "<c-j>";
          moveUpCommit = "<c-k>";
          amendToCommit = "A";
          pickCommit = "p";
          revertCommit = "t";
          cherryPickCopy = "c";
          cherryPickCopyRange = "C";
          pasteCommits = "v";
          tagCommit = "T";
          checkoutCommit = "<space>";
          resetCherryPick = "<c-R>";
          copyCommitMessageToClipboard = "<c-y>";
          openLogMenu = "<c-l>";
        };
        stash = {
          popStash = "g";
          renameStash = "r";
        };
        commitFiles = {
          checkoutCommitFile = "c";
        };
      };

      # Confirmation prompts
      confirmOnQuit = true;

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
          key = "b";
          command = "hub browse";
          description = "Open repository in browser";
          context = "global";
          loadingText = "Opening repository in browser...";
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
