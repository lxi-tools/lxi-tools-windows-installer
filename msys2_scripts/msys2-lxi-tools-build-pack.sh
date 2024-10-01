if [ ! "$BASH_VERSION" ] ; then
    exec /usr/bin/bash "$0" "$@"
fi

if [[ ! "$(uname -s)" =~ ^MSYS_NT.* ]]; then
    echo "Not in MSYS"
    exit 1
fi

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

export REDISTRIBUTABLE_DIR=lxi-tools-redistributable


MSYS_SCRIPT="msys2_scripts/"

cd $SCRIPT_DIR/../$MSYS_SCRIPT && sh msys2-lxi-tools-compile.sh

cd $SCRIPT_DIR/../$MSYS_SCRIPT && sh msys2-lxi-tools-redistributable.sh

cd $SCRIPT_DIR/../$MSYS_SCRIPT && sh msys2-lxi-tools-create-exe.sh
