# depedency_tools
This repo is used to manage all base related tools, but excluding python, nodejs, redis etc...
1. Install the cross compile tools first
2. Install perl
3. Use the verify.sh file to verify all case


#glib
    dependency:
    #libffi
    #zlib
    #perl ** (Do not need cross compile)
    
#dbus
    dependency:
    #expat
    #glib
    
#udev
    dependency:
    util-linux:libuuid/libblkid/libmount

