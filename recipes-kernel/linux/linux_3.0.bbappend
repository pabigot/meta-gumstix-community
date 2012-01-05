FILESEXTRAPATHS := "${THISDIR}/linux-3.0"

COMPATIBLE_MACHINE_overo = "(overo)"

PARALLEL_MAKE = ""
PARALLEL_MAKEINST = ""

# We need our own increment
MACHINE_KERNEL_PR_append = "1"

SRC_URI_append_overo = " file://logo_linux_clut224.ppm \
"

S = "${WORKDIR}/git"

