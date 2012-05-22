FILESEXTRAPATHS_prepend := "${THISDIR}/linux-mainline-3.2"

COMPATIBLE_MACHINE_overo = "(overo)"

PV = "3.2.16"
# v3.2.16 tag
SRCREV_pn-${PN} = "b1be7dd1ec231ae751d0ce3acd0d2e5760704a6f"

# TODO: Kernel currently only uses PARALLEL_MAKE (error occures on install)
PARALLEL_MAKE = ""
PARALLEL_MAKEINST = ""

# We need our own increment
MACHINE_KERNEL_PR_append = "0"

SRC_URI_append_overo = "\
	file://logo_linux_clut224.ppm \
"

S = "${WORKDIR}/git"

# set up how to use USB OTG
MUSB_MODE = "host"

do_configure_prepend() {

        if [ "${MUSB_MODE}" = "host" ]; then
            sed -i 's:CONFIG_USB_GADGET=y:# CONFIG_USB_GADGET is not set:g' ${WORKDIR}/defconfig
            sed -i 's:# CONFIG_USB_MUSB_HOST is not set:CONFIG_USB_MUSB_HOST=y:g' ${WORKDIR}/defconfig
            sed -i 's:CONFIG_USB_MUSB_PERIPHERAL=y:# CONFIG_USB_MUSB_PERIPHERAL is not set:g' ${WORKDIR}/defconfig
            sed -i 's:CONFIG_USB_MUSB_OTG=y:# CONFIG_USB_MUSB_OTG is not set:g' ${WORKDIR}/defconfig
            sed -i 's:# CONFIG_USB_MUSB_HDRC_HCD is not set:CONFIG_USB_MUSB_HDRC_HCD=y:g' ${WORKDIR}/defconfig
        fi

        if [ "${MUSB_MODE}" = "peripheral" ]; then
            sed -i 's:# CONFIG_USB_GADGET is not set:CONFIG_USB_GADGET=y:g' ${WORKDIR}/defconfig
            sed -i 's:CONFIG_USB_MUSB_HOST=y:# CONFIG_USB_MUSB_HOST is not set:g' ${WORKDIR}/defconfig
            sed -i 's:# CONFIG_USB_MUSB_PERIPHERAL is not set:CONFIG_USB_MUSB_PERIPHERAL=y:g' ${WORKDIR}/defconfig
            sed -i 's:CONFIG_USB_MUSB_OTG=y:# CONFIG_USB_MUSB_OTG is not set:g' ${WORKDIR}/defconfig
            sed -i 's:CONFIG_USB_MUSB_HDRC_HCD=y:# CONFIG_USB_MUSB_HDRC_HCD is not set:g' ${WORKDIR}/defconfig
        fi

        if [ "${MUSB_MODE}" = "otg" ]; then
            sed -i 's:# CONFIG_USB_GADGET is not set:CONFIG_USB_GADGET=y:g' ${WORKDIR}/defconfig
            sed -i 's:CONFIG_USB_MUSB_HOST=y:# CONFIG_USB_MUSB_HOST is not set:g' ${WORKDIR}/defconfig
            sed -i 's:CONFIG_USB_MUSB_PERIPHERAL=y:# CONFIG_USB_MUSB_PERIPHERAL is not set:g' ${WORKDIR}/defconfig
            sed -i 's:# CONFIG_USB_MUSB_OTG is not set:CONFIG_USB_MUSB_OTG=y:g' ${WORKDIR}/defconfig
            sed -i 's:CONFIG_USB_MUSB_HDRC_HCD=y:# CONFIG_USB_MUSB_HDRC_HCD is not set:g' ${WORKDIR}/defconfig
        fi

