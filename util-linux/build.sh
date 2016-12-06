#!/bin/bash

#Cd util-linux-2.21.2
cd ./util-linux-2.21.2

#Import cross compile tool
CROSS_COMPILE_ENVIRONMENT_HOME=/opt/fsl-imx-x11/3.14.52-1.1.0
source ${CROSS_COMPILE_ENVIRONMENT_HOME}/environment-setup-cortexa7hf-vfp-neon-poky-linux-gnueabi

#Build libuuid
./configure --prefix=/usr --host=arm-poky-linux-gnueabi --without-ncurses
cd libuuid
make
make install DESTDIR=${PWD}/imx6ul
cd ..

make clean
./configure --prefix=${CROSS_COMPILE_ENVIRONMENT_HOME}/sysroots/cortexa7hf-vfp-neon-poky-linux-gnueabi/usr --host=arm-poky-linux-gnueabi --without-ncurses
cd libuuid
make
make install
cd ..

#Build libblkid
make clean
./configure --prefix=/usr --host=arm-poky-linux-gnueabi --without-ncurses
cd libblkid
make
make install DESTDIR=${PWD}/imx6ul
cd ..

make clean
./configure --prefix=${CROSS_COMPILE_ENVIRONMENT_HOME}/sysroots/cortexa7hf-vfp-neon-poky-linux-gnueabi/usr --host=arm-poky-linux-gnueabi --without-ncurses
cd libblkid
make
make install
cd ..

#Build libmount
make clean
./configure --prefix=/usr --host=arm-poky-linux-gnueabi --without-ncurses
cd libmount
make
make install DESTDIR=${PWD}/imx6ul
cd ..

make clean
./configure --prefix=${CROSS_COMPILE_ENVIRONMENT_HOME}/sysroots/cortexa7hf-vfp-neon-poky-linux-gnueabi/usr --host=arm-poky-linux-gnueabi --without-ncurses
cd libmount
make
make install
cd ..

#cd to origin path
cd ..

#Release
mkdir -p release/lib
mkdir -p release/usr/lib

cp -R ./util-linux-2.21.2/libuuid/imx6ul/lib/*.so* ./release/lib
cp -R ./util-linux-2.21.2/libuuid/imx6ul/usr/lib/*.so* ./release/usr/lib

cp -R ./util-linux-2.21.2/libblkid/imx6ul/lib/*.so* ./release/lib
cp -R ./util-linux-2.21.2/libblkid/imx6ul/usr/lib/*.so* ./release/usr/lib

cp -R ./util-linux-2.21.2/libmount/imx6ul/lib/*.so* ./release/lib
cp -R ./util-linux-2.21.2/libmount/imx6ul/usr/lib/*.so* ./release/usr/lib


