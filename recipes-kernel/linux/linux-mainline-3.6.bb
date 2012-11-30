require linux.inc
require linux-common.inc

COMPATIBLE_MACHINE = "(overo)"

PV = "${KERNEL_PV_MAINLINE_36}"

FILESPATH =. "${FILE_DIRNAME}/linux-mainline-3.6:${FILE_DIRNAME}/linux-mainline-3.6/${MACHINE}:"

SRC_URI = " \
    ${SRC_URI_COMMON} \
    \
    file://0001-Revert-ARM-OMAP-SoC-detection-remove-unused-cpu_is-m.patch \
    \
    file://board_init/0001-board-overo.c-double-NAND-partition-for-kernel-to-8M.patch \
    \
    file://USB/0001-board-overo.c-call-usb_musb_init-with-host-mode-as-d.patch \
    \
    file://TWL4030/0001-Add-power-off-support-for-the-TWL4030-companion.patch \
    \
    file://opp/0001-omap-overo-Add-opp-init.patch \
    file://opp/0002-omap3-Add-basic-support-for-720MHz-part.patch \
    file://opp/0003-board-overo.c-disable-1GHz-according-to-gumstix-reco.patch \
    \
    file://ADS7846/0001-drivers-input-touchscreen-ads7846-return-ENODEV-if-d.patch \
    file://ADS7846/0002-board-overo.c-debounce-ADS7846.patch \
    \
    file://smsc/0001-drivers-net-smsc911x-return-ENODEV-if-device-is-not-.patch \
    \
    file://DSS/0001-OMAPDSS-fix-registering-the-vsync-isr-in-apply.patch \
"

PARALLEL_MAKEINST = ""
