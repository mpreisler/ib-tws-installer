#!/bin/bash

# if true we will install latest instead of stable, see IB website
LATEST=false
# if true we will remove pre-existing IBJts in /opt
REPLACE_IF_EXISTS=true

if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root"
   exit 1
fi

which java || exit 1
which jar || exit 1

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
TMPDIR=`mktemp -d`

pushd "$TMPDIR"

if $LATEST; then
    wget -O unixmacosx.jar https://download2.interactivebrokers.com/download/unixmacosx_latest.jar
else
    wget -O unixmacosx.jar https://download2.interactivebrokers.com/download/unixmacosx.jar
fi

jar xf unixmacosx.jar

if $REPLACE_IF_EXISTS; then
    rm -rf "/opt/IBJts"
fi

mv IBJts /opt/

cp "$DIR/ib-tws" /usr/bin/
desktop-file-install "$DIR/ib-tws.desktop"

popd

rm -r "$TMPDIR"
