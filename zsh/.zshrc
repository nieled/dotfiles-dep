export ZSH=/home/niel/.oh-my-zsh
ZSH_THEME="agnoster"
plugins=(git zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh
# source ~/.functions

#{{{ Variables
    export MORDOR=190.152.20.153
    export SCRIPTS="~/.scripts"
    export EDITOR=nvim

    export ANDROID_HOME=/opt/android-studio

    export _JAVA_AWT_WM_NONREPARENTING=1
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
    alias m="ncmpcpp"
    alias mail="mutt"
    alias lsl="command ls -lLh --color | ccze -A"
    alias lsls="command ls -lLha --color | ccze -A"
    alias python=/usr/bin/python2.7
    alias nv="nvim"
    alias fe="ranger"
    alias o="xdg-open"

    alias ga="git add"
    alias gb="git branch"
    alias gc="git commit"
    alias gco="git checkout"
    alias gl="git log --format=format:'%C(auto)%h %C(green)%aN%Creset %Cblue%cr%Creset %s'"
    alias gs="git status"
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
        alias ez="$EDITOR ~/.zshrc"
        alias ex="$EDITOR ~/.xinitrc"
        alias ei="$EDITOR ~/.config/i3/config"
        alias '\ev'="$EDITOR ~/.config/nvim/init.vim"
        alias '\et'="$EDITOR ~/.tmux.conf"
        alias '\ez'="$EDITOR ~/.zshrc"
        alias '\ex'="$EDITOR ~/.xinitrc"
        alias '\ei'="$EDITOR ~/.config/i3/config"
    #}}}

    #{{{ Fancy
        alias mem="sudo mount /dev/sdb1 /mnt/mem"
        alias eje="sudo eject /mnt/mem"
        alias pacman="sudo pacman"
        alias pacmanup="sudo pacman -Syyu"
        alias gclone="$SCRIPTS/git.sh clone"
        alias gpush="$SCRIPTS/git.sh push"
    #}}}

    #{{{ Sufix
        #gfx
        alias -s pdf=zathura
        alias -s jpg=sxiv
        alias -s jpeg=sxiv
        alias -s gif=sxiv
        alias -s png=sxiv
        #archives
        alias -s zip=zipinfo
        alias -s rar=als
        alias -s gz=als
        #vim
        alias -s c=vim
        alias -s cpp=vim
        alias -s h=vim
        alias -s hpp=vim
        alias -s java=vim
        alias -s php=vim
        alias -s html=vim
        alias -s css=vim
        alias -s js=vim
    #}}}
#}}}

export LANG=en_US.UTF-8
export RANGER_LOAD_DEFAULT_RC=FALSE

function 4chan(){
    curl -s $1 | grep -o -i '<a href="//i.4cdn.org/[^>]*>' | sed -r 's%.*"//([^"]*)".*%\1%' | xargs wget
}

function 4chandl(){
    curl -s $1 | grep -o -i '<a href="//i.4cdn.org/[^>]*>' | sed -r 's%.*"//([^"]*)".*%\1%' | xargs aria2c
}

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
