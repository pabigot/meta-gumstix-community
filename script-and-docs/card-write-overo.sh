#! /bin/sh

# write-card-overo.sh
# (c) Copyright 2012 Andreas Müller <schnitzeltony@gmx.de>
# Licensed under terms of GPLv2
#
# This script writes all data (MLO / u-boot / kernel / rootfs) to SDCard. To
# select card device and rootfs a dialog based GUI is used. To work properly
# the OE envirnment variable OE_BUILD_TMPDIR must be set.

MACHINE=overo

SelectRootfs() {
	iCount=0
	strSelection=
	for BuildPath in ${OE_BUILD_TMPDIR}-*; do
		echo $BuildPath
		for i in `find ${BuildPath}/deploy/images/${MACHINE} -name *.tar.bz2 | sort` ; do
			iCount=`expr $iCount + 1`
			RootFileNameArr[${iCount}]=$i
			strSelection="$strSelection $iCount "`basename $i`
		done
	done

	if [ $iCount -eq 0 ]; then
		echo "No rootfs files found in ${OE_BUILD_TMPDIR}-\*"
		exit 1
	fi
	
	dialog --title 'Select rootfs' --menu "Move using [UP] [DOWN],[Enter] to\
	Select" 10 100 $iCount\
	${strSelection}\
	2>/tmp/menuitem.$$

	# get OK/Cancel
	sel=$?
	# get selected menuitem
	menuitem=`cat /tmp/menuitem.$$`
	rm -f /tmp/menuitem.$$

	# Cancel Button or <ESC>
	if [ $sel -eq 1 -o $sel -eq 255 ] ; then
		echo Cancel selected 1
		return 1
	fi
	RootFsFile=${RootFileNameArr[$menuitem]}
	echo 
}

SelectDev() {
	iCount=0
	for dev in /dev/sd[a-z] ; do
		DeviceFile=`basename $dev`
		# we are only interested in removable devices
		if [ `cat  /sys/block/$DeviceFile/removable` = '1' ]; then
			iCount=`expr $iCount + 1`
			DevicePathArr[${iCount}]=$dev
			strSelection="$strSelection $iCount $dev"
		fi
	done

	if [ $iCount -eq 0 ]; then
		echo 'No removable devices found!'
		exit 1
	fi

	dialog --title 'Select card device' --menu "Move using [UP] [DOWN],[Enter] to\
	Select" 10 100 $iCount\
	${strSelection}\
	2>/tmp/menuitem.$$

	# get OK/Cancel
	sel=$?
	# get selected menuitem
	menuitem=`cat /tmp/menuitem.$$`
	rm -f /tmp/menuitem.$$

	# Cancel Button or <ESC>
	if [ $sel -eq 1 -o $sel -eq 255 ] ; then
		echo Cancel selected 2
		return 1
	fi
	DevicePath=${DevicePathArr[$menuitem]}
}

# Selection dialogs
run_user() {
	if [ -z $OE_BUILD_TMPDIR ]; then
		echo "The environment variable $OE_BUILD_TMPDIR is not set. It is usually set befor running bitbake."
		exit 1
	fi

	if [ -z $DevicePath ]; then
		# DevicePath for memory card
		SelectDev || exit 1
	fi

	if [ -z $RootFsFile ]; then
		# select rootfs
		SelectRootfs || exit 1
	fi
}

# Write data to card
run_root() {
	IMAGEDIR=$(dirname $RootFsFile)

	# check if the card is currently mounted
	MOUNTSTR=$(mount | grep $DevicePath)
	if [ -n "$MOUNTSTR" ] ; then
	    echo -e "\n$DevicePath is currenly mounted. Needs unmounting..."
	    umount -f ${DevicePath}?*
	fi

	# create temp mount path
	if [ ! -d /tmp/tmp_mount$$ ] ; then
		mkdir /tmp/tmp_mount$$
	fi

	# kernel & bootloader
	mount ${DevicePath}1 /tmp/tmp_mount$$ || exit 1
	rm -rf /tmp/tmp_mount$$/*
	cp ${IMAGEDIR}/MLO-${MACHINE} /tmp/tmp_mount$$/MLO
	cp ${IMAGEDIR}/u-boot-${MACHINE}.img /tmp/tmp_mount$$/u-boot.img
	cp ${IMAGEDIR}/uImage-${MACHINE}.bin /tmp/tmp_mount$$/uImage
	umount ${DevicePath}1 || exit 1

	# rootfs
	mount ${DevicePath}2 /tmp/tmp_mount$$ || exit 1
	rm -r /tmp/tmp_mount$$/*
	cd /tmp/tmp_mount$$
	tar xvjf $RootFsFile
	cd ..
	umount ${DevicePath}2 || exit 1

	rm -rf /tmp/tmp_mount$$
}


# Run this script as root if not already.
chk_root() {
	# we are not already root?
	if [ ! $( id -u ) -eq 0 ]; then
		# do all non root operations
		run_user
		# abort in case make was performed without success
		if [ $? -ne 0 ] ; then
			# wait for any key
			#read -p "Press <RETURN> to close shell…"
			# abort
			return 1
		fi


		clear
		echo "Card device: $DevicePath"
		echo "RootFs: "`basename $RootFsFile`
		echo -e "\nAll data currenly stored on $DevicePath will be overwritten!!"
		echo -e "\nEnter valid root password if you are sure you want to continue"

		# Call this prog as root
		exec su -c "${0} ${DevicePath} ${RootFsFile}"
		return 1	# sice we're 'execing' above, we wont reach this exit
				# unless something goes wrong.
	fi
}

DevicePath=$1
RootFsFile=$2
# On the 1st call: run user
# After the 2nd call: run root
chk_root&&run_root



