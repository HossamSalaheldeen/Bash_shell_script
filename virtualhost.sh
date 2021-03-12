#!/bin/bash
# Bash Script to Create and configure virtual host
#function to create virtualhost on apache2 webserver
function AddVirtualHost {
    #read website folder name form user
    read -p "Enter DocumentRoot: " DocumentRoot
    #read website server name form user
    read -p "Enter ServerName: " ServerName
    #check existence of folder of the website and Create it if not
    [ ! -d "/var/websites/${DocumentRoot}" ] && sudo mkdir /var/websites/${DocumentRoot}
    #give permissions for the directory
    sudo chmod -R 777 /var/websites
    sudo chmod -R 777 /var/websites/${DocumentRoot}
    #check existence of index file page and create it if not
    [ ! -f "/var/websites/${DocumentRoot}/index.html" ] && sudo touch /var/websites/${DocumentRoot}/index.html && sudo chmod 777 /var/websites/${DocumentRoot}/index.html && sudo echo "Create index file in /var/websites/${DocumentRoot}/index.html"
    #write welcome page to user
    sudo echo "<h1>welcome to ${ServerName} host</h1>" > /var/websites/${DocumentRoot}/index.html
    #check existence of config file and create it if not
    [ ! -f "/etc/apache2/sites-available/${DocumentRoot}.conf" ] && sudo touch /etc/apache2/sites-available/${DocumentRoot}.conf && sudo chmod 777 /etc/apache2/sites-available/${DocumentRoot}.conf && sudo echo "Create config file in  /etc/apache2/sites-available/${DocumentRoot}.conf"
    sudo chmod -R 777 /etc/apache2/sites-available
    #write configrations for virtualhost in .conf file
    sudo echo "<VirtualHost *:80>" > /etc/apache2/sites-available/${DocumentRoot}.conf
    sudo echo " DocumentRoot /var/websites/${DocumentRoot}" >> /etc/apache2/sites-available/${DocumentRoot}.conf
    sudo echo " ServerName ${ServerName}" >> /etc/apache2/sites-available/${DocumentRoot}.conf
    sudo echo "</VirtualHost>" >> /etc/apache2/sites-available/${DocumentRoot}.conf
    sudo echo "<Directory /var/websites/${DocumentRoot}>" >> /etc/apache2/sites-available/${DocumentRoot}.conf
    sudo echo " AllowOverride All" >> /etc/apache2/sites-available/${DocumentRoot}.conf
    sudo echo "</Directory>" >> /etc/apache2/sites-available/${DocumentRoot}.conf
    #show success messages to user
    echo "Create virtual host."
    echo "Servername : ${ServerName}"
    echo "DocumentRoot : /var/websites/${DocumentRoot}"  
}
#function to remove virtualhost from apache2 webserver
function deleteVirtualHost {
    #read website folder name form user
    read -p "Enter DocumentRoot: " DocumentRoot
    #command to remove website folder from server
    sudo rm -R /var/websites/${DocumentRoot}
    #command to remove config file from server
    sudo rm /etc/apache2/sites-available/${DocumentRoot}.conf
    #show success messages to user
    echo "delete virtual host."
    echo "Servername : ${ServerName}"
    echo "DocumentRoot : /var/websites/${DocumentRoot}"  
}

function enableVirtualHost {
    #read website folder name form user
    read -p "Enter DocumentRoot: " DocumentRoot
    #command to enable virtualhost
    sudo a2ensite ${DocumentRoot}
    #command to restart webserver service
    sudo service apache2 restart
    #show success messages to user
    echo "Enable virtual host."
}

function disableVirtualHost {
    #read website folder name form user
    read -p "Enter DocumentRoot: " DocumentRoot
    #command to disable virtualhost
    sudo a2dissite ${DocumentRoot}
    #command to restart webserver service
    sudo service apache2 restart
    #show success messages to user
    echo "Disable virtual host."
}