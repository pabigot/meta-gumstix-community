DESCRIPTION = "add udisk/udev rule to hide boot partition from udev"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
SRC_URI = "file://80-udisks-overo.rules"

do_install () {
	install -d ${D}${base_libdir}/udev/rules.d
	install -m 644 ${WORKDIR}/80-udisks-overo.rules ${D}${base_libdir}/udev/rules.d
}

FILES_${PN} = "${base_libdir}/udev/rules.d"
