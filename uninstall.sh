#!/bin/bash

if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root"
   exit 1
fi

rm -r "/opt/IBJts"
rm "/usr/bin/ib-tws"
rm "/usr/share/applications/ib-tws.desktop"
