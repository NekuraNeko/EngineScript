#!/usr/bin/env bash
#----------------------------------------------------------------------------
# EngineScript - A High-Performance WordPress Server Built on Ubuntu and Cloudflare
#----------------------------------------------------------------------------
# Website:      https://EngineScript.com
# GitHub:       https://github.com/Enginescript/EngineScript
# Company:      VisiStruct / EngineScript
# License:      GPL v3.0
# OS:           Ubuntu 22.04 (jammy)
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
    echo -e "Server Tools" | boxes -a c -d shell -p a1l2
    echo ""
    echo ""
    PS3='Please enter your choice: '
    secoptions=("Backup All Domains" "Clear All Caches" "Dispay Server Info" "Fix Permissions" "Optimize All Images" "Testssl.sh" "Exit Server Tools")
    select secopt in "${secoptions[@]}"
    do
      case $secopt in
        "Backup All Domains")
          /usr/local/bin/enginescript/scripts/functions/alias/alias-backup.sh
          break
          ;;
        "Clear All Caches")
          /usr/local/bin/enginescript/scripts/functions/alias/alias-cache.sh
          break
          ;;
        "Dispay Server Info")
          /usr/local/bin/enginescript/scripts/functions/alias/alias-server-info.sh
          break
          ;;
        "Fix Permissions")
          /usr/local/bin/enginescript/scripts/functions/cron/permissions.sh
          break
          ;;
        "Optimize All Images")
          /usr/local/bin/enginescript/scripts/functions/cron/optimize-images.sh
          break
          ;;
        "Testssl.sh")
          /usr/local/bin/enginescript/scripts/functions/server-tools/testssl.sh
          break
          ;;
        "Exit Server Tools")
          exit
          ;;
        *) echo invalid option;;
      esac
    done
  done
