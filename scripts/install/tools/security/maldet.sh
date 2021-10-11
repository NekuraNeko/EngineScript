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

# Maldet Install
cd /usr/local/src
wget http://www.rfxn.com/downloads/maldetect-current.tar.gz
tar -xvf maldetect-current.tar.gz
cd maldetect-1.6.4/
./install.sh
echo "/sys" >> /usr/local/maldetect/ignore_paths

echo ""
echo ""
echo "============================================================="
echo ""
echo "${BOLD}ClamAV Anti-Virus installed.${NORMAL}"
echo ""
echo "Use command ${BOLD}es.virus${NORMAL} to scan your /var/www/sites directory"
echo ""
echo "============================================================="
echo ""
echo ""

sleep 5