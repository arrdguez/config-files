#!/bin/bash


function preparation() {
    if [ "$(id -u)" == "0" ]; then
        echo "Please run this script as a normal user"
        echo "also make sure to have 'sudo' working..."
        exit 1
    fi
    # Look for env command and link if not found to help make scripts uniform
    if [ -e /bin/env ]; then
        echo "... /bin/env found."
    else
        sudo ln -s /usr/bin/env /bin/env
    fi
    sudo ln -s /sbin/reboot /usr/bin/reboot
    sudo ln -s /sbin/poweroff /usr/bin/poweroff
    shopt -s expand_aliases # enable aliases on this script
    alias mkdir='mkdir --parents --verbose'
    alias cp='cp --verbose'
    alias rm='rm --verbose'
}

function install_required_packages() {

    # Refresh apt
    sudo apt-get update -qq
    sudo apt-get install polybar unzip compton nitrogen conky rofi arandr feh watch 
    #libxcb-composite0-dev libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf xutils-dev dh-autoreconf x11-xserver-utils binutils gcc make pkg-config fakeroot cmake python-xcbgen xcb-proto libxcb-ewmh-dev wireless-tools libiw-dev libasound2-dev libpulse-dev libcurl4-openssl-dev libmpdclient-dev pavucontrol rxvt
}




function create_config_files() {
    # Folder doesn't exist on a clean instalation of Debian
    if [ -e "$HOME"/.config ]; then
        echo "... .config found."
    else
        mkdir "$HOME/.config"
    fi
    # File didn't exist for me, so test and touch
    if [ -e "$HOME"/.Xresources ]; then
        echo "... .Xresources found."
    else
        touch "$HOME"/.Xresources
    fi
    if [ -e "$HOME"/.config/nitrogen/bg-saved.cfg ]; then
        echo "... .bg-saved.cfg found."
    else
        mkdir "$HOME"/.config/nitrogen
        touch "$HOME"/.config/nitrogen/bg-saved.cfg
    fi
    if [ -e "$HOME"/.config/polybar/config ]; then
        echo "... polybar/config found."
    else
        mkdir "$HOME"/.config/polybar
        touch "$HOME"/.config/polybar/config
    fi
    if [ -e "$HOME"/.config/i3/config ]; then
        echo "... i3/config found."
    else
        mkdir "$HOME"/.config/i3
        touch "$HOME"/.config/i3/config
    fi
    # Compton config file doesn't come by default
    if [ -e "$HOME"/.config/compton.conf ]; then
        echo "... compton.conf found"
    else
        cp "/usr/share/doc/compton/examples/compton.sample.conf" "$HOME/.config/compton.conf"
    fi
}



preparation
install_required_packages
create_config_files
