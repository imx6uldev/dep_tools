#!/bin/bash

#Build glib
repo_list=(libffi zlib)
cd libffi 
./build.sh 2>err.log
cd ..

cd zlib
./build.sh 2>err.log
cd ..

cd glib
./build.sh 2>err.log
cd ..

#Build dbus
cd expat
./build.sh 2>err.log
cd ..

cd dbus
./build.sh 2>err.log
cd ..

#Build udev
cd ./util-linux
./build.sh 2>err.log
cd ..

cd ./kmod
./build.sh 2>err.log
cd ..

cd ./libusb
./build.sh 2>err.log
cd ..

cd ./udev
./build.sh 2>err.log
cd ..

cd ./upower
./build.sh 2>err.log
cd ..