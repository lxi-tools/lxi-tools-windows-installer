if [ ! "$BASH_VERSION" ] ; then
    exec /usr/bin/bash "$0" "$@"
fi

if [[ ! "$(uname -s)" =~ ^MSYS_NT.* ]]; then
    echo "Not in MSYS"
    exit 1
fi

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

REDISTRIBUTABLE_DIR=lxi-tools-redistributable

LXI_TOOLS_APP_DATA=usr

echo "copy required files in folder $SCRIPT_DIR/../$REDISTRIBUTABLE_DIR"

# etc needs to be in app root, while bin, share and lib needs to be in level depper
mkdir -p $SCRIPT_DIR/../$REDISTRIBUTABLE_DIR/etc
mkdir -p $SCRIPT_DIR/../$REDISTRIBUTABLE_DIR/$LXI_TOOLS_APP_DATA
mkdir -p $SCRIPT_DIR/../$REDISTRIBUTABLE_DIR/$LXI_TOOLS_APP_DATA/bin
mkdir -p $SCRIPT_DIR/../$REDISTRIBUTABLE_DIR/$LXI_TOOLS_APP_DATA/lib
mkdir -p $SCRIPT_DIR/../$REDISTRIBUTABLE_DIR/$LXI_TOOLS_APP_DATA/share
mkdir -p $SCRIPT_DIR/../$REDISTRIBUTABLE_DIR/$LXI_TOOLS_APP_DATA/share/icons
mkdir -p $SCRIPT_DIR/../$REDISTRIBUTABLE_DIR/$LXI_TOOLS_APP_DATA/share/glib-2.0/schemas

cp /etc/netconfig $SCRIPT_DIR/../$REDISTRIBUTABLE_DIR/etc
cp $SCRIPT_DIR/../lxi-tools/build/src/lxi*.exe $SCRIPT_DIR/../$REDISTRIBUTABLE_DIR/$LXI_TOOLS_APP_DATA/bin/
cp $SCRIPT_DIR/../lxi-tools/LICENSE $SCRIPT_DIR/../$REDISTRIBUTABLE_DIR/
cp -r $SCRIPT_DIR/../lxi-tools/examples $SCRIPT_DIR/../$REDISTRIBUTABLE_DIR/
cp -r /ucrt64/lib/gdk-pixbuf-2.0 $SCRIPT_DIR/../$REDISTRIBUTABLE_DIR/$LXI_TOOLS_APP_DATA/lib/gdk-pixbuf-2.0/
cp -r /ucrt64/share/icons/* $SCRIPT_DIR/../$REDISTRIBUTABLE_DIR/$LXI_TOOLS_APP_DATA/share/icons/
cp -r /ucrt64/share/gtksourceview-5 $SCRIPT_DIR/../$REDISTRIBUTABLE_DIR/$LXI_TOOLS_APP_DATA/share/
cp $SCRIPT_DIR/..//lxi-tools/src/language-specs/lua-lxi-gui.lang $SCRIPT_DIR/../$REDISTRIBUTABLE_DIR/$LXI_TOOLS_APP_DATA/share/gtksourceview-5/language-specs/
cp /ucrt64/share/glib-2.0/schemas/* $SCRIPT_DIR/../$REDISTRIBUTABLE_DIR/$LXI_TOOLS_APP_DATA/share/glib-2.0/schemas/
cp $SCRIPT_DIR/../lxi-tools/data/io.github.lxi-tools.lxi-gui.gschema.xml $SCRIPT_DIR/../$REDISTRIBUTABLE_DIR/$LXI_TOOLS_APP_DATA/share/glib-2.0/schemas/
cp -r $SCRIPT_DIR/../lxi-tools/data/icons/hicolor $SCRIPT_DIR/../$REDISTRIBUTABLE_DIR/$LXI_TOOLS_APP_DATA/share/icons/

 /ucrt64/bin/glib-compile-schemas $SCRIPT_DIR/../$REDISTRIBUTABLE_DIR/$LXI_TOOLS_APP_DATA/share/glib-2.0/schemas/

cp /usr/bin/msys-2.0.dll $SCRIPT_DIR/../$REDISTRIBUTABLE_DIR/$LXI_TOOLS_APP_DATA/bin/
cp /usr/bin/msys-asn1-8.dll $SCRIPT_DIR/../$REDISTRIBUTABLE_DIR/$LXI_TOOLS_APP_DATA/bin/
cp /usr/bin/msys-com_err-1.dll $SCRIPT_DIR/../$REDISTRIBUTABLE_DIR/$LXI_TOOLS_APP_DATA/bin/
cp /usr/bin/msys-crypt-2.dll $SCRIPT_DIR/../$REDISTRIBUTABLE_DIR/$LXI_TOOLS_APP_DATA/bin/
cp /usr/bin/msys-crypto-3.dll $SCRIPT_DIR/../$REDISTRIBUTABLE_DIR/$LXI_TOOLS_APP_DATA/bin/
cp /usr/bin/msys-gcc_s-seh-1.dll $SCRIPT_DIR/../$REDISTRIBUTABLE_DIR/$LXI_TOOLS_APP_DATA/bin/
cp /usr/bin/msys-gssapi-3.dll $SCRIPT_DIR/../$REDISTRIBUTABLE_DIR/$LXI_TOOLS_APP_DATA/bin/
cp /usr/bin/msys-hcrypto-4.dll $SCRIPT_DIR/../$REDISTRIBUTABLE_DIR/$LXI_TOOLS_APP_DATA/bin/
cp /usr/bin/msys-heimbase-1.dll $SCRIPT_DIR/../$REDISTRIBUTABLE_DIR/$LXI_TOOLS_APP_DATA/bin/
cp /usr/bin/msys-heimntlm-0.dll $SCRIPT_DIR/../$REDISTRIBUTABLE_DIR/$LXI_TOOLS_APP_DATA/bin/
cp /usr/bin/msys-hx509-5.dll $SCRIPT_DIR/../$REDISTRIBUTABLE_DIR/$LXI_TOOLS_APP_DATA/bin/
cp /usr/bin/msys-iconv-2.dll $SCRIPT_DIR/../$REDISTRIBUTABLE_DIR/$LXI_TOOLS_APP_DATA/bin/
cp /usr/bin/msys-krb5-26.dll $SCRIPT_DIR/../$REDISTRIBUTABLE_DIR/$LXI_TOOLS_APP_DATA/bin/

cp /usr/local/bin/msys-lxi-1.dll $SCRIPT_DIR/../$REDISTRIBUTABLE_DIR/$LXI_TOOLS_APP_DATA/bin/
cp /usr/bin/msys-ncursesw6.dll $SCRIPT_DIR/../$REDISTRIBUTABLE_DIR/$LXI_TOOLS_APP_DATA/bin/
cp /usr/bin/msys-readline8.dll $SCRIPT_DIR/../$REDISTRIBUTABLE_DIR/$LXI_TOOLS_APP_DATA/bin/
cp /usr/bin/msys-roken-18.dll $SCRIPT_DIR/../$REDISTRIBUTABLE_DIR/$LXI_TOOLS_APP_DATA/bin/
cp /usr/bin/msys-sqlite3-0.dll $SCRIPT_DIR/../$REDISTRIBUTABLE_DIR/$LXI_TOOLS_APP_DATA/bin/
cp /usr/bin/msys-tirpc-3.dll $SCRIPT_DIR/../$REDISTRIBUTABLE_DIR/$LXI_TOOLS_APP_DATA/bin/
cp /usr/bin/msys-wind-0.dll $SCRIPT_DIR/../$REDISTRIBUTABLE_DIR/$LXI_TOOLS_APP_DATA/bin/
cp /usr/bin/msys-xml2-2.dll $SCRIPT_DIR/../$REDISTRIBUTABLE_DIR/$LXI_TOOLS_APP_DATA/bin/

cp /ucrt64/bin/*.dll $SCRIPT_DIR/../$REDISTRIBUTABLE_DIR/$LXI_TOOLS_APP_DATA/bin/
cp /ucrt64/bin/lua54.dll $SCRIPT_DIR/../$REDISTRIBUTABLE_DIR/$LXI_TOOLS_APP_DATA/bin/
cp /ucrt64//bin/zlib1.dll $SCRIPT_DIR/../$REDISTRIBUTABLE_DIR/$LXI_TOOLS_APP_DATA/bin/
cp /ucrt64//bin/gdbus.exe $SCRIPT_DIR/../$REDISTRIBUTABLE_DIR/$LXI_TOOLS_APP_DATA/bin/

cp /usr/local/bin/msys-lxi-1.dll $SCRIPT_DIR/../$REDISTRIBUTABLE_DIR/$LXI_TOOLS_APP_DATA/bin/