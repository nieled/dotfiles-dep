#!/bin/bash


function is_running
{
    PID=$(pidof -s $1)

    if [[ $PID != "" ]]
    then
        return 0
    else
        return 1
    fi
}


function launch_firefox
{
    if is_running 'firefox';
    then
        ratpoison -c "select firefox"
    else
        ratpoison -c "echo Starting Firefox"
        firefox&
    fi
}


function launch_terminal
{
    if is_running 'urxvt';
    then
        ratpoison -c "select urxvt"
    else
        urxvt -e bash -c "tmux -2 -q has-session &>/dev/null && exec tmux \
            attach-session -d || exec tmux new-session -n$USER \
            -s$USER@$HOSTNAME weechat\; new-window"&
    fi
}


function launch_libreoffice
{
    if is_running 'libreoffice';
    then
        ratpoison -c "select libreoffice"
    else
        libreoffice&
    fi
}


function launch_weechat
{
    launch_terminal
    tmux select-window -t 0
}


case "$1" in
    'firefox')
        launch_firefox
        ;;
    'terminal')
        launch_terminal
        ;;
    'libreoffice')
        launch_libreoffice
        ;;
    'weechat')
        launch_weechat
        ;;
esac
