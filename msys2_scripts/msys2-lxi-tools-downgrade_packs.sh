if [ ! "$BASH_VERSION" ] ; then
    exec /usr/bin/bash "$0" "$@"
fi

if [[ ! "$(uname -s)" =~ ^MSYS_NT.* ]]; then
    echo "Not in MSYS"
    exit 1
fi


wget https://repo.msys2.org/mingw/ucrt64/mingw-w64-ucrt-x86_64-libadwaita-1.5.3-1-any.pkg.tar.zst
wget https://repo.msys2.org/mingw/ucrt64/mingw-w64-ucrt-x86_64-gtk4-4.14.5-1-any.pkg.tar.zst

pacman -U --noconfirm mingw-w64-ucrt-x86_64-libadwaita-1.5.3-1-any.pkg.tar.zst mingw-w64-ucrt-x86_64-gtk4-4.14.5-1-any.pkg.tar.zst