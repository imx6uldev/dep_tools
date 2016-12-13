#!/bin/bash

#Build
cd readline-6.3

CROSS_COMPILE_ENVIRONMENT_HOME=/opt/fsl-imx-x11/3.14.52-1.1.0
source ${CROSS_COMPILE_ENVIRONMENT_HOME}/environment-setup-cortexa7hf-vfp-neon-poky-linux-gnueabi

#Build for imx6ul board
unset PKG_CONFIG_SYSROOT_DIR
./configure --prefix=/usr --host=arm-poky-linux-gnueabi bash_cv_wcwidth_broken=yes
make SHLIB_LIBS=-lncurses
make install DESTDIR=${PWD}/imx6ul

#Build for crosscompile tool
make clean
./configure --prefix=${CROSS_COMPILE_ENVIRONMENT_HOME}/sysroots/cortexa7hf-vfp-neon-poky-linux-gnueabi/usr --host=arm-poky-linux-gnueabi bash_cv_wcwidth_broken=yes
make SHLIB_LIBS=-lncurses
make install

chmod 755 -R ./imx6ul

cd ..

#Release
mkdir -p release
mkdir -p release/usr/lib

cp -R ./readline-6.3/imx6ul/usr/lib/*.so* ./release/usr/lib
