# __  __ ____
#|  \/  |  _ \
#| |\/| | |_) | ZSH CONFIG
#| |  | |  _ <
#|_|  |_|_| \_\
#*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
# Default Stuff, don't know what they do
emulate sh -c 'source /etc/profile'
#*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*

# Add .local/bin to path
export PATH="${PATH}:$HOME/.local/bin/:$HOME/.cargo/bin"

# Default editor
export EDITOR="vim"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
# Moves the xinitrc, actually using symlinks
#export XINITRC="${XDG_CONFIG_HOME}/x11/xinitrc"
export XAUTHORITY="${XDG_CONFIG_HOME}/Xauthority"

# Move zsh stuff to ~/.config/zsh
export ZDOTDIR="${XDG_CONFIG_HOME}/zsh"
export HISTFILE="${XDG_CONFIG_HOME}/zsh/zsh_history"

# For ncurses disk usage
export NCDU_SHELL=zsh

# Moving vim from ~/.vim to ~/.config/vim
# Commented because it's an event that also affects nvim, I want separated config files
# export VIMINIT="source $HOME/.config/vim/vimrc"

# Vim as manpager
export MANPAGER='/bin/bash -c "nvim -MRn -c \"set colorcolumn=0 buftype=nofile showtabline=0 ft=man ts=8 nomod nolist norelativenumber nonu noma\" -c \"normal L\" -c \"nmap q :qa<CR>\"</dev/tty <(col -b)"'
# Bat as manpager
# export MANPAGER="sh -c 'col -bx | bat -l man -p'"

#*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
#----Startx if user  in tty1 or tty2----
if [[ -z $DISPLAY ]]; then
    if [[ $(tty) = /dev/tty1 ]] || [[ $(tty) = /dev/tty2 ]];then
        exec startx
    fi
fi
#*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*

