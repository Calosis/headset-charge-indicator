#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

SCRIPT_DIR=`dirname "$(readlink -f "$BASH_SOURCE")"`
INDICATOR_APP_PATH="/usr/local/bin/headset-charge-indicator.py"

echo "Moving script to /usr/local/bin"
cd ${SCRIPT_DIR}
cp "headset-charge-indicator.py" /usr/local/bin/

echo "Creating autostart."

cat > headset-charge-indicator.desktop <<EOF
[Desktop Entry]
Name=Wireless headset app-indicator
Type=Application
Exec=${INDICATOR_APP_PATH}
X-GNOME-Autostart-enabled=true
EOF


chmod 777 headset-charge-indicator.desktop
mv headset-charge-indicator.desktop /home/$SUDO_USER/.config/autostart



