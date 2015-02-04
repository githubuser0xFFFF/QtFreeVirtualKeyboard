#!/bin/sh


# some configuration variables - adjust them to your application
export APP_DIR=ledarray
export APP_BINARY=bbb_ledarray
DTB=bbb-ledarray-linux3.12.dtb

# some variables we need
export PROJECT_DIR=..

export BUILDROOT=/home/user/Coding/buildroot_git
export BUILDROOT_STAGING=$BUILDROOT/output/staging
BUILDROOT_IMAGES=$BUILDROOT/output/images

BOOTDIR=/media/user/BOOT
TFTP_DIR=/home/user/BBB/tftp
BUILDROOT_CETONI=/home/user/Coding/buildroot-cetoni
BBB_DIR=$BUILDROOT_CETONI/board/beaglebone


# check if SD card is properly mounted
check_sd_mount() {
	if [ "$target" = "n" ]
    then
		return;
    fi

	mountpoint="/media/user"	
	volume="$mountpoint/BOOT"
	if ! mount|grep $volume; then
		echo "Volume $volume not mounted"	
		exit;
	fi

	volume="$mountpoint/LINUX"
	if ! mount|grep $volume; then
		echo "Volume $volume not mounted"	
		exit;
	fi

	volume="$mountpoint/DATA"
	if ! mount|grep $volume; then
		echo "Volume $volume not mounted"	
		exit;
	fi
}


# some functions we need
set_sd_target_vars() {
	export ROOTFS_DIR=/media/user/LINUX
	export APP_PATH=$ROOTFS_DIR/$APP_DIR
}

set_nfs_target_vars() {
	export ROOTFS_DIR=/home/user/BBB/rootfs
	export APP_PATH=$ROOTFS_DIR/$APP_DIR
}


#------------------------------------------------------------------------------
# Install buildroot to SD or NFS
#------------------------------------------------------------------------------
install_buildroot () {
	if [ ! -d "$BOOTDIR" ] && [ "$target" = "s" ]
	then
		echo "SD card not mounted - canceling buildroot installation"
		return;	
	fi
	
	# clear rootfs and boot dir
	rm -r $ROOTFS_DIR/*
	if [ -d "$BOOTDIR" ]
    then
    	rm -r $BOOTDIR/*  
    fi

	# extract root filesystem to rootfs dir
	tar -xf $BUILDROOT_IMAGES/rootfs.tar -C $ROOTFS_DIR
	mv $ROOTFS_DIR/boot/$DTB $ROOTFS_DIR/boot/am335x-boneblack.dtb

    if [ -d "$BOOTDIR" ]
    then
	    cp $BUILDROOT_IMAGES/MLO $BOOTDIR
		cp $BUILDROOT_IMAGES/u-boot.img $BOOTDIR
		cp $BBB_DIR/uEnv_zImage_Debian.txt $BOOTDIR/uEnv.txt
		echo "Installing $BBB_DIR/uEnv_zImage_Debian.txt"
    fi

	# copy some additional helper scripts
	cp $BBB_DIR/etc/wpa_supplicant.conf $ROOTFS_DIR/etc/wpa_supplicant.conf
	cp -r -f $BBB_DIR/usr/bin/* $ROOTFS_DIR/usr/bin
	cp -vf $BUILDROOT_CETONI/scripts/bbb-SD-eMMC-copy.sh $ROOTFS_DIR/usr/sbin/
}


#------------------------------------------------------------------------------
# Install cetoni libraries to SD or NFS
#------------------------------------------------------------------------------
install_cetoni_libs() {
	# set write permissions for rootfs /usr/lib and /usr/bin for development
	# system
	if [ "$target" = "n" ]
	then
		chmod o+w $ROOTFS_DIR/usr/lib
		chmod o+w $ROOTFS_DIR/usr/bin
		cp -f -av $BUILDROOT_STAGING/usr/bin/*_test $ROOTFS_DIR/usr/bin
	fi
	
	# copy libraries
	cp -f -av $BUILDROOT_STAGING/usr/lib/libusl* $ROOTFS_DIR/usr/lib
	cp -f -av $BUILDROOT_STAGING/usr/lib/libcanoo* $ROOTFS_DIR/usr/lib
	cp -f -av $BUILDROOT_STAGING/usr/lib/liblabbcan* $ROOTFS_DIR/usr/lib
	cp -f -av $BUILDROOT_STAGING/usr/lib/liblabbCAN* $ROOTFS_DIR/usr/lib
	cp -f -av $BUILDROOT_STAGING/usr/lib/libcsi* $ROOTFS_DIR/usr/lib
	cp -f -av $BUILDROOT_STAGING/usr/lib/libled_array_api* $ROOTFS_DIR/usr/lib
}


#------------------------------------------------------------------------------
# Installs the application to SD or NFS
#------------------------------------------------------------------------------
install_app() {
    echo "APP_PATH = $APP_PATH"
	#mkdir -p $APP_PATH/data/embedded_linux
	#mkdir -p $APP_PATH/userdata
	
	# copy application
	#cp -f -av $PROJECT_DIR/$APP_BINARY $APP_PATH
	#cp -f -av $PROJECT_DIR/data/start_app.sh $APP_PATH
	#cp -f -av $PROJECT_DIR/data/embedded_linux/* $APP_PATH/data/embedded_linux
	#chmod 777 $APP_PATH/$APP_BINARY
	
	# copy install script
	#if [ "$target" = "s" ]
	#then
	#	cp -f -av S45application $ROOTFS_DIR/etc/init.d/
	#fi
	#cp -f -av S30usb $ROOTFS_DIR/etc/init.d/
    #cp -f -av S41usbgadget $ROOTFS_DIR/etc/init.d/
	#cp -f -av interfaces $ROOTFS_DIR/etc/network/
}



# The script must be run as root to have access to root file system ------------
if ! id | grep -q root; 
then
	echo "must be run as root"
	exit
fi

while true; do
    echo "What do you want to install? (c=complete | a=app | b=buildroot | l=cetoni libs)"
    read -p ": " installtype
    case $installtype in
        [c]* ) break;;
        [a]* ) break;;
		[b]* ) break;;
		[l]* ) break;;
        * ) echo "Please select a valid ID.";;
    esac
done

while true; do
    read -p "Where to you want to install? (s=SDCard | n=NFS): " target
    case $target in
        [s]* ) set_sd_target_vars; break;;
        [n]* ) set_nfs_target_vars; break;;
        * ) echo "Please select a valid ID.";;
    esac
done

check_sd_mount


if [ "$installtype" = "b" ] || [ "$installtype" = "c" ]
then
	install_buildroot
fi

if [ "$installtype" = "l" ] || [ "$installtype" = "c" ]
then
	install_cetoni_libs
fi

if [ "$installtype" = "a" ] || [ "$installtype" = "c" ]
then
	install_app
fi



