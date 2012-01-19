#! /bin/sh

# write-card-overo.sh
# (c) Copyright 2012 Andreas Müller <schnitzeltony@gmx.de>
# Licensed under terms of GPLv2
#
# This script writes all data (MLO / u-boot / kernel / rootfs) to SDCard. To
# select card device and rootfs a dialog based GUI is used. To work properly
# the OE environment variable OE_BUILD_TMPDIR must be set.

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
	
	dialog --title 'Select rootfs'\
	--menu 'Move using [UP] [DOWN],[Enter] to select' 10 100 $iCount\
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

run_user() {
	if [ -z $OE_BUILD_TMPDIR ]; then
		echo "The environment variable $OE_BUILD_TMPDIR is not set. It is usually set befor running bitbake."
		exit 1
	fi

	if [ -z $DevicePath ]; then
		# DevicePath for memory card
		SelectCardDevice || exit 1
	fi

	if [ -z $RootFsFile ]; then
		# select rootfs
		SelectRootfs || exit 1
	fi
	RootParams="$DevicePath $RootFsFile"
}

run_root() {
	# device node valid?
	if [ ! -b $DevicePath ] ; then
		echo "$DevicePath is not a valid block device!"
		exit 1
	fi
	# rootfs valid?
	if [ ! -e $RootFsFile ] ; then
		echo "$RootFsFile can not be found!"
		exit 1
	fi

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

source `dirname $0`/tools.inc

DevicePath=$1
RootFsFile=$2

# On the 1st call: run user
# After the 2nd call: run root
RootParams='$DevicePath $RootFsFile'
chk_root&&run_root



