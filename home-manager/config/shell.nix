{
  ...
}: {
  programs.zsh  =  {
    enable  =  true;
    enableCompletion = true; 


    autosuggestion = {
      enable = true; 
      strategy = ["completion", "match_prev_cmd", "history"]
    };

    history = {
      ignoreDups = true;
      expireDuplicatesFirst = true; 
      size = 10000;
    };

    syntaxHighlighting = {
      enable = true; 
    };

    ohMyZsh  =  {
      enable  =  true;
      theme  =  "euro";
      plugins  =  [
        "cp"
        "git"
        "1password"
        "autojump"
      ];
    };

    localVariables = {
        # Disable asynchronous prompt in spaceship
      SPACESHIP_PROMPT_ASYNC = FALSE
    };

    initExtraFirst  =  ''
      #TODO: not needed? 
      # Initialize starship prompt
      #eval "$(starship init zsh)"
    '';

    shellAliases  =  {
      ##########################
      ### Modifying existing ###
      ##########################
      sudo = 'sudo ';
      mkdir = "mkdir -pv";
      mv = "mv -iv";
      cp = "cp -iv";
      du = "ncdu --color dark -rr -x --exclude .git --exclude node_modules";
      rm = 'trash';
      ping = "prettyping";
      #cat = "bat --theme Nord";
      vim = 'nvim';
      vi = 'vim';
      ls = 'lsd -a -l -h --color always --no-symlink --icon always --icon-theme fancy --blocks name,size,date';
      grep = 'rg --color = auto'; #Ripgrep
      vscode = 'code';
      o = 'open';

      ######################
      ### Custom aliases ###
      ######################
      la = 'sudo lsd -lA -h --color always --date relative --icon always --icon-theme fancy --total-size';
      zshconfig = "vi ~/.zshrc ; echo 'Sourcing zsh file' ; source ~/.zshrc";
      neofetch = 'clear && neofetch | lolcat';
      cmatrix = 'cmatrix -C green';
      dots = "git -C $DOTFILES add -A ; git -C $DOTFILES commit -m 'Changed stuff' ; git -C $DOTFILES push";
      glog = 'git log --oneline --decorate';
      reboot = 'sudo reboot';
      sl = 'sl | lolcat';
      cya = "dots ; sudo shutdown -h now";
      up = "darwin-rebuild switch --flake ~/Projects/dots#MacBook-Pro";
      c = 'code';
      pullall = "find . -mindepth 1 -maxdepth 1 -type d -exec git --git-dir = {}/.git --work-tree = $PWD/{} pull origin master \;";
      myip = "curl ipinfo.io/ip";
      ports = "netstat -t -u -l -a -n";
      #status = 'watch -c git status';
      #k = 'kubectl';
      j = 'autojump';
      #lazykube = 'k9s';
      #t = 'terraform';
      #py = 'python3';

    };

    programs.zsh.initExtra = ''
    ############################
    #Make folder and cd into it#
    ############################
    function mkcd() {
        if [[ "$1" ]]; then
            mkdir "$1" && cd "$1"
        fi
    }
    #############
    #Git command#
    #############
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

    ##############
    #Convert file#
    ##############
    function to() {
        if [ "$1" != "" ]; then
            if [ "$2" != "" ]; then
                unoconv -f "$1" "$2"
                #rmf "$2"
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
