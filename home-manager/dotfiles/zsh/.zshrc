SPACESHIP_PROMPT_ASYNC=FALSE

#For testing speed of ZSH
#zmodload zsh/zprof

#FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
#eval "$(lua $ZSH_CUSTOM/plugins/z.lua/z.lua --init zsh enhanced once fzf)"

#Theme
ZSH_THEME='euro'

setopt HIST_IGNORE_ALL_DUPS # Avoid duplicate entries in history
setopt AUTO_LIST            # Automatically list options when completing
setopt AUTO_MENU            # Cycle through completion options

#Pluins
#plugins=(cp git alias-tips zsh-autosuggestions fzf-tab zsh-syntax-highlighting zsh-256color copyzshell navi zsh-completions)
#plugins=(cp git alias-tips zsh-autosuggestions fzf-tab fast-syntax-highlighting zsh-256color copyzshell zsh-completions z.lua)
#plugins=(cp git zsh-autosuggestions fzf-tab fast-syntax-highlighting zsh-256color copyzshell zsh-completions autojump)
plugins=(cp git 1password autojump)

# Sourcing
#source $ZSH/oh-my-zsh.sh
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

#eval $(thefuck --alias)
eval "$(starship init zsh)"

#For testing speed of ZSH
#zprof
