#!/bin/bash

#Cd upower-0.99.4
cd ./upower-0.99.4

#Import cross compile tool
#CROSS_COMPILE_ENVIRONMENT_HOME=/opt/fsl-imx-x11/3.14.52-1.1.0
#source ${CROSS_COMPILE_ENVIRONMENT_HOME}/environment-setup-cortexa7hf-vfp-neon-poky-linux-gnueabi
#unset PKG_CONFIG_SYSROOT_DIR
#./configure --datarootdir=/usr/share --includedir=/usr/include --exec-prefix=/usr  --prefix= --host=arm-poky-linux-gnueabi 
#make
#make install DESTDIR=${PWD}/imx6ul

CROSS_COMPILE_ENVIRONMENT_HOME=/opt/fsl-imx-x11/3.14.52-1.1.0
source ${CROSS_COMPILE_ENVIRONMENT_HOME}/environment-setup-cortexa7hf-vfp-neon-poky-linux-gnueabi
unset PKG_CONFIG_SYSROOT_DIR
./configure --prefix=/usr --sysconfdir=/etc  --localstatedir=/var --with-udevrulesdir=/etc/UPower --host=arm-poky-linux-gnueabi 
make
make install DESTDIR=${PWD}/imx6ul



#Cd to origin path
cd ..

#Release
mkdir -p release/etc
mkdir -p release/var
mkdir -p release/usr/bin
mkdir -p release/usr/lib
mkdir -p release/usr/libexec

cp -R ./upower-0.99.4/imx6ul/etc/* ./release/etc
cp -R ./upower-0.99.4/imx6ul/var/* ./release/var
cp -R ./upower-0.99.4/imx6ul/usr/bin/* ./release/usr/bin
cp -R ./upower-0.99.4/imx6ul/usr/lib/*.so* ./release/usr/lib
cp -R ./upower-0.99.4/imx6ul/usr/libexec/* ./release/usr/libexec






