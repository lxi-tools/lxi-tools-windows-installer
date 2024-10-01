if [ ! "$BASH_VERSION" ] ; then
    exec /usr/bin/bash "$0" "$@"
fi

if [[ ! "$(uname -s)" =~ ^MSYS_NT.* ]]; then
    echo "Not in MSYS"
    exit 1
fi


pacman -Sy

pacman -S --noconfirm git meson cmake gcc libxml2-devel libtirpc-devel\
 glib2-devel  mingw-w64-ucrt-x86_64-angleproject mingw-w64-ucrt-x86_64-glib2 \
 mingw-w64-ucrt-x86_64-lua mingw-w64-ucrt-x86_64-gtk4 mingw-w64-ucrt-x86_64-gtksourceview5 \
 mingw-w64-ucrt-x86_64-libadwaita mingw-w64-ucrt-x86_64-jp2-pixbuf-loader \
 mingw-w64-ucrt-x86_64-webp-pixbuf-loader patch curl libcurl-devel \
 mingw-w64-ucrt-x86_64-nsis mingw-w64-ucrt-x86_64-nsis-nsisunz mingw-w64-ucrt-x86_64-jq