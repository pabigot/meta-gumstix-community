require linux.inc
require linux-common.inc

COMPATIBLE_MACHINE = "(overo)"

# The main PR is now using MACHINE_KERNEL_PR, for omap3 see conf/machine/include/omap3.inc
MACHINE_KERNEL_PR_append = "a"

PV = "${KERNEL_PV_OMAP_36}"

FILESPATH =. "${FILE_DIRNAME}/linux-omap-3.6:${FILE_DIRNAME}/linux-omap-3.6/${MACHINE}:"

SRC_URI = " \
    ${SRC_URI_COMMON} \
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
"

PARALLEL_MAKEINST = ""
