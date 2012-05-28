FILESEXTRAPATHS_prepend := "${THISDIR}/linux-mainline-3.2"

COMPATIBLE_MACHINE_overo = "(overo)"

PV = "3.2.18"
# v3.2.18 tag
SRCREV_pn-${PN} = "52c6b95f8a2edaff98b779f15b2f4d69b61b18b9"

# Overwrite meta-ti parallel make options on all tasks (install fails with 
# parallel make). So we have at least compile with standard PARALLEL_MAKE
# options.
EXTRA_OEMAKE = ""
# TODO: Kernel currently only uses PARALLEL_MAKE (error occures on install)
PARALLEL_MAKE = ""
#PARALLEL_MAKEINST = ""

# We need our own increment
MACHINE_KERNEL_PR_append = "1"

OVERO_BOOT_LOGO ?= "file://logo_linux_clut224.ppm"

SRC_URI_append_overo = "\
	file://TWL4030/0001-rtc-twl-add-support-for-backup-battery-recharge.patch \
	file://TWL4030/0002-soc-codecs-Enable-audio-capture-by-default-for-twl4030.patch \
	file://TWL4030/0003-soc-codecs-twl4030-Turn-on-mic-bias-by-default.patch \
	file://TWL4030/0004-omap-mmc-twl4030-move-clock-input-selection-prior-to-vcc-test.patch \
	file://TWL4030/0005-Add-power-off-support-for-the-TWL4030-companion.patch \
	file://TWL4030/0006-Enabling-Hwmon-driver-for-twl4030-madc.patch \
	\
	file://sakoman/0001-board-overo.c-use-sakoman-s-board-init-code.patch \
	\
	file://USB/0001-board-overo.c-call-usb_musb_init-with-host-mode-as-d.patch \
	${OVERO_BOOT_LOGO} \
"
