# zmodload zsh/zprof

autoload -Uz add-zsh-hook
autoload -Uz vcs_info

HIST_STAMPS="dd.mm.yyyy"

export EDITOR='nvim'


# Aliases

alias zshconfig="nvim ~/.zshrc"
alias sourcezsh="source ~/.zshrc"
alias editzsh="nvim ~/.zshrc"

alias l='ls -lah'
alias la='ls -lAh'
alias ll='ls -lh'
alias ls='ls -G'
alias lsa='ls -lah'

alias ga='git add'
alias gaa='git add .'
alias gc='git commit'
alias gcmsg='git commit -m'
alias gst='git status'
alias gl='git pull'
alias gp='git push'
alias gpsup='git push --set-upstream origin $(git_current_branch)'
alias gd='git diff'
alias gsw='git switch'
alias gswc='git switch -c'
alias gswm='git switch $(git_main_branch)'
alias gb='git branch'

alias tf='terraform'

alias idea='open -a "IntelliJ IDEA CE.app"'
alias webstorm='open -a "WebStorm.app"'
alias xcode='open -a "Xcode.app"'


# Prompt

# Enabling and setting git info var to be used in prompt config.
zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '●'
zstyle ':vcs_info:*' stagedstr '●'
zstyle ':vcs_info:*' formats " %b %F{yellow}%c%f %F{red}%u%f"
add-zsh-hook precmd vcs_info

# Enable substitution in the prompt.
setopt prompt_subst

prompt_dir="%F{blue}%~%f"
prompt_time="%F{blue}%*%f"
prompt_newline=$'\n'
prompt_suffix="%F{red}$%f "
prompt_surround_open="%F{cyan}[%f"
prompt_surround_close="%F{cyan}]%f"

prompt=${prompt_newline}
prompt+="${prompt_surround_open}${prompt_dir}${prompt_surround_close}"
prompt+=" "
prompt+='${vcs_info_msg_0_}'
prompt+=${prompt_newline}
prompt+=${prompt_suffix}

RPROMPT="${prompt_surround_open}${prompt_time}${prompt_surround_close}"


# Nvm initialisation

nvm() {
    unset -f nvm
    export NVM_DIR=~/.nvm
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
    nvm "$@"
}
node() {
    unset -f node
    export NVM_DIR=~/.nvm
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
    node "$@"
}
npm() {
    unset -f npm
    export NVM_DIR=~/.nvm
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
    npm "$@"
}


# Plugins

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

plugins() {
    # takes git repo url ending as argument e.g. username/repo
    local install_plug() {
	if [ -e ~/.zsh/$1 ]
	then
	    git -C ~/.zsh/$1 pull
	else
	    git clone https://github.com/$1.git ~/.zsh/$1
	fi
    }

    install_plug zsh-users/zsh-autosuggestions
    install_plug zsh-users/zsh-syntax-highlighting
}


# Tab titles

set_tab_title() {
    echo -ne "\e]1;${PWD##*/}\a"
}

add-zsh-hook precmd set_tab_title

# zprof
