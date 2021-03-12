#!/bin/bash
# Bash Script to install and remove apache2 web server
#function to install apache2 web serever
function installWebServer {
    sudo apt update
    sudo apt install apache2
    sudo service apache2 start
    echo "apache2 installed successfully , apache2 is running now"
}
#function to uninstall apache2 web serever
function removeWebServer {
    sudo apt-get purge apache2
    sudo apt-get autoremove
    echo "apache2 and its config files removed successfully"
}
