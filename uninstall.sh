#!/bin/bash

# 2017 and later versions
rm -r ~/Jts
rm "~/Desktop/Trader Workstation *.desktop"
rm "~/.local/share/applications/Trader Workstation *.desktop"

# Old versions
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root"
   exit 1
fi

rm -r "/opt/IBJts"
rm "/usr/bin/ib-tws"
rm "/usr/share/applications/ib-tws.desktop"
