FILESEXTRAPATHS := "${THISDIR}/linux-3.0"

COMPATIBLE_MACHINE_overo = "(overo)"

PV = "3.0.17"
# v3.0.17 tag
SRCREV_pn-${PN} = "e9d23be2708477feeaec78e707c80441520c1ef6"

PARALLEL_MAKE = ""
PARALLEL_MAKEINST = ""

# We need our own increment
MACHINE_KERNEL_PR_append = "1"

SRC_URI_append_overo = " file://logo_linux_clut224.ppm \
"

S = "${WORKDIR}/git"

