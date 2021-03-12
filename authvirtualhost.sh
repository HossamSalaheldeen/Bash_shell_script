#!/bin/bash
# Bash Script for adjust authentication for virtualhost

#function to enable authentication for local host
function enableAuth {
    #read website folder name form user
    read -p "Enter DocumentRoot: " DocumentRoot
    #check existence of .htaccess file and if not Create it
    [ ! -f "/var/websites/${DocumentRoot}/.htaccess" ] && sudo touch /var/websites/${DocumentRoot}/.htaccess && sudo chmod 777 /var/websites/${DocumentRoot}/.htaccess && sudo echo "Create index file in /var/websites/${DocumentRoot}/.htaccess"
    #write Basic authentication in .htaccess file
    sudo echo "AuthType Basic" > /var/websites/${DocumentRoot}/.htaccess
    sudo echo "AuthName 'Private area'" >> /var/websites/${DocumentRoot}/.htaccess
    sudo echo "AuthUserFile /var/websites/${DocumentRoot}/.htpasswd" >> /var/websites/${DocumentRoot}/.htaccess
    sudo echo "Require valid-user" >> /var/websites/${DocumentRoot}/.htaccess
    #read username form user
    read -p "Enter UserName: " UserName
    sudo htpasswd -c /var/websites/${DocumentRoot}/.htpasswd ${UserName}
    #show enable success message to user
    echo "Enable virtual host auth"
}

#function to disable authentication for local host
function disableAuth {
    #read website folder name form user
    read -p "Enter DocumentRoot: " DocumentRoot
    #check existence of .htaccess file and if not Create it
    [ ! -f "/var/websites/${DocumentRoot}/.htaccess" ] && sudo touch /var/websites/${DocumentRoot}/.htaccess && sudo chmod 777 /var/websites/${DocumentRoot}/.htaccess && sudo echo "Create index file in /var/websites/${DocumentRoot}/.htaccess"
    #write directive to give all permission for any user in .htaccess file
    sudo echo "Require all granted" >> /var/websites/${DocumentRoot}/.htaccess
     #show disable success message to user
    echo "Disable virtual host auth"
}
