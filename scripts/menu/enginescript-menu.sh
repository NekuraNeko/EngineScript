#!/usr/bin/env bash
#----------------------------------------------------------------------------
# EngineScript - High-Performance WordPress LEMP Server
#----------------------------------------------------------------------------
# Website:      https://EngineScript.com
# GitHub:       https://github.com/Enginescript/EngineScript
# Company:      VisiStruct / EngineScript
# License:      GPL v3.0
# OS:           Ubuntu 20.04 (focal)
#----------------------------------------------------------------------------

# EngineScript Variables
source /usr/local/bin/enginescript/enginescript-variables.txt
source /home/EngineScript/enginescript-install-options.txt

# Check current user's ID. If user is not 0 (root), exit.
if [ "${EUID}" != 0 ];
  then
    echo "${BOLD}ALERT:${NORMAL}"
    echo "EngineScript should be executed as the root user."
    exit
fi

#----------------------------------------------------------------------------
# Start Main Script

# Main Menu
while true
  do
    clear

    echo ""
    echo "==============================================================="
    echo "EngineScript - Advanced WordPress LEMP Server Installation"
    echo "==============================================================="
    echo ""
    echo "Admin Control Panels:"
    echo "Webmin - https://${IP_ADDRESS}:32792"
    echo "PHPSysInfo - https://${IP_ADDRESS}/enginescript/phpsysinfo"
    echo "PHPInfo - https://${IP_ADDRESS}/enginescript/phpinfo"
    echo "Adminer - https://${IP_ADDRESS}/enginescript/adminer"
    echo "PHPMyAdmin - https://${IP_ADDRESS}/enginescript/phpmyadmin"
    echo "Helpful Commands:"
    echo ""
    echo "es.menu - open EngineScript menu"
    echo "es.restart - Restart Nginx and PHP-FPM"
    echo "es.update - update and upgrade your server using APT"
    echo ""
    echo "---------------------------------------------------------------"
    echo ""
    echo "What would you like to do?"
    echo ""

    PS3='Please enter your choice: '
    options=("Configure New Domain" "Update EngineScript" "Security Scanners" "Change EngineScript Install Options" "Update Existing Domain Vhost File" "Update Nginx" "Update PHP" "Update MariaDB" "Update Server Management Tools" "Exit EngineScript")
    select opt in "${options[@]}"
    do
      case $opt in
        "Configure New Domain")
          /usr/local/bin/enginescript/scripts/install/vhost/vhost-install.sh
          break
          ;;
        "Update EngineScript")
          /usr/local/bin/enginescript/scripts/update/enginescript-update.sh
          break
          ;;
        "Security Scanners")
          /usr/local/bin/enginescript/scripts/menu/security-tools-menu.sh
          break
          ;;
        "Change EngineScript Install Options")
          nano /home/enginescript-install-options.txt
          sleep 3
          break
          ;;
        "Update Existing Domain Vhost File")
          echo "Option coming soon"
          sleep 3
          break
          ;;
        "Update Nginx")
          /usr/local/bin/enginescript/scripts/update/nginx-update.sh
          sleep 3
          break
          ;;
        "Update PHP")
          echo "Option coming soon"
          sleep 3
          break
          ;;
        "Update MariaDB")
          echo "Option coming soon"
          sleep 3
          break
          ;;
        "Update Server Management Tools")
          echo "Option coming soon"
          sleep 3
          break
          ;;
        "Change EngineScript Software Versions")
          nano /usr/local/bin/enginescript/enginescript-variables.txt
          sleep 3
          break
          ;;
        "Exit EngineScript")
          exit
          ;;
        *) echo invalid option;;
      esac
    done
  done