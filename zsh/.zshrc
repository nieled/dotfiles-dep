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
    alias m="mplayer"
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
        alias memo="echo; cat ~/.artworks/floppy; echo; \
            sudo mount /dev/sdb1 /mnt/mem"
        alias mem="echol cat ~/.artworks/floppy; echo; \
            sudo mount -o gid=users,fmask=113,dmask=002 /dev/sdb1 /mnt/mem"
        alias pacman="echo; cat ~/.artworks/pacman; echo; sudo pacman"
        alias pacmanup="echo; cat ~/.artworks/pacman; echo; sudo pacman -Syyu"
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

#{{{ First Init
    # Auto start X11
    if [[ ! (-e /tmp/.X0-lock) ]]; then
        startx
    fi
#}}}
