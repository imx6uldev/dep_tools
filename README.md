# depedency_tools
This repo is used to manage all base related tools, but excluding python, nodejs, redis etc...
1. Install the cross compile tools first
2. Install perl/cmake
3. Use the verify.sh file to verify all case

#glib
    dependency:
    #libffi
    #zlib
    #perl ** (Do not need cross compile)
    #glib
    
#dbus
    dependency:
    #expat
    #glib
    #dbus
    
#udev
    dependency:
    #util-linux:libuuid/libblkid/libmount
    #kmod
    #libusb
    #udev
    
#upower
    dependency:
    #dbus
    #udev
    #upower

#libical
    #cmake ** (Do not need cross compile)
    #libical
    
#readline
    dependency:
    #ncurses
    #readline  
    
#bluez
    dependency:
    #glib
    #dbus
    #libical
    #readline
    #bluez
    

