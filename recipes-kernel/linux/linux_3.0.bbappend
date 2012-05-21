FILESEXTRAPATHS := "${THISDIR}/linux-3.0"

COMPATIBLE_MACHINE_overo = "(overo)"

PV = "3.0.25"
# v3.0.25 tag
SRCREV_pn-${PN} = "9bf176a3e029ae7f2dc6feae185091525a988be2"

PARALLEL_MAKE = ""
PARALLEL_MAKEINST = ""

# We need our own increment
MACHINE_KERNEL_PR_append = "2"

SRC_URI_append_overo = " file://logo_linux_clut224.ppm \
"

S = "${WORKDIR}/git"

