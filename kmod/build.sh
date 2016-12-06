#!/bin/bash

#Cd kmod-23
cd ./kmod-23

#Import cross compile tool
CROSS_COMPILE_ENVIRONMENT_HOME=/opt/fsl-imx-x11/3.14.52-1.1.0
source ${CROSS_COMPILE_ENVIRONMENT_HOME}/environment-setup-cortexa7hf-vfp-neon-poky-linux-gnueabi
./configure --prefix=/usr --host=arm-poky-linux-gnueabi
make
make install DESTDIR=${PWD}/imx6ul


make clean
make distclean
./configure --prefix=${CROSS_COMPILE_ENVIRONMENT_HOME}/sysroots/cortexa7hf-vfp-neon-poky-linux-gnueabi/usr --host=arm-poky-linux-gnueabi
make
make install

#Cd to origin path
cd ..

#Release
mkdir -p release/usr/bin
mkdir -p release/usr/lib

cp -R ./kmod-23/imx6ul/usr/bin/* ./release/usr/bin
cp -R ./kmod-23/imx6ul/usr/lib/*.so* ./release/usr/lib


