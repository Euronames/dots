''
  # Aliases
  alias sudo='sudo '
  alias mkdir="mkdir -pv"
  alias mv="mv -iv"
  alias cp="cp -iv"
  alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"
  alias rm='trash'
  alias ping="prettyping"
  #alias cat="bat --theme Nord"
  alias vim='nvim'
  alias vi='vim'
  #alias ls='lsd --color always --no-symlink --icon always --icon-theme fancy --blocks name,size,date -l -h'
  alias grep='rg --color=auto' #Ripgrep
  alias vscode='code'
  alias o='open'

  # Custom aliases
  alias la='sudo lsd -lA -h --color always --date relative --icon always --icon-theme fancy --total-size'
  alias zshconfig="vi ~/.zshrc ; echo 'Sourcing zsh file' ; source ~/.zshrc"
  alias neofetch='clear && neofetch | lolcat'
  alias cmatrix='cmatrix -C green'
  alias dots="git -C $DOTFILES add -A ; git -C $DOTFILES commit -m 'Changed stuff' ; git -C $DOTFILES push"
  alias glog='git log --oneline --decorate'
  alias reboot='sudo reboot'
  alias sl='sl | lolcat'
  alias cya="dots ; sudo shutdown -h now"
  alias up="darwin-rebuild switch --flake ~/Projects/dots#MacBook-Pro"
  alias c='code'
  alias pullall="find . -mindepth 1 -maxdepth 1 -type d -exec git --git-dir={}/.git --work-tree=$PWD/{} pull origin master \;"
  alias myip="curl ipinfo.io/ip"
  alias ports="netstat -t -u -l -a -n"
  #alias status='watch -c git status'
  #alias k='kubectl'
  alias j='autojump'
  #alias lazykube='k9s'
  #alias t='terraform'
  #alias py='python3'
''
