{
  lib,
  machineConfig,
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
      gpgPath = "\${pkgs.gnupg}/bin/gpg2";
      key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDKMrSvVp0l9fKINnGygXRyjoV2kwmZalbWYfOuP/rfHT1t62xL/daZi4w9K/ucS9wQvXkxEaPwiIg7tqfjI4rTjl77WeZVd/sawiRtKBXyTsjjOC81NB0EpgDnv9hU1cggYDOtUE2EwWSjdmAHaG88uR6BxYOhG54A9KOBWYdgreIPzfYhM/CO5ukWs8wVdi9bCmGiADR0h3O0/oxvfDzZiMsU4+blzkjFEOEG0Je9SwbWy3dmRsiL70amny3EDjrMWpv4VmapWpSwwNvau5kX+X0d+KBejmNjE94tegASqAi2ynLbm2A/YhmMzyvCHgME5UVG3fP15dd6QSbFC7T938KtHiT1AOm+pYd04Xn/XqWVY9aa8arL/ChHQnPPXR85JFnTtkSr3w4UowPZrtf7Io+ISXA5TrBONYlcHzZ63d2TraW6Kq71/hfw/OVLnIsEHSHV5Vv2Etm4aM5xWPRhDfoJRoI0dolExpkdq358A2DxkKAIj8PLdw/fErbtRBVFHMw63juhpL3quQKg+qRZ/A6ZtwCR3qkWkhN7QXrKE7ZR0PtwstBBinrwx7VS2Gp4FGrfD87yMiM/DvY4huUKvif+sZL0b6U933OpiRM9EXLQzKNnS3oflAw4sgI/r+syPRGKyV1+1KyT5OK2ldKGMDkDsIcIR3yzzs1/pQsPew==";
      signByDefault = true;
    };

    extraConfig = {
      gpg.format = "ssh";
      gpg.ssh.program = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";
      commit = {
        gpgSign = true;
        verbose = true;
      };
      core = {
        editor = "code";
        autocrlf = "input";
      };
      init.defaultBranch = "main";
      color.ui = "auto";
      credential.helper = "cache --timeout=3600";
      pull.ff = "only";
      push.autoSetupRemote = true;
      filter."lfs" = {
        required = true;
        clean = "git-lfs clean -- %f";
        smudge = "git-lfs smudge -- %f";
        process = "git-lfs filter-process";
      };
    };
  };
}
