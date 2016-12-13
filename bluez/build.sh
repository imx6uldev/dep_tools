#!/bin/bash

#Build
cd bluez-5.40/source

CROSS_COMPILE_ENVIRONMENT_HOME=/opt/fsl-imx-x11/3.14.52-1.1.0
source ${CROSS_COMPILE_ENVIRONMENT_HOME}/environment-setup-cortexa7hf-vfp-neon-poky-linux-gnueabi

#Build for imx6ul board
unset PKG_CONFIG_SYSROOT_DIR
sed -i "s/sysconfdir=\/opt\/fsl-imx-x11\/3.14.52-1.1.0\/sysroots\/cortexa7hf-vfp-neon-poky-linux-gnueabi\/etc/sysconfdir=\/etc/g" ${CROSS_COMPILE_ENVIRONMENT_HOME}/sysroots/cortexa7hf-vfp-neon-poky-linux-gnueabi/usr/lib/pkgconfig/dbus-1.pc
#echo "sysconfdir=${CROSS_COMPILE_ENVIRONMENT_HOME}/sysroots/cortexa7hf-vfp-neon-poky-linux-gnueabi/etc" >> ${CROSS_COMPILE_ENVIRONMENT_HOME}/sysroots/cortexa7hf-vfp-neon-poky-linux-gnueabi/usr/lib/pkgconfig/dbus-1.pc
./configure --host=arm-poky-linux-gnueabi --prefix=/usr  --sysconfdir=/etc --disable-systemd --disable-udev --disable-cups --enable-library
#./configure --host=arm-poky-linux-gnueabi --datarootdir=/usr/share --includedir=/usr/include --exec-prefix=/usr  --prefix=  --disable-systemd --disable-udev --disable-cups --enable-library
make
make install DESTDIR=${PWD}/imx6ul

sed -i "s/sysconfdir=\/etc/sysconfdir=\/opt\/fsl-imx-x11\/3.14.52-1.1.0\/sysroots\/cortexa7hf-vfp-neon-poky-linux-gnueabi\/etc/g" ${CROSS_COMPILE_ENVIRONMENT_HOME}/sysroots/cortexa7hf-vfp-neon-poky-linux-gnueabi/usr/lib/pkgconfig/dbus-1.pc



cd ../..

#Release
mkdir -p release
mkdir -p release/etc
mkdir -p release/usr/bin
mkdir -p release/usr/lib
mkdir -p release/usr/libexec

cp -R ./bluez-5.40/source/imx6ul/etc/* ./release/etc
cp -R ./bluez-5.40/source/imx6ul/usr/bin/* ./release/usr/bin
cp -R ./bluez-5.40/source/imx6ul/usr/lib/*.so* ./release/usr/lib
cp -R ./bluez-5.40/source/imx6ul/usr/libexec/* ./release/usr/libexec




