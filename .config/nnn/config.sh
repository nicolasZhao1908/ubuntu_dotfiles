#!/bin/zsh

export NNN_BMS="d:$HOME/Documents;D:$HOME/Downloads/;.:$HOME/dotfiles/.config;n:$HOME/dotfiles/.config/nvim"
export NNN_TRASH=2 # gio trash --list
BLK="0B" CHR="0B" DIR="04" EXE="06" REG="00" HARDLINK="06" SYMLINK="06" MISSING="00" ORPHAN="09" FIFO="06" SOCK="0B" OTHER="06"
export NNN_FCOLORS="$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$OTHER"

# https://github.com/jarun/nnn/tree/master/plugins#configuration
export NNN_PLUGINS=(
        "p:preview;"
        "i:imgview;"
        'v:!nvim "$nnn"*;'
        'c:-!|readlink -f "$nnn" | xclip -selection clipboard && echo "Absolute path copied";'
        'x:!chmod u+x "$nnn"*;' 
        'E:!sudo -E nvim "$nnn"*'
      )
# Save the current value of IFS
oldIFS=$IFS

# Set IFS to ''
IFS=''
export NNN_PLUG=${NNN_PLUGINS[@]}
IFS=$oldIFS
export NNN_FIFO=$XDG_CONFIG_HOME/nnn/nnn.fifo
export NNN_TERMINAL=alacritty
export NNN_OPENER=$XDG_CONFIG_HOME/nnn/plugins/nuke

if [ -f $HOME/.config/nnn/quitcd.sh ]; then
  source $HOME/.config/nnn/quitcd.sh
fi

