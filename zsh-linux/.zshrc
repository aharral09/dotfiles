# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export PATH=$HOME/.spicetify/:$PATH
export PATH=$HOME/dotfiles/.bin:$PATH
export SHELL=/usr/bin/zsh

eval "$(zoxide init zsh)"

# normal
alias ff='fastfetch'
alias nv='nvim'
alias vi='nvim'
alias v='nvim'
alias nf='nvim $(fzf)'
alias lc='ls -C'
alias ll='ls -lh'
alias reload='source ~/.zshrc'
alias ss='sshs -c ~/.ssh/config'

# package management
alias install='sudo dnf -y install'
alias update='sudo dnf -y update'
alias upgrade='sudo dnf -y upgrade'
alias uninstall='sudo dnf -y remove'

# tmux
alias tl='tmux ls'
alias tn='tmux new -s'
alias tk='tmux kill-ses -t'
alias ta='tmux a -t'
alias td='tmux detach'
#alias ts='tmuxinator start'
alias ts='tmux-sessionizer'
alias tr='tmux source-file ~/.tmux.conf'

# git
alias gs='git st'
alias gc='git cm'
alias gp='git push'
alias gy='git fetch && git pull'
alias gd='git diff'
alias gL='git log --graph'
alias gr='git revert'
alias lg='lazygit'

# docker
alias docker='sudo docker'

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh
