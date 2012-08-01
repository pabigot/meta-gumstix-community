FILESEXTRAPATHS := "${THISDIR}/linux-3.0"

COMPATIBLE_MACHINE_overo = "(overo)"

PV = "3.0.33"
# v3.0.33 tag
SRCREV_pn-${PN} = "6102ace32239ad2174ffbb7d60be8dafee7341a1"

PARALLEL_MAKE = ""
PARALLEL_MAKEINST = ""

# We need our own increment
MACHINE_KERNEL_PR_append = "3"

OVERO_BOOT_LOGO ?= "file://logo_linux_clut224.ppm"

SRC_URI_append_overo = " \
    ${OVERO_BOOT_LOGO} \
"

S = "${WORKDIR}/git"

