require linux.inc

DESCRIPTION = "Linux kernel gumstix overo"
KERNEL_IMAGETYPE = "uImage"

COMPATIBLE_MACHINE = "(overo)"

PV = "3.5-rc5"
SRCREV_pn-${PN} = "324974a124328bbbf5f6f275d9dac4e585fface0"

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

# Sadly perf is broken:
#| util/hist.c: In function '__hists__add_entry':
#| util/hist.c:240:27: error: invalid type argument of '->' (have 'struct hist_entry')
#| util/hist.c:241:23: error: invalid type argument of '->' (have 'struct hist_entry')
do_compile_perf() {
	:
}

do_install_perf() {
	:
}
