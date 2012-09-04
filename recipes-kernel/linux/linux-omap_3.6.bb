require linux.inc

DESCRIPTION = "Linux kernel gumstix overo"
KERNEL_IMAGETYPE = "uImage"

COMPATIBLE_MACHINE = "(overo)"

DEFAULT_PREFERENCE = "-1"

# this is actually 3.6rc3+ but to keep package feeds happy we simply say 3.6
PV = "3.6"
SRCREV_pn-${PN} = "fea7a08acb13524b47711625eebea40a0ede69a0"

# The main PR is now using MACHINE_KERNEL_PR, for omap3 see conf/machine/include/omap3.inc
MACHINE_KERNEL_PR_append = "b"

FILESPATH =. "${FILE_DIRNAME}/linux-omap:${FILE_DIRNAME}/linux-omap/${MACHINE}:"

OVERO_BOOT_LOGO ?= "file://logo_linux_clut224.ppm"

SRC_URI += " \
    git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git;branch=master;protocol=git \
    \
    file://0001-Revert-ARM-OMAP-SoC-detection-remove-unused-cpu_is-m.patch \
    \
    file://board_init/0001-board-overo.c-double-NAND-partition-for-kernel-to-8M.patch \
    \
    file://USB/0002-board-overo.c-call-usb_musb_init-with-host-mode-as-d.patch \
    \
    file://TWL4030/0001-Add-power-off-support-for-the-TWL4030-companion.patch \
    \
    file://DSS/0001-OMAPDSS-OMAPFB-fix-framebuffer-console-colors.patch \
    \
    file://opp/0001-omap-overo-Add-opp-init.patch \
    file://opp/0002-omap3-Add-basic-support-for-720MHz-part.patch \
    file://opp/0003-board-overo.c-disable-1GHz-according-to-gumstix-reco.patch \
    \
    file://ADS7846/0001-ARM-OMAP2-ads7846-init-fix-fault-caused-by-freeing-pen-down-GPIO.patch \
    file://ADS7846/0002-drivers-input-touchscreen-ads7846-return-ENODEV-if-d.patch \
    \
    file://defconfig \
    ${OVERO_BOOT_LOGO} \
"

S = "${WORKDIR}/git"

PARALLEL_MAKEINST = ""
