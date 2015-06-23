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

pushd "$TMPDIR" > /dev/null

if $LATEST; then
    echo "Downloading the latest testing version..."
    wget --no-verbose -O unixmacosx.jar https://download2.interactivebrokers.com/download/unixmacosx_latest.jar
else
    echo "Downloading the latest stable version..."
    wget --no-verbose -O unixmacosx.jar https://download2.interactivebrokers.com/download/unixmacosx.jar
fi

echo "Extracting unixmacosx.jar..."
jar xf unixmacosx.jar

if $REPLACE_IF_EXISTS; then
    echo "Removing previous version at /opt/IBJts..."
    rm -rf "/opt/IBJts"
fi

echo "Installing to /opt/IBJts..."
mv IBJts /opt/

echo "Copying ib-tws wrapper to /usr/bin..."
cp "$DIR/ib-tws" /usr/bin/
echo "Installing the desktop file..."
desktop-file-install "$DIR/ib-tws.desktop"

popd > /dev/null

rm -r "$TMPDIR"
