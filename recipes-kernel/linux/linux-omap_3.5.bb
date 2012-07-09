require linux.inc

DESCRIPTION = "Linux kernel gumstix overo"
KERNEL_IMAGETYPE = "uImage"

COMPATIBLE_MACHINE = "(overo)"

PV = "3.5-rc6"
SRCREV_pn-${PN} = "c3662bf17922301ea80aa301c38cf9a64e68d656"

# The main PR is now using MACHINE_KERNEL_PR, for omap3 see conf/machine/include/omap3.inc
MACHINE_KERNEL_PR_append = "a"

FILESPATH =. "${FILE_DIRNAME}/linux-omap:${FILE_DIRNAME}/linux-omap/${MACHINE}:"

OVERO_BOOT_LOGO ?= "file://logo_linux_clut224.ppm"

SRC_URI += " \
	git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git;branch=master;protocol=git \
	\
	file://0001-Revert-ARM-OMAP-SoC-detection-remove-unused-cpu_is-m.patch \
	\
	file://defconfig \
	${OVERO_BOOT_LOGO} \
"

SRC_URI_append_beagleboard = " file://logo_linux_clut224.ppm \
"

S = "${WORKDIR}/git"
