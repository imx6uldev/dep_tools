#!/bin/bash

#Build
cd libical-1.0

CROSS_COMPILE_ENVIRONMENT_HOME=/opt/fsl-imx-x11/3.14.52-1.1.0
source ${CROSS_COMPILE_ENVIRONMENT_HOME}/environment-setup-cortexa7hf-vfp-neon-poky-linux-gnueabi

#Build for imx6ul board
#make sure you have cmake installed
cmake -DCMAKE_INSTALL_PREFIX=/usr
make
make install DESTDIR=${PWD}/imx6ul

#Build for crosscompile tool
cmake -DCMAKE_INSTALL_PREFIX=${CROSS_COMPILE_ENVIRONMENT_HOME}/sysroots/cortexa7hf-vfp-neon-poky-linux-gnueabi/usr
make
make install

cd ..

#Release
mkdir -p release/usr/lib

cp -R ./libical-1.0/imx6ul/usr/lib/*.so* ./release/usr/lib