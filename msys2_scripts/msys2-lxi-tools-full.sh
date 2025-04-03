if [ ! "$BASH_VERSION" ] ; then
    exec /usr/bin/bash "$0" "$@"
fi

if [[ ! "$(uname -s)" =~ ^MSYS_NT.* ]]; then
    echo "Not in MSYS"
    exit 1
fi

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

MSYS_SCRIPT="msys2_scripts/"

cd $SCRIPT_DIR/../$MSYS_SCRIPT && sh msys2-lxi-tools-pacman.sh


cd $SCRIPT_DIR/../$MSYS_SCRIPT && sh msys2-lxi-tools-build-pack.sh
