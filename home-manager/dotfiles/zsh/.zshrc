SPACESHIP_PROMPT_ASYNC=FALSE
#For testing speed of ZSH
#zmodload zsh/zprof

#EXPORTS
export DOTFILES="$HOME/Dots"
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
export ZSH="$HOME/.oh-my-zsh"
export IDF_PATH="$HOME/esp/esp-idf"
#export PATH="$PATH:~/Code/bin"
export ZSH_CUSTOM="$DOTFILES/oh-my-zsh/.oh-my-zsh"
export TERM='xterm-256color'
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export ANDROID_HOME="$HOME/Android/Sdk"
export JAVA_HOME="/usr/lib/jvm/default"
export JDK_HOME="/usr/lib/jvm/java-8-openjdk/"
#export EDITOR="nvim"
export EDITOR="code"
export VISUAL="nvim"
export GOPATH="$HOME/Code/resources/Go"
export LOCALBIN="$HOME/.local/bin"
export ADB="$ANDROID_HOME/platform-tools"
export ANDROID_TOOLS="$ANDROID_HOME/tools"
export KITTYCONF="$DOTFILES/kitty/.config/kitty"
export STARSHIP_CONFIG="/Users/jensnavne/.config/starship.toml"
#export XDG_CURRENT_DESKTOP="sway"

#FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
#eval "$(lua $ZSH_CUSTOM/plugins/z.lua/z.lua --init zsh enhanced once fzf)"

#Theme
#ZSH_THEME='euro'

#Pluins
#plugins=(cp git alias-tips zsh-autosuggestions fzf-tab zsh-syntax-highlighting zsh-256color copyzshell navi zsh-completions)
#plugins=(cp git alias-tips zsh-autosuggestions fzf-tab fast-syntax-highlighting zsh-256color copyzshell zsh-completions z.lua)
#plugins=(cp git zsh-autosuggestions fzf-tab fast-syntax-highlighting zsh-256color copyzshell zsh-completions autojump)
plugins=(cp git 1password)

# Sourcing
source $ZSH/oh-my-zsh.sh
#[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh
#source $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#Dircolors
#test -r "$HOME/.dir_colors" && eval $(dircolors ~/.dir_colors)

#ALIASES
. $HOME/.zsh_aliases
#FUNCTIONS
. $HOME/.zsh_functions

# Set title, uses function set-title-precmd()
add-zsh-hook precmd set-title-precmd

# Always show hidden files
setopt globdots

# Navi #
#eval "$(navi widget zsh)"

#FONTS
# Background color of the font preview window
export FONTPREVIEW_BG_COLOR="#2e3440"

# Foreground color of the font preview window
export FONTPREVIEW_FG_COLOR="#eceff4"

#eval $(thefuck --alias)
eval "$(starship init zsh)"

# Completion for kitty
#kitty + complete setup zsh | source /dev/stdin

#autoload -U +X bashcompinit && bashcompinit
#complete -o nospace -C /usr/bin/terraform terraform

#For testing speed of ZSH
#zprof
