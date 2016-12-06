#!/bin/bash

#Build
cd glib-2.46.2

CROSS_COMPILE_ENVIRONMENT_HOME=/opt/fsl-imx-x11/3.14.52-1.1.0
source ${CROSS_COMPILE_ENVIRONMENT_HOME}/environment-setup-cortexa7hf-vfp-neon-poky-linux-gnueabi

#Build for imx6ul board
unset PKG_CONFIG_SYSROOT_DIR
./configure --prefix=/usr --host=arm-poky-linux-gnueabi
make
make install DESTDIR=${PWD}/imx6ul

#Build for crosscompile tool
./configure --prefix=${CROSS_COMPILE_ENVIRONMENT_HOME}/sysroots/cortexa7hf-vfp-neon-poky-linux-gnueabi/usr --host=arm-poky-linux-gnueabi
make
make install

cd -

#Release
mkdir -p release
mkdir -p release/usr/bin
mkdir -p release/usr/lib
mkdir -p release/usr/share

cp -R ./glib-2.46.2/imx6ul/usr/bin/* ./release/usr/bin
cp -R ./glib-2.46.2/imx6ul/usr/lib/*.so* ./release/usr/lib
cp -R ./glib-2.46.2/imx6ul/usr/share/* ./release/usr/share