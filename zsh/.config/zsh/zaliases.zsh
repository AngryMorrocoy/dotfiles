# Aliases

# Use neovim instead
alias v="nvim"
# Custom command for running nvim servers inside tmux
alias vt="nvim-tmux-server"
# Tmux faster strokes uwu
alias t="tmux"
alias ta="tmux a"
# Vim loads the right config
alias vim="vim -u '~/.config/vim/vimrc'"

alias ls="ls --color=auto --group-directories-first"
alias br="br -pi"
alias c="clear"
# alias cat="bat"

alias vimcfg="cd ${XDG_CONFIG_HOME}/vim"
alias nvimcfg="cd ${XDG_CONFIG_HOME}/nvim"
alias bashcfg="vim $HOME/.bashrc"
alias zshcfg="cd ${XDG_CONFIG_HOME}/zsh"
alias qtilecfg="cd ${XDG_CONFIG_HOME}/qtile"

alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'

# Lazygit
alias lg='lazygit'
