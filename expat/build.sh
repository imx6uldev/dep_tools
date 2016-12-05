#!/bin/bash

#Cd dbus-1.8.0
cd ./dbus-1.8.0

#Import cross compile tool
CROSS_COMPILE_ENVIRONMENT_HOME=/opt/fsl-imx-x11/3.14.52-1.1.0
source ${CROSS_COMPILE_ENVIRONMENT_HOME}/environment-setup-cortexa7hf-vfp-neon-poky-linux-gnueabi
#unset PKG_CONFIG_SYSROOT_DIR

#Build for imx6ul board
./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var  --host=arm-poky-linux-gnueabi
make
make install DESTDIR=${PWD}/imx6ul

#Build for crosscompile tool
make clean
make distclean
./configure --prefix=${CROSS_COMPILE_ENVIRONMENT_HOME}/sysroots/cortexa7hf-vfp-neon-poky-linux-gnueabi/usr \
--sysconfdir=${CROSS_COMPILE_ENVIRONMENT_HOME}/sysroots/cortexa7hf-vfp-neon-poky-linux-gnueabi/etc \
--localstatedir=${CROSS_COMPILE_ENVIRONMENT_HOME}/sysroots/cortexa7hf-vfp-neon-poky-linux-gnueabi/var --host=arm-poky-linux-gnueabi
make
make install

#Release
cd ..
mkdir -p release
mkdir -p release/usr
mkdir -p release/usr/lib
mkdir -p release/usr/libexec
mkdir -p release/usr/share

cp -R ./dbus-1.8.0/imx6ul/etc ./release
cp -R ./dbus-1.8.0/imx6ul/lib ./release
cp -R ./dbus-1.8.0/imx6ul/var ./release
cp -R ./dbus-1.8.0/imx6ul/usr/bin ./release/usr
cp -R ./dbus-1.8.0/imx6ul/usr/lib/*.so* ./release/usr/lib
cp -R ./dbus-1.8.0/imx6ul/usr/libexec/* ./release/usr/libexec
cp -R ./dbus-1.8.0/imx6ul/usr/share/dbus-1 ./release/usr/share

