source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/opt/zsh-fast-syntax-highlighting/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

eval "$(starship init zsh)"
eval "$(zoxide init --cmd cd zsh)"

alias ~="cd ~"
alias ..="cd .."

alias nv="nvim"
alias ssh="TERM=xterm-256color ssh"

alias cc="claude"
