# __  __ ____
#|  \/  |  _ \
#| |\/| | |_) | ZSH CONFIG
#| |  | |  _ <
#|_|  |_|_| \_\
#*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
# Default Stuff, don't know what they do
emulate sh -c 'source /etc/profile'
#*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*

[ -f ~/.config/zsh/.zshenv ] && . ~/.config/zsh/.zshenv

#*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
#----Startx if user  in tty1 or tty2----
if [[ -z $DISPLAY ]]; then
    if [[ $(tty) = /dev/tty1 ]] || [[ $(tty) = /dev/tty2 ]];then
        exec startx
    fi
fi
#*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*

