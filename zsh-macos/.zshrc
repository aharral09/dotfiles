# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"
export PATH="$PATH:/Users/aharral/.local/bin"
export PATH="$PATH:/Users/aharral/dotfiles/.bin"
export PATH="$PATH:/opt/homebrew/bin"
export PATH="$PATH:$HOME/.emacs.d/bin"
export EDITOR=nvim
#function y() {
#	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
#	yazi "$@" --cwd-file="$tmp"
#	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
#		builtin cd -- "$cwd"
#	fi
#	rm -f -- "$tmp"
#}
eval "$(zoxide init zsh)"

# Add Doom Emacs to path
export PATH="$PATH:/Users/aharral/.config/emacs/bin"

# Startup time
timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}

# normal
alias reload='source ~/.zshrc'
alias cls='clear'
alias ff='fastfetch'
alias nv='nvim'
alias vi='nvim'
alias nf='nvim $(fzf --height 80% --layout reverse --border --preview "bat -n --color=always {}")'
alias sc='sesh connect "$(sesh list | fzf --preview "bat -n --color=always {}")"'
alias deploy='cd ~/git/hpcwebsite/ && mkdocs gh-deploy'
alias ssho='ssh -o PreferredAuthentications=password -o PubkeyAuthentication=no -o PasswordAuthentication=yes'
alias scpo='scp -o PreferredAuthentications=password -o PubkeyAuthentication=no -o PasswordAuthentication=yes'
alias cleands='find . -name ".DS_Store" -exec rm {} \;'
alias weather='curl wttr.in'
alias flushdns='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder'

# tmux
alias tl='tmux ls'
alias tn='tmux new -s'
alias tk='tmux kill-ses -t'
alias tc='tmux a -t'
alias ta='tmux a'
alias td='tmux detach'
alias ts='tmuxinator start'
alias tr='tmux source-file ~/.tmux.conf'
alias si='tmux-sshionizer'

# git
alias gs='git st'
alias gc='git cm'
alias gp='git push'
alias gy='git fetch && git pull'
alias gd='git diff'
alias gL='git log --graph'
alias gr='git revert'
alias lg='lazygit'

# ansible
alias ap='ansible-playbook'
alias al='ansible-lint'

# jira
alias jira='jiratui ui'
alias my-open-tickets='jiratui ui --jql-expression-id 1 --search-on-startup'
alias all-my-tickets='jiratui ui --jql-expression-id 2 --search-on-startup'
alias my-active-changes='jiratui ui --jql-expression-id 3 --search-on-startup'
alias my-tasks='jiratui ui --jql-expression-id 4 --search-on-startup'
export JIRA_TUI_CONFIG_FILE="$HOME/.config/jiratui/config.yml"

# Auto-suggestions
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

ZSH_THEME="robbyrussell"

plugins=(git ssh-agent)

source $ZSH/oh-my-zsh.sh


