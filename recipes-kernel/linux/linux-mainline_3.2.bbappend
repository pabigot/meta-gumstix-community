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
MACHINE_KERNEL_PR_append = "0"

OVERO_BOOT_LOGO ?= "file://logo_linux_clut224.ppm"

SRC_URI_append_overo = "\
	${OVERO_BOOT_LOGO} \
"
