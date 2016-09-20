export ZSH=/home/niel/.oh-my-zsh
ZSH_THEME="gnzh"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# load zgen
    source "${HOME}/.zgen/zgen.zsh"
    if ! zgen saved
    then
	echo "Creating a zgen save"
	
	zgen load zsh-users/zsh-syntax-highlighting
	zgen load zsh-users/zsh-history-substring-search
	# zgen load zsh-users/zsh-autosuggestions
    zgen oh-my-zsh plugins/git
	zgen save
    fi
#}}} 

#{{{ ZSH Modules
    autoload -U compinit
    autoload -Uz promptinit
    autoload -U colors && colors

    compinit
    promptinit
#}}}

#{{{ Options
    setopt auto_cd
    setopt no_hup
    setopt ignore_eof
    setopt rm_star_wait
#}}}

#{{{ Variables
    export SCRIPTS="~/.scripts"
    export EDITOR=nvim

    # Android
    export ANDROID_HOME=/opt/android-sdk
    export ANDROID_TOOLS="$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools"
     #Java
    export _JAVA_AWT_WM_NONREPARENTING=1 # Solve blank window problem
#}}}

#{{{ Colorize commands
    function ping { command ping "$@" | ccze -A }
    function traceroute { command traceroute "$@" | ccze -A }
    function make { command make "$@" | ccze -A }
    function ./configure { command ./configure "$@" | ccze -A }
#}}}

#{{{ Aliases
    alias am="alsamixer" alsamixer='alsamixer'
    alias wifi="sudo wifi-menu -o"
    alias m="cmus"
    alias mail="mutt"
    alias lsl="command ls -lLh --color | ccze -A"
    alias lsls="command ls -lLha --color | ccze -A"
    alias py=/usr/bin/python2.7
    alias nv="nvim"

    function gd() { git diff --color "$@" | diff-so-fancy | less -RSFXi }

    function man()
    {
        command man -P true "$*" &> /dev/null
        if [[ $? -eq 0 ]];
        then
            command nvim -c ":Man $*" -c ":tabonly" -c ":bd 1"
        else
            echo
            echo
            echo -e "\t No man page \"$*\"    ¯\_(ツ)_/¯"
            echo
        fi
    }

    #{{{ Edit Dotfiles
        alias ev="$EDITOR ~/.config/nvim/init.vim"
        alias et="$EDITOR ~/.tmux.conf"
        alias er="$EDITOR ~/.ratpoisonrc"
        alias ez="$EDITOR ~/.zshrc"
        alias ex="$EDITOR ~/.xinitrc"
        alias '\ev'="$EDITOR ~/.config/nvim/init.vim"
        alias '\et'="$EDITOR ~/.tmux.conf"
        alias '\er'="$EDITOR ~/.ratpoisonrc"
        alias '\ez'="$EDITOR ~/.zshrc"
        alias '\ex'="$EDITOR ~/.xinitrc"
    #}}}
    
    #{{{ Fancy
        # if [ -f /usr/bin/screenfetch ]; then screenfetch; fi
        alias stack="echo; cat ~/.artworks/lambda | lolcat -S 28; echo; stack"
        alias cabal="echo; cat ~/.artworks/lambda | lolcat -S 28; echo; cabal"
        alias eje="echo; cat ~/.artworks/floppy; echo; sudo eject /mnt/mem"
        alias mem="echo; cat ~/.artworks/floppy; echo; \
            sudo mount /dev/sdb1 /mnt/mem"
        alias pacman="echo; cat ~/.artworks/pacman; echo; sudo pacman"
        alias pacmanup="echo; cat ~/.artworks/pacman; echo; sudo pacman -Syyu"
        alias clip="xclip -selection clipboard -i"
    #}}}
#}}}

#{{{ Global Functions
    function command_not_found_handler()
    {
        cat ~/.artworks/signstop
    }

    function list_dir()
    {
        echo
        find "$1/" -maxdepth 1 -not -path '*/\.*' -printf \
            "[%y]\t%P\n" | tail -n +2 | eval ${SORT_COMMAND} \
            | sed -r \
            "s/\[[d]\](.*)/$(printf '\033[0;36m D')\1$(printf '\033[0m')/"\
            | sed -r \
            "s/\[[f]\](.*)/$(printf '\033[0;32m F')\1$(printf '\033[0m')/"\
            | sed -r \
            "s/\[[l]\](.*)/$(printf '\033[0;34m L')\1$(printf '\033[0m')/"
        SORT_COMMAND="sort"
    }
#}}}

# Allow Copy/Paste with the system clipboard
    # behave as expected with vim commands ( y/p/d/c/s )
    [[ -n $DISPLAY ]] && (( $+commands[xclip] )) && {

    function cut_buffer()
    {
        zle .$WIDGET
        echo $CUTBUFFER | xclip -selection clipboard
    }

    zle -N vi-yank cut_buffer
    zle -N vi-yank-eol cut_buffer

    function put_buffer()
    {
        zle copy-region-as-kill "$(xclip -selection clipboard -o |
        sed "s/^/ /")"
        zle .$WIDGET
    }

    function put_quoted_buffer()
    {
        zle copy-region-as-kill "$(xclip -selection clipboard -o |
        sed "s/^/ '/;s/$/'/")"
        zle .$WIDGET
    }

    zle -N vi-put-after put_buffer
    zle -N vi-put-before put_quoted_buffer
    }
#}}}

#{{{ First Init
    # Auto start X11
    if [[ ! (-e /tmp/.X0-lock) ]]; then
        startx
    fi
#}}}

export NVM_DIR="/home/niel/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
