#!/bin/bash

#Build
cd ./zlib-1.2.8

CROSS_COMPILE_ENVIRONMENT_HOME=/opt/fsl-imx-x11/3.14.52-1.1.0
source ${CROSS_COMPILE_ENVIRONMENT_HOME}/environment-setup-cortexa7hf-vfp-neon-poky-linux-gnueabi

#Build for imx6ul board
./configure --prefix=/usr --shared
make
make install DESTDIR=${PWD}/imx6ul

#Build for crosscompile tool
make clean
make distclean
./configure --prefix=${CROSS_COMPILE_ENVIRONMENT_HOME}/sysroots/cortexa7hf-vfp-neon-poky-linux-gnueabi/usr --shared
make
make install

cd -

#Release
mkdir -p release
mkdir -p release/usr
mkdir -p release/usr/lib
mkdir -p release/usr/share

cp -R ./zlib-1.2.8/imx6ul/usr/lib/*.so* ./release/usr/lib
