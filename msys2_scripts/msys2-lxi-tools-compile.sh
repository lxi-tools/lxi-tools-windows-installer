if [ ! "$BASH_VERSION" ] ; then
    exec /usr/bin/bash "$0" "$@"
fi

if [[ ! "$(uname -s)" =~ ^MSYS_NT.* ]]; then
    echo "Not in MSYS"
    exit 1
fi

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

pacman -S --noconfirm mingw-w64-ucrt-x86_64-imagemagick


#fix /ucrt/bin/glib-compile-resources compile failure inside wine docker
if [ -f "/z/.dockerenv" ]; then
    echo "run inside docker with wine, fix msys2 /ucrt64/bin/glib-compile-resources"
    rm /ucrt64/bin/glib-compile-resources
    ln -s /usr/bin/glib-compile-resources /ucrt64/bin/glib-compile-resources
fi


LIBLXI_DIR=liblxi
LXI_TOOLS_DIR=lxi-tools


cd $SCRIPT_DIR/../$LIBLXI_DIR && meson setup build

cd $SCRIPT_DIR/../$LIBLXI_DIR && meson compile -j 1 -C build

cd $SCRIPT_DIR/../$LIBLXI_DIR && meson install -C build


export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:/ucrt64/lib/pkgconfig:$PKG_CONFIG_PATH

cd $SCRIPT_DIR/../$LXI_TOOLS_DIR && meson setup build

cd $SCRIPT_DIR/../$LXI_TOOLS_DIR && meson compile -j 1 -C build


#restore /ucrt/bin/glib-compile-resources
if [ -f "/z/.dockerenv" ]; then
    echo "restore glib-compile-resources"
    rm /ucrt64/bin/glib-compile-resources
    pacman -S --noconfirm mingw-w64-ucrt-x86_64-glib2
fi

 #free space for note neededlib/*dll files
 pacman -Rsc --noconfirm mingw-w64-ucrt-x86_64-imagemagick
