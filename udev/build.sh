#!/bin/bash

#Cd udev-182
cd ./udev-182

#Import cross compile tool
CROSS_COMPILE_ENVIRONMENT_HOME=/opt/fsl-imx-x11/3.14.52-1.1.0
source ${CROSS_COMPILE_ENVIRONMENT_HOME}/environment-setup-cortexa7hf-vfp-neon-poky-linux-gnueabi
unset PKG_CONFIG_SYSROOT_DIR
./configure --prefix=/usr --sysconfdir=/etc --sbindir=/sbin  --host=arm-poky-linux-gnueabi --enable-rule_generator --disable-introspection --disable-keymap  --with-usb-ids-path=no --with-pci-ids-path=no --with-systemdsystemunitdir=no
echo "LDFLAGS += -lrt" >> Makefile
make
make install DESTDIR=${PWD}/imx6ul

make clean
make distclean
./configure --prefix=${CROSS_COMPILE_ENVIRONMENT_HOME}/sysroots/cortexa7hf-vfp-neon-poky-linux-gnueabi/usr --sysconfdir=${CROSS_COMPILE_ENVIRONMENT_HOME}/sysroots/cortexa7hf-vfp-neon-poky-linux-gnueabi/etc --sbindir=${CROSS_COMPILE_ENVIRONMENT_HOME}/sysroots/cortexa7hf-vfp-neon-poky-linux-gnueabi/sbin  --host=arm-poky-linux-gnueabi --enable-rule_generator --disable-introspection --disable-keymap  --with-usb-ids-path=no --with-pci-ids-path=no --with-systemdsystemunitdir=no
echo "LDFLAGS += -lrt" >> Makefile
make
make install


#Cd to origin path
cd ..

#Release
mkdir -p release/etc
mkdir -p release/usr/bin
mkdir -p release/usr/lib
mkdir -P release/usr/libexec

cp -R ./udev-182/imx6ul/etc/* ./release/etc
cp -R ./udev-182/imx6ul/usr/bin/* ./release/usr/bin
cp -R ./udev-182/imx6ul/usr/lib/*.so* ./release/usr/lib
cp -R ./udev-182/imx6ul/usr/libexec/* ./release/usr/libexec






