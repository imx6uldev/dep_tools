#!/bin/bash

#Cd libusb-0.1.12
cd ./libusb-0.1.12

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

cp ./libusb-0.1.12/imx6ul/usr/bin/* ./release/usr/bin
cp ./libusb-0.1.12/imx6ul/usr/lib/*.so* ./release/usr/lib




