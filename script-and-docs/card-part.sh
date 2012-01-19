#! /bin/sh

# part-card.sh
# (c) Copyright 2012 Andreas Müller <schnitzeltony@gmx.de>
# Licensed under terms of GPLv2
#
# This script prepares partitions on SDCards. It wraps
# http://omappedia.org/wiki/Minimal-FS_SD_Configuration by dialog based GUI.

# for debugging set DEBUG=echo
DEBUG=

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

# Selection dialog
run_user() {
	if [ -z $DevicePath ]; then
		SelectDev || exit 1
	elif [ $# -gt 1 ]; then
		echo "Usage: $0 [Card device path]"
		exit 1;
	fi

}

# Write data to card
run_root() {
	# device node valid?
	if [ ! -b $DevicePath ] ; then
		echo "$DevicePath is not a valid block device!"
	fi

	# check if the card is currently mounted
	MOUNTSTR=$(mount | grep $DevicePath)
	if [ -n "$MOUNTSTR" ] ; then
	    echo -e "\n$DevicePath is currenly mounted. Needs unmounting..."
	    $DEBUG umount -f ${DevicePath}?*
	fi

	$DEBUG dd if=/dev/zero of=$DevicePath bs=1024 count=1024

	# force 512 bytes / sector
	export LC_ALL=C
	SIZE=`fdisk -l $DevicePath | grep Disk | grep bytes | awk '{print $5}'`
	echo "Disk size: $SIZE bytes"
	CYLINDERS=`echo $SIZE/255/63/512 | bc`
	echo "Cylinders: $CYLINDERS"
	# setup partitions
	{
	echo ,9,0x0C,*
	echo ,,,-
	} | $DEBUG sfdisk -D -H 255 -S 63 -C $CYLINDERS $DevicePath
	# write partitions
	$DEBUG mkfs.vfat -F 32 -n "boot" ${DevicePath}1
	$DEBUG mke2fs -j -t ext3 -L "rootfs" ${DevicePath}2

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
		echo -e "All data currenly stored on $DevicePath will be overwritten!!"
		echo -e "\nEnter valid root password if you are sure you want to continue"

		# Call this prog as root
		exec su -c "${0} ${DevicePath}" 
		return 1	# sice we're 'execing' above, we wont reach this exit
				# unless something goes wrong.
	fi
}

DevicePath=$1
# On the 1st call: run user
# After the 2nd call: run root
chk_root&&run_root


















