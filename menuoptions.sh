#!/bin/bash
# Bash Script to generate menu options
#function to Create menu and give options for user to choice form them
function menu {
    PS3='Please enter your choice: '
    options=("Install web server" "Remove web server" "Add virtualhost" "Delete virtualhost"
    "Enable virtualhost" "Disable virtualhost" "Enable virtualhost auth" "Disable virtualhost auth" "Quit")
    select opt in "${options[@]}"
    do
        case $opt in
            "Install web server")
                echo "Install web server"
                installWebServer
                ;;
            "Remove web server")
                echo "Remove web server"
                removeWebServer
                ;;
            "Add virtualhost")
                echo "Add virtualhost"
                AddVirtualHost
                enableVirtualHost
                ;;
            "Delete virtualhost")
                echo "Delete virtualhost"
                disableVirtualHost
                deleteVirtualHost
                ;;
            "Enable virtualhost")
                echo "Enable virtualhost"
                enableVirtualHost
                ;;
            "Disable virtualhost")
                echo "Disable virtualhost"
                disableVirtualHost
                ;;
            "Enable virtualhost auth")
                echo "Enable virtualhost auth"
                enableAuth
                ;;
            "Disable virtualhost auth")
                echo "Disable virtualhost auth"
                disableAuth
                ;;
            "Quit")
                break
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}
