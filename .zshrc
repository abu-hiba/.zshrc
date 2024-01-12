# Path to oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

DISABLE_AUTO_TITLE="true"

# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

HIST_STAMPS="dd.mm.yyyy"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    git-prompt
    gradle
    web-search
    vi-mode
    zsh-autosuggestions
    nvm
)

# vi-mode config
VI_MODE_SET_CURSOR=true

source $ZSH/oh-my-zsh.sh

zstyle ':omz:plugins:nvm' autoload yes

# User configuration

export EDITOR='nvim'

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
webstorm() { open -a "WebStorm.app" $1 }
idea() { open -a "IntelliJ IDEA CE.app" $1 }
xcode() { open -a "Xcode.app" $1 }

# Prompt
# Git prompt
ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_SEPARATOR=" "
ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg_bold[white]%}\uE0A0"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[red]%}%{●%G%}"
ZSH_THEME_GIT_PROMPT_CONFLICTS="%{$fg[red]%}%{*%G%}"
ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg[blue]%}%{+%G%}"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[blue]%}%{-%G%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{↓%G%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{↑%G%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%}%{…%G%}"
ZSH_THEME_GIT_PROMPT_STASHED="%{$fg_bold[blue]%}%{⚑%G%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}%{●%G%}"
ZSH_THEME_GIT_PROMPT_UPSTREAM_SEPARATOR="->"

MY_PROMPT_PREFIX="%F{blue}#%f"
MY_PROMPT_USERNAME="%F{cyan}%n%f"
MY_PROMPT_MACHINE="%F{green}%m%f"
MY_PROMPT_DIR="%F{yellow}%~%f"
MY_PROMPT_TIME="%*"
NEWLINE=$'\n'
MY_PROMPT_SUFFIX="%F{red}$%f "

PROMPT=${NEWLINE}
PROMPT+=${MY_PROMPT_PREFIX}
PROMPT+=" "
PROMPT+=${MY_PROMPT_USERNAME}
PROMPT+=" "
PROMPT+=${MY_PROMPT_MACHINE}
PROMPT+=" "
PROMPT+=${MY_PROMPT_DIR}
PROMPT+=" "
PROMPT+='$(git_super_status)'
PROMPT+=${NEWLINE}
PROMPT+=${MY_PROMPT_SUFFIX}

# Set right prompt.
RPROMPT="${MY_PROMPT_TIME}"
