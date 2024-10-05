if [ ! "$BASH_VERSION" ] ; then
    exec /usr/bin/bash "$0" "$@"
fi

if [[ ! "$(uname -s)" =~ ^MSYS_NT.* ]]; then
    echo "Not in MSYS"
    exit 1
fi

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

REDISTRIBUTABLE_DIR=lxi-tools-redistributable

export APP_DATA=usr

export BUILD_VERSION=$(shell $SCRIPT_DIR/../$REDISTRIBUTABLE_DIR/AppData/bin/lxi -v | sed 's/[^0-9.]*\([0-9.]*\).*/\1/')
echo VERSION $BUILD_VERSION

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

echo "create lxi-tools exe file"

cd $SCRIPT_DIR/../ && /ucrt64/bin/makensis msys2_scripts/nsis_lxi-toolst.nsi

#mv $SCRIPT_DIR/lxi-tools-$BUILD_VERSION.exe $SCRIPT_DIR/../$REDISTRIBUTABLE_DIR
#mv $SCRIPT_DIR/lxi-tools-$BUILD_VERSION.exe $SCRIPT_DIR/../$REDISTRIBUTABLE_DIR/lxi-tools.exe
mv $SCRIPT_DIR/lxi-tools-$BUILD_VERSION.exe $SCRIPT_DIR/../lxi-tools.exe

echo $BUILD_VERSION > release_tag.txt