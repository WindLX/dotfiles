export PATH=$HOME/.local/bin/:$PATH

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# plugin
if [[ "${widgets[zle-keymap-select]#user:}" == "starship_zle-keymap-select" || \
      "${widgets[zle-keymap-select]#user:}" == "starship_zle-keymap-select-wrapped" ]]; then
    zle -N zle-keymap-select "";
fi
eval "$(starship init zsh)"
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-completions/zsh-completions.plugin.zsh
source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
source ~/.zsh/zsh-sudo/zsh-sudo.zsh

bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# alias
alias ze=zellij

proxy_on() {
    export http_proxy="http://127.0.0.1:7897"
    export HTTPS_PROXY="$http_proxy"
    export HTTP_PROXY="$http_proxy"
    export https_proxy="$http_proxy"
    # export ftp_proxy="$http_proxy"
    export all_proxy="$http_proxy"
    export NO_PROXY="localhost,127.0.0.1,::1,192.168.5.0/24"
    echo "Proxy set to: $http_proxy"
}

proxy_off() {
    unset http_proxy HTTPS_PROXY HTTP_PROXY https_proxy ftp_proxy all_proxy NO_PROXY
    echo "Proxy settings cleared"
}
