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

    sudo apt-get update
    sudo apt-get dist-upgrade -y
    sudo apt-get install git
    git clone https://github.com/arrdguez/config-files
    cd config-files
    rm $HOME/.bashrc
    cp bashrc $HOME/
    mv $HOME/bashrc $HOME/.bashrc
    source $HOME/.bashrc
    cp ./sink-switch.sh /usr/bin/
    ls -la

}

function install_buttercup(){
    echo '... installing ButterCup'
    wget https://github.com/buttercup/buttercup-desktop/releases/download/v2.18.0/Buttercup-linux-x86_64.AppImage
}

function install_required_packages() {
    echo "Installing required packages ..."
    # Refresh apt
    sudo apt-get install polybar unzip compton nitrogen conky rofi arandr feh watch git lxappearance speedtest-cli i3 i3-wm catfish curl htop terminator x11-xserver-utils binutils
    #libxcb-composite0-dev libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf xutils-dev dh-autoreconf x11-xserver-utils binutils gcc make pkg-config fakeroot cmake python-xcbgen xcb-proto libxcb-ewmh-dev wireless-tools libiw-dev libasound2-dev libpulse-dev libcurl4-openssl-dev libmpdclient-dev pavucontrol rxvt
}

function get_config_repo() {
    pwd
}


function create_config_files() {
    echo "Creating the config file..."
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
    if [-e "$HOME"/.fonts/ ]; then
        echo "... .fonts found."
    else
        mkdir "$HOME"/.fonts
    fi
    if [ -e "$HOME"/.config/polybar/config ]; then
        echo "... polybar/config found."
    else
        cp -r ./polybar "$HOME"/.config/
    fi
    if [ -e "$HOME"/.config/i3/config ]; then
        echo "... i3/config found."
    else
        mkdir "$HOME"/.config/i3
        cp -r ./i3 "$HOME/.config/"
    fi
    # Compton config file doesn't come by default
    if [ -e "$HOME"/.config/compton/compton.conf ]; then
        echo "... compton.conf found"
    else
        mkdir "$HOME"/.config/compton
        cp -r ./compton "$HOME/.config/"
    fi
    # Conky config file doesn't come by default
    if [ -e "$HOME"/.config/conky/conky.conf ]; then
        echo "... conky.conf found"
    else
        mkdir "$HOME"/.config/conky
        cp -r ./conky "$HOME/.config/"
    fi
}

function brave() {
    echo "Installing brave ..."
    sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
    sudo apt update
    sudo apt install brave-browser
}

preparation
install_required_packages
get_config_repo
create_config_files
brave
