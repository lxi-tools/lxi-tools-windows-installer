if [ ! "$BASH_VERSION" ] ; then
    exec /usr/bin/bash "$0" "$@"
fi

DOCKER_IMAGE=ghcr.io/msys2/msys2-docker-experimental
DOCKER_TAG=latest

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
DOCKER_LXI_TOOLS_DIR="/root/.wine/drive_c/msys64/home/root/lxi-tools-win64"

TOP_DIR=$(readlink -f "$SCRIPT_DIR/../")
echo $TOP_DIR

COMMAND=${1:-"cd lxi-tools-win64 && sh msys2_scripts/msys2-lxi-tools-full.sh"}

COMMAND_USER_ADD="groupadd $USER && useradd -g $USER $USER"
echo COMMAND_USER_ADD $COMMAND_USER_ADD

if ! docker pull $DOCKER_IMAGE:$DOCKER_TAG ; then
    echo "Docker Fail to pull $DOCKER_IMAGE:$DOCKER_TAG"
    exit -1
fi


docker run --rm -v "$TOP_DIR":$DOCKER_LXI_TOOLS_DIR\
    -eMSYSTEM=MSYS $DOCKER_IMAGE:$DOCKER_TAG \
    msys2 -c "$COMMAND"

#fix root permisions of output files
docker run --rm -v "$TOP_DIR":$DOCKER_LXI_TOOLS_DIR \
     $DOCKER_IMAGE:$DOCKER_TAG \
     su -c "$COMMAND_USER_ADD &&  cd /root/.wine/drive_c/msys64/home/root/lxi-tools-win64 && \
     chown -R $USER:$USER lxi-tools/build lxi-tools-redistributable liblxi/build && exit 0"

