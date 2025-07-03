{
  lib,
  machineConfig,
  pkgs,
  ...
}:
{
  # `programs.git` will generate the config file: ~/.config/git/config
  # to make git use this config file, `~/.gitconfig` should not exist!
  #
  #    https://git-scm.com/docs/git-config#Documentation/git-config.txt---global
  home.activation.removeExistingGitconfig = lib.hm.dag.entryBefore [ "checkLinkTargets" ] ''
    rm -f ~/.gitconfig
  '';

  programs.git = {
    enable = true;
    inherit (machineConfig) userName userEmail;

    signing = {
      signer = "${pkgs.gnupg}/bin/gpg2";
      # Consider making the GPG key a machineConfig value for portability
      key = machineConfig.gpgKey;
      signByDefault = true;
    };

    extraConfig = {

      hub = {
        protocol = "https";
      };

      gpg = {
        format = "ssh";
        ssh.program = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";
      };

      commit = {
        gpgSign = true;
        verbose = true;
      };

      core = {
        editor = "code";
        autocrlf = "input";
        pager = "diff-so-fancy | less --tabs=4 -RF";
      };

      init = {
        defaultBranch = "main";
      };

      color = {
        ui = "auto";
        "diff-highlight" = {
          oldNormal = "red bold";
          oldHighlight = "red bold 52";
          newNormal = "green bold";
          newHighlight = "green bold 22";
        };

        "diff" = {
          meta = "11";
          frag = "magenta bold";
          func = "146 bold";
          commit = "yellow bold";
          old = "red bold";
          new = "green bold";
          whitespace = "red reverse";
        };
      };

      credential = {
        helper = "cache --timeout=3600";
      };

      pull = {
        ff = "only";
      };

      push = {
        default = "simple";
        autoSetupRemote = true;
      };

      rerere = {
        enabled = true;
      };

      filter = {
        "lfs" = {
          required = true;
          clean = "git-lfs clean -- %f";
          smudge = "git-lfs smudge -- %f";
          process = "git-lfs filter-process";
        };
      };

      interactive = {
        diffFilter = "diff-so-fancy --patch";
      };

      alias = {
        aa = "add -A";
        co = "checkout";
        ec = "config --global -e";
        up = "!git pull --rebase --prune $@ && git submodule update --init --recursive";
        cob = "checkout -b";
        cm = "!git add -A && git commit -m";
        save = "!git add -A && git commit -m 'SAVEPOINT'";
        wip = "!git add -u && git commit -m 'WIP' ";
        undo = "reset HEAD~1 --mixed";
        amend = "commit -a --amend";
        wipe = "!git add -A && git commit -qm 'WIPE SAVEPOINT' && git reset HEAD~1 --hard";
        #bclean = ""!f() { git branch --merged ${1-master} | grep -v " ${1-master}$" | xargs git branch -d; }; f"";
        #bdone = ""!f() { git checkout ${1-master} && git up && git bclean ${1-master}; }; f"";
        #logg = "log --oneline --graph --color --decorate";
        st = "status";
        pu = "!git push && git push --tags";
        # plocal = ""!git fetch --prune && for branch in $(git branch -vv | grep ': gone]' | awk '{print $1}'); do git branch -D $branch; done"";
      };
    };
  };
}
