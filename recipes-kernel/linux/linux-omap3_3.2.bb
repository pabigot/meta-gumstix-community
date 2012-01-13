require linux.inc

DEFAULT_PREFERENCE = "-99"

DESCRIPTION = "Linux kernel for OMAP processors"
KERNEL_IMAGETYPE = "uImage"

PARALLEL_MAKE = ""
PARALLEL_MAKEINST = ""

BOOT_SPLASH ?= "logo_linux_clut224-generic.ppm"

S = "${WORKDIR}/git"

SRCREV = "d85ab3e68f9a0930be9b5f44ea34ec85f64985f2"
SRC_URI = "git://www.sakoman.com/git/linux-omap-2.6.git;branch=omap-3.2;protocol=git \
	   file://defconfig \
           file://${BOOT_SPLASH} \
           "


