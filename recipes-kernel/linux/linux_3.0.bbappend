FILESEXTRAPATHS := "${THISDIR}/linux-3.0"

COMPATIBLE_MACHINE_overo = "(overo)"

PV = "3.0.12"
# v3.0.12 tag
SRCREV_pn-${PN} = "ac6766564c0305ca020fe747dfd7dbdf0881369d"

PARALLEL_MAKE = ""
PARALLEL_MAKEINST = ""

# We need our own increment
MACHINE_KERNEL_PR_append = "1"

SRC_URI_append_overo = " file://logo_linux_clut224.ppm \
"

S = "${WORKDIR}/git"

