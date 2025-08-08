{ }:

{
  shellAliases = {
    sudo = "sudo ";
    mkdir = "mkdir -pv";
    mv = "mv -iv";
    cp = "cp -iv";
    du = "ncdu --color dark -rr -x --exclude .git --exclude node_modules";
    rm = "trash";
    ping = "prettyping";
    cat = "bat --theme Nord";
    vim = "nvim";
    vi = "nvim";
    grep = "rg";
    vscode = "code";
    o = "open";
    zshconfig = "vi ~/.zshrc ; echo 'Sourcing zsh file' ; source ~/.zshrc";
    neofetch = "clear && neofetch | lolcat";
    cmatrix = "cmatrix -C green";
    dots = "git -C $DOTFILES add -A ; git -C $DOTFILES commit -m 'Changed stuff' ; git -C $DOTFILES push";
    reboot = "sudo reboot";
    sl = "sl | lolcat";
    cya = "dots ; sudo shutdown -h now";
    up = "cd $DOTFILES && nix flake check && nix flake update && sudo darwin-rebuild switch --flake .#MacBook-Pro && cd -";
    c = "code";
    pullall = "find . -mindepth 1 -maxdepth 1 -type d -exec git --git-dir={}/.git --work-tree=$PWD/{} pull origin master \\;";
    myip = "curl ipinfo.io/ip";
    ports = "netstat -t -u -l -a -n";
    lg = "lazygit";
    g = "git";
  };

  functions = {
    fish = {
      mkcd = "function mkcd; if test (count $argv) -gt 0; mkdir $argv[1]; cd $argv[1]; end; end";
      skub = "function skub; git pull; git add -A; if test (count $argv) -gt 0; git commit -m $argv[1]; else; git commit -m '.'; end; git push; end";
      to = "function to; if test (count $argv) -gt 1; unoconv -f $argv[1] $argv[2]; else if test (count $argv) -eq 1; echo 'Need to specify file to convert....'; else; echo 'Need to specify what to convert to...'; end; end; end";
    };

    zsh = ''
      function mkcd() {
          if [[ "$1" ]]; then
              mkdir "$1" && cd "$1"
          fi
      }

      function skub() {
          git pull
          git add -A
          if [ "$1" != "" ]; then
              git commit -m "$1"
          else
              git commit -m "."
          fi
          git push
      }

      function to() {
          if [ "$1" != "" ]; then
              if [ "$2" != "" ]; then
                  unoconv -f "$1" "$2"
              else
                  echo "Need to specify file to convert...."
              fi
          else
              echo "Need to specify what to convert to..."
          fi
      }
    '';
  };
}
